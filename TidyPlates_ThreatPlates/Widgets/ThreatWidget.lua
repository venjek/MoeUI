local _, ns = ...
local t = ns.ThreatPlates

-------------------
-- Threat Widget --
-------------------
local path = "Interface\\AddOns\\TidyPlates_ThreatPlates\\Widgets\\ThreatWidget\\"

local function enabled()
	local db = TidyPlatesThreat.db.profile.threat.art
	return db.ON
end

-- Threat Widget
local function UpdateThreatWidget(frame, unit)
	if not InCombatLockdown() then frame:Hide() end;
	local threatLevel
	if TidyPlatesThreat:GetSpecRole() then -- Tanking uses regular textures / swapped for dps / healing
		threatLevel = unit.threatSituation
	else
		if unit.threatSituation == "HIGH" then
			threatLevel = "LOW"
		elseif unit.threatSituation == "LOW" then
			threatLevel = "HIGH"
		elseif unit.threatSituation == "MEDIUM" then
			threatLevel = "MEDIUM"
		end
	end
	if enabled() then
		local prof = TidyPlatesThreat.db.profile.threat
		if unit.isMarked and prof.marked.art then
			frame:Hide()
		else
			local style = TidyPlatesThreat.SetStyle(unit)
			if ((style == "dps") or (style == "tank") or (style == "unique")) and InCombatLockdown() and (unit.class == "UNKNOWN" or unit.type == "NPC") then
				frame.Texture:SetTexture(path..prof.art.theme.."\\"..threatLevel)
				frame:Show()
			end
		end
	else
		frame:Hide()
	end
end

local function CreateThreatArtWidget(parent)
	local frame = CreateFrame("Frame", nil, parent)
	frame:SetFrameLevel(parent.bars.healthbar:GetFrameLevel()+2)
	frame:SetWidth(256)
	frame:SetHeight(64)
	frame:SetPoint("CENTER",parent,"CENTER")
	frame.Texture = frame:CreateTexture(nil, "OVERLAY")
	frame.Texture:SetAllPoints(frame)
	frame:Hide()
	frame.Update = UpdateThreatWidget
	return frame
end

ThreatPlatesWidgets.RegisterWidget("ThreatArtWidget",CreateThreatArtWidget,false,enabled)
