local ADDON_NAME, NAMESPACE = ...
ThreatPlates = NAMESPACE.ThreatPlates

------------------------
-- Combo Point Widget --
------------------------
local path = "Interface\\AddOns\\TidyPlates_ThreatPlates\\Widgets\\ComboPointWidget\\"

local WidgetList = {}

---------------------------------------------------------------------------------------------------
-- Threat Plates functions
---------------------------------------------------------------------------------------------------

local function enabled()
	local db = TidyPlatesThreat.db.profile.comboWidget
	return db.ON
end

---------------------------------------------------------------------------------------------------
-- TidyPlates ComboPointWidget functions
---------------------------------------------------------------------------------------------------

local function GetComboPointTarget()
	if UnitCanAttack("player", "target") then
		local points = GetComboPoints("player", "target")
		local maxPoints = UnitPowerMax("player", 4)

		return points, maxPoints
	end
end

local function GetChiTarget()
	if UnitCanAttack("player", "target") then

		if GetSpecialization() ~= SPEC_MONK_WINDWALKER then return end

		local points = UnitPower("player", SPELL_POWER_CHI)
		local maxPoints = UnitPowerMax("player", SPELL_POWER_CHI)

		return points, maxPoints

	end
end

local function GetPaladinHolyPowner()
	if UnitCanAttack("player", "target") then

		if GetSpecialization() ~= SPEC_PALADIN_RETRIBUTION then return end

		local points = UnitPower("player", SPELL_POWER_HOLY_POWER)
		local maxPoints = UnitPowerMax("player", SPELL_POWER_HOLY_POWER)

		return points, maxPoints
	end
end

local GetResourceOnTarget
local LocalName, PlayerClass = UnitClass("player")

if PlayerClass == "MONK" then
	GetResourceOnTarget = GetChiTarget
elseif PlayerClass == "ROGUE" then
	GetResourceOnTarget = GetComboPointTarget
elseif PlayerClass == "DRUID" then
	GetResourceOnTarget = GetComboPointTarget
-- Added holy power as combo points for retribution paladin
elseif PlayerClass == "PALADIN" then
	GetResourceOnTarget = GetPaladinHolyPowner
else
	GetResourceOnTarget = function() end
end

-- Update Graphics - overwritten
local function UpdateWidgetFrame(frame)
	local points, maxPoints = GetResourceOnTarget()

	if points and points > 0 and enabled() then
		local db = TidyPlatesThreat.db.profile.comboWidget

		frame.Icon:SetTexture(path..points)
		frame:SetScale(db.scale)
		frame:SetPoint("CENTER", frame:GetParent(), "CENTER", db.x, db.y)
		frame:Show()

		frame:Show()
	else
		frame:_Hide()
	end
end

-- Context
local function UpdateWidgetContext(frame, unit)
	local guid = unit.guid

	-- Add to Widget List
	if guid then

		if frame.guid then WidgetList[frame.guid] = nil end
		frame.guid = guid
		WidgetList[guid] = frame
	end

	-- Update Widget
	if UnitGUID("target") == guid then
		UpdateWidgetFrame(frame)
	else
		frame:_Hide()
	end
end

local function ClearWidgetContext(frame)
	local guid = frame.guid
	if guid then
		WidgetList[guid] = nil
		frame.guid = nil
	end
end

-- Watcher Frame
local WatcherFrame = CreateFrame("Frame", nil, WorldFrame )
local isEnabled = false
WatcherFrame:RegisterEvent("UNIT_COMBO_POINTS")
WatcherFrame:RegisterEvent("UNIT_POWER")
WatcherFrame:RegisterEvent("UNIT_DISPLAYPOWER")
WatcherFrame:RegisterEvent("UNIT_AURA")
WatcherFrame:RegisterEvent("UNIT_FLAGS")

local function WatcherFrameHandler(frame, event, unitid)
		local guid = UnitGUID("target")
		if UnitExists("target") then
			local widget = WidgetList[guid]
			if widget then UpdateWidgetFrame(widget) end				-- To update all, use: for guid, widget in pairs(WidgetList) do UpdateWidgetFrame(widget) end
		end
end

local function EnableWatcherFrame(arg)
	if arg then
		WatcherFrame:SetScript("OnEvent", WatcherFrameHandler); isEnabled = true
	else WatcherFrame:SetScript("OnEvent", nil); isEnabled = false end
end

-- Widget Creation
local function CreateWidgetFrame(parent)
	-- Required Widget Code
	local frame = CreateFrame("Frame", nil, parent)
	frame:Hide()

	-- Custom Code
	frame:SetHeight(64)
	frame:SetWidth(64)

	frame.Icon = frame:CreateTexture(nil, "OVERLAY")

	frame:SetFrameLevel(parent:GetFrameLevel() + 2)
	local db = TidyPlatesThreat.db.profile.comboWidget
	frame:SetPoint("CENTER", parent, "CENTER", db.x, db.y)
	frame:SetScale(db.scale)
	frame.Icon:SetAllPoints(frame)
	-- End Custom Code

	-- Required Widget Code
	frame.UpdateContext = UpdateWidgetContext
	frame.Update = UpdateWidgetFrame
	frame._Hide = frame.Hide
	frame.Hide = function() ClearWidgetContext(frame); frame:_Hide() end
	if not isEnabled then EnableWatcherFrame(true) end
	return frame

end

ThreatPlatesWidgets.RegisterWidget("ComboPointWidget", CreateWidgetFrame, true, enabled)
