local _, ns = ...
local ycc = ns.ycc
local _VIEW

local function setview(view)
    _VIEW = view
end

local function update()
    _VIEW = _VIEW or GetCVar'guildRosterView'
    local playerArea = GetRealZoneText()
    local buttons = GuildRosterContainer.buttons

    for i, button in ipairs(buttons) do
        -- why the fuck no continue?
        if(button:IsShown() and button.online and button.guildIndex) then
            if(_VIEW == 'tradeskill') then
                local skillID, isCollapsed, iconTexture, headerName, numOnline, numVisible, numPlayers, playerDisplayName, playerFullName, class, online, zone, skill, classFileName, isMobile, isAway = GetGuildTradeSkillInfo(button.guildIndex)
                if((not headerName) and playerName) then
                    if(zone == playerArea) then
                        button.string2:SetText('|cff00ff00' .. zone)
                    end
                end
            else
                local name, rank, rankIndex, level, class, zone, note, officernote, online, status, classFileName, achievementPnts, achievementRank, isMobile, canSoR, repStanding = GetGuildRosterInfo(button.guildIndex)
                if(_VIEW == 'playerStatus') then
                    button.string1:SetText(ycc.diffColor[level] .. level)
                    if(zone == playerArea) then
                        button.string3:SetText('|cff00ff00' .. zone)
                    end
                elseif(_VIEW == 'guildStatus') then
                    if(rankIndex and rank) then
                        button.string2:SetText(ycc.guildRankColor[rankIndex] .. rank)
                    end
                elseif(_VIEW == 'achievement') then
                    button.string1:SetText(ycc.diffColor[level] .. level)
                elseif(_VIEW == 'reputation') then
                    button.string1:SetText(ycc.diffColor[level] .. level)
					if repStanding then
						button.string3:SetText(ycc.repColor[repStanding-4] .. _G["FACTION_STANDING_LABEL"..repStanding])
                    end
                end
            end
        end
    end
end

local loaded = false
hooksecurefunc('GuildFrame_LoadUI', function()
    if(loaded) then
        return
    else
        loaded = true
        hooksecurefunc('GuildRoster_SetView', setview)
        hooksecurefunc('GuildRoster_Update', update)
        hooksecurefunc(GuildRosterContainer, 'update', update)
    end
end)