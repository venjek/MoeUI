local mod	= DBM:NewMod("Kologarn", "DBM-Ulduar")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 234 $"):sub(12, -3))
mod:SetCreatureID(32930)--, 32933, 32934
mod:SetEncounterID(1137)
mod:SetModelID(28638)
mod:SetUsedIcons(5, 6, 7, 8)
--mod:SetMinSyncRevision(4623)
mod:SetMinSyncRevision(7)--Could break if someone is running out of date version with higher revision

mod:RegisterCombat("combat")

mod:RegisterEventsInCombat(
	"SPELL_AURA_APPLIED",
	"SPELL_AURA_APPLIED_DOSE",
	"SPELL_AURA_REMOVED",
	"SPELL_DAMAGE",
	"SPELL_MISSED",
	"RAID_BOSS_WHISPER",
	"CHAT_MSG_ADDON",
	"UNIT_DIED"
)

mod:SetBossHealthInfo(
	32930, L.Health_Body,
	32934, L.Health_Right_Arm,
	32933, L.Health_Left_Arm
)

local warnFocusedEyebeam		= mod:NewTargetAnnounce(63346, 3)
local warnGrip					= mod:NewTargetAnnounce(64292, 2)
local warnCrunchArmor			= mod:NewTargetAnnounce(64002, 2)

local specWarnCrunchArmor2		= mod:NewSpecialWarningStack(64002, false, 2)
local specWarnEyebeam			= mod:NewSpecialWarningRun(63346, nil, nil, nil, 4)
local yellBeam					= mod:NewYell(63346)

local timerCrunch10             = mod:NewTargetTimer(6, 63355)
local timerNextShockwave		= mod:NewCDTimer(18, 63982, nil, nil, nil, 2)
local timerNextEyebeam			= mod:NewCDTimer(17.5, 63346, nil, nil, nil, 3)--Experimental.
local timerNextGrip				= mod:NewCDTimer(20, 64292, nil, nil, nil, 3)
local timerRespawnLeftArm		= mod:NewTimer(48, "timerLeftArm", nil, nil, nil, 1)
local timerRespawnRightArm		= mod:NewTimer(48, "timerRightArm", nil, nil, nil, 1)
local timerTimeForDisarmed		= mod:NewTimer(10, "achievementDisarmed")	-- 10 HC / 12 nonHC

mod:AddBoolOption("HealthFrame", true)
mod:AddBoolOption("SetIconOnGripTarget", true)
mod:AddBoolOption("SetIconOnEyebeamTarget", true)

mod.vb.disarmActive = false

local function armReset(self)
	self.vb.disarmActive = false
end

function mod:UNIT_DIED(args)
	if self:GetCIDFromGUID(args.destGUID) == 32934 then 		-- right arm
		timerRespawnRightArm:Start()
		timerNextGrip:Cancel()
		if not self.vb.disarmActive then
			self.vb.disarmActive = true
			if self:IsDifficulty("normal10") then
				timerTimeForDisarmed:Start(12)
				self:Schedule(12, armReset, self)
			else
				timerTimeForDisarmed:Start()
				self:Schedule(10, armReset, self)
			end
		end
	elseif self:GetCIDFromGUID(args.destGUID) == 32933 then		-- left arm
		timerRespawnLeftArm:Start()
		if not self.vb.disarmActive then
			self.vb.disarmActive = true
			if self:IsDifficulty("normal10") then
				timerTimeForDisarmed:Start(12)
				self:Schedule(12, armReset, self)
			else
				timerTimeForDisarmed:Start()
				self:Schedule(10, armReset, self)
			end
		end
	end
end

function mod:SPELL_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId)
	if (spellId == 63783 or spellId == 63982) and timerNextShockwave:GetTime() == 0 then
		timerNextShockwave:Start()
	elseif (spellId == 63346 or spellId == 63976) and destGUID == UnitGUID("player") and self:AntiSpam() then
		specWarnEyebeam:Show()
	end
end
mod.SPELL_MISSED = mod.SPELL_DAMAGE

function mod:RAID_BOSS_WHISPER(msg)
	if msg:find(L.FocusedEyebeam) then
		specWarnEyebeam:Show()
		yellBeam:Yell()
	end
end

--per usual, use transcriptor message to get messages from both bigwigs and DBM, all without adding comms to this mod at all
function mod:CHAT_MSG_ADDON(prefix, msg, channel, targetName)
	if prefix ~= "Transcriptor" then return end
	if msg:find(L.FocusedEyebeam) then--
		targetName = Ambiguate(targetName, "none")
		if self:AntiSpam(5, targetName) then--Antispam sync by target name, since this doesn't use dbms built in onsync handler.
			warnFocusedEyebeam:Show(targetName)
			if self.Options.SetIconOnEyebeamTarget then
				self:SetIcon(targetName, 5, 8) 
			end
		end
	end
end

local gripTargets = {}
function mod:GripAnnounce()
	warnGrip:Show(table.concat(gripTargets, "<, >"))
	table.wipe(gripTargets)
end
function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(64290, 64292) then
		if self.Options.SetIconOnGripTarget then
			self:SetIcon(args.destName, 8 - #gripTargets, 10)
		end
		table.insert(gripTargets, args.destName)
		self:UnscheduleMethod("GripAnnounce")
		if #gripTargets >= 3 then
			self:GripAnnounce()
		else
			self:ScheduleMethod(0.2, "GripAnnounce")
		end
	elseif args:IsSpellID(64002, 63355) then	-- Crunch Armor
        warnCrunchArmor:Show(args.destName)
		if self:IsDifficulty("heroic10") then
            timerCrunch10:Start(args.destName)  -- We track duration timer only in 10-man since it's only 6sec and tanks don't switch.
		end
    end
end

function mod:SPELL_AURA_APPLIED_DOSE(args)
	if args.spellId == 64002 then		        -- Crunch Armor (25-man only)
		warnCrunchArmor:Show(args.destName)
        if args.amount >= 2 then 
            if args:IsPlayer() then
                specWarnCrunchArmor2:Show(args.amount)
            end
		end
	end
end

function mod:SPELL_AURA_REMOVED(args)
	if args:IsSpellID(64290, 64292) then
		self:SetIcon(args.destName, 0)
    end
end
