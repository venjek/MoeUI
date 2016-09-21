--[[    Author: Areko @Alleria-EU]]local L = WHISPERINVITE_LOCALEWhisperInvite = {};WhisperInvite.defaults = {    firstLoad = 1,    fullMatch = true,    capitalization = false,    channels = {        CHAT_MSG_BN_CONVERSATION = false,        CHAT_MSG_BN_INLINE_TOAST_BROADCAST = false,        CHAT_MSG_BN_WHISPER = true,        -- CHAT_MSG_CHANNEL = false,        CHAT_MSG_GUILD = false,                CHAT_MSG_OFFICER = false,        CHAT_MSG_WHISPER = true,    },    keywords = {        [1] = '2',        [2] = '+',    },    blacklist = {        names = {},    },};WhisperInvite.settings = nil;WhisperInvite.CMT = "WhisperInvite:";WhisperInvite.frame = nil;function WhisperInvite:dPrint(msg)endlocal function dPrint(msg)    WhisperInvite:dPrint(msg);endfunction WhisperInvite:cm(msg, clear, r, g, b)    if not clear then        msg = WhisperInvite.CMT..msg;    end    if r == nil or g == nil or b == nil then        r = 1.0;        g = 1.0;        b = 1.0;    end    DEFAULT_CHAT_FRAME:AddMessage(msg, r, g, b);endfunction WhisperInvite:OnLoad(self)    WhisperInvite.frame = self;    self:RegisterEvent("ADDON_LOADED");endfunction WhisperInvite:OnEvent(self, event, ...)    if event == "ADDON_LOADED" then        self:UnregisterEvent("ADDON_LOADED");                WhisperInvite:LoadSettings();        local playerName = strlower(UnitName("player") );        WhisperInvite.settings.blacklist.names[playerName] = true;                self:RegisterEvent("PLAYER_LOGOUT");        WhisperInvite:RegisterChatEvents(self);    elseif event == "PLAYER_LOGOUT" then        WhisperInvite:SaveSettings();        else        if WhisperInvite.settings.channels[event] ~= nil and WhisperInvite.settings.channels[event] then                        local msg = WhisperInvite:GetMessage(event, ...);            if WhisperInvite:CheckMessage(msg) then                WhisperInvite:Invite(event, ...);            end        end    endendfunction WhisperInvite:OnUpdate(self, elapsed)endfunction WhisperInvite:LoadSettings()    if WhisperInviteSettings == nil then        WhisperInvite.settings = WhisperInvite.defaults;    else        WhisperInvite.settings = WhisperInviteSettings;    endendfunction WhisperInvite:SaveSettings()    WhisperInviteSettings = WhisperInvite.settings;endfunction WhisperInvite:LoadDefaults()    WhisperInvite.settings = WhisperInvite.defaults;    WhisperInvite:SaveSettings();endfunction WhisperInvite:RegisterChatEvents(frame)    if frame == nil then        frame = WhisperInvite.frame;    end        for k,v in pairs(WhisperInvite.settings.channels) do        if v then            frame:RegisterEvent(k);        else            frame:UnregisterEvent(k);        end    endendfunction WhisperInvite:CheckMessage(msg)    local invite = false;    if not WhisperInvite.settings.capitalization then        msg = strlower(msg);    end    if WhisperInvite.settings.fullMatch then        for k,v in pairs(WhisperInvite.settings.keywords) do            if not WhisperInvite.settings.capitalization then                if strlower(v) == msg then                    invite = true;                    break;                end            else                if v == msg then                    invite = true;                    break;                end            end        end    else        for k,v in pairs(WhisperInvite.settings.keywords) do            if not WhisperInvite.settings.capitalization then                if strlower(v) == strmatch(msg, strlower(v) ) then                    invite = true;                    break;                end            else                if v == strmatch(msg, v) then                    invite = true;                    break;                end            end        end    end    return invite;endfunction WhisperInvite:GetMessage(event, ...)    local msg = select(1, ...);    dPrint("Msg: From "..event..": "..msg);    return msg;endfunction WhisperInvite:Invite(event, ...)    if not UnitIsGroupLeader("player") and not UnitIsGroupAssistant("palyer") then        dPrint("Kein Lead");        return     end    if event == "CHAT_MSG_BN_CONVERSATION"     or event == "CHAT_MSG_BN_INLINE_TOAST_BROADCAST"     or event == "CHAT_MSG_BN_WHISPER" then        local presenceID = select(13, ...);        local _, _, _, _, _, toonID, client, _, _, _, _, _, _, _, _ = BNGetFriendInfoByID(presenceID);                dPrint("Client: "..client..", toonID:"..toonID);        if strlower(client) == "wow" and toonID then            if GetNumSubgroupMembers() >= 4 and not IsInRaid() then                                ConvertToRaid();            end            dPrint("toonID:"..toonID);            BNInviteFriend(toonID);        end    else        --local name = select(2, ...);        local guid = select(12, ...)        local name, realm = select(6, GetPlayerInfoByGUID(guid) );        if type(realm) == "string" and realm:len() > 1 then            name = name.."-"..realm        end        if not name then            -- We don't now the GUID so we will try only with the name            dPrint("GUID is unknown")            name = select(2, ...)        end        if name then            if WhisperInvite.settings.blacklist.names[strlower(name)] == nil or WhisperInvite.settings.blacklist.names[strlower(name)] == false then                                if GetNumSubgroupMembers() >= 4 and not IsInRaid() then                    ConvertToRaid();                end                dPrint("name: "..name);                InviteUnit(name);            else                dPrint("Name Blacklist");            end        end    endend-- OptionWhisperInvite.Option = {};WhisperInvite.Option.frame = nil;function  WhisperInvite.Option:Okay()    WhisperInvite:SaveSettings();endfunction  WhisperInvite.Option:Cancel()        WhisperInvite:LoadSettings();    WhisperInvite.Option:OnShow( (WhisperInvite.Option.frame or _G["WhisperInviteOptionFrame"] ));endfunction  WhisperInvite.Option:Default()    WhisperInvite:LoadDefaults();endfunction WhisperInvite.Option:OnLoad(self)    self:Hide();    self.name = "|cffC495DD[聊天]|r密2进组";    self.okay = function() WhisperInvite.Option.Okay(); end;    self.cancel = function() WhisperInvite.Option.Cancel(); end;    self.default = function() WhisperInvite.Option.Default(); end;    InterfaceOptions_AddCategory(self);    local name = self:GetName();    WhisperInvite.Option.frame = self;    _G[name.."Head"]:SetText(L["WhisperInvite"]);    _G[name.."Keywords"]:SetText(L["Keywords"]);    _G[name.."Channels"]:SetText(L["Chat Channels"]);    _G[name.."Blacklists"]:SetText(L["Blacklists"]);    _G[name.."BlacklistPlayer"]:SetText(L["Spieler Blacklist"]);    -- Channels Checkbuttons    local ccbs = {};    local lastPoint = name.."Channels";    for k,v in pairs(WhisperInvite.defaults.channels) do        ccb = CreateFrame("CheckButton", name.."ChannelCheckButton"..k, self, "WhisperInviteChannelCheckButton");        ccb.channelname = k;        _G[ccb:GetName().."Text"]:SetText(L[k]);        ccb:ClearAllPoints();        ccb:SetPoint("TOPLEFT", lastPoint, "BOTTOMLEFT", 0, -5);        lastPoint = ccb:GetName();    end    _G[name.."Blacklists"]:ClearAllPoints();    _G[name.."Blacklists"]:SetPoint("TOPLEFT", lastPoint, "BOTTOMLEFT", 0, -10);endfunction WhisperInvite.Option:OnShow(self)    if WhisperInvite.settings == nil then return end    local s = WhisperInvite.settings;    local name = self:GetName();    _G[name.."KeywordsEditBox"]:SetText(strjoin(", ", unpack(s.keywords) ) );    _G[name.."FullMatchCheckButton"]:SetChecked(s.fullMatch);        _G[name.."FullMatchCheckButtonText"]:SetText(L["All character match"]);    _G[name.."CapitalizationCheckButton"]:SetChecked(s.capitalization);    _G[name.."CapitalizationCheckButtonText"]:SetText(L["Case sensitive"]);    for k,v in pairs(s.channels) do        _G[name.."ChannelCheckButton"..k]:SetChecked(s.channels[k]);    end    local names = {};    for k,v in pairs(s.blacklist.names) do        tinsert(names, k);    end        _G[name.."BlacklistPlayer"]:SetText(L["Spieler Blacklist"]..": "..strjoin(", ", unpack(names) ) );endfunction WhisperInvite.Option:KeywordOnEditFocusLost(editBox)    local keywords = {strsplit(",", editBox:GetText() )};    if keywords[1] == "" then        WhisperInvite.settings.keywords = WhisperInvite.defaults.keywords;    else        for k,v in pairs(keywords) do            keywords[k]=strtrim(v);        end        WhisperInvite.settings.keywords = keywords;    endendfunction WhisperInvite.Option:FullMatchClick(checkButton)    if checkButton:GetChecked() then        WhisperInvite.settings.fullMatch = true;    else        WhisperInvite.settings.fullMatch = false;    endendfunction WhisperInvite.Option:CapitalizationClick(checkButton)   if checkButton:GetChecked() then        WhisperInvite.settings.capitalization = true;    else        WhisperInvite.settings.capitalization = false;    end endfunction WhisperInvite.Option:Channel(checkButton)    if WhisperInvite.settings.channels[checkButton.channelname] ~= nil then        if checkButton:GetChecked() then            WhisperInvite.settings.channels[checkButton.channelname] = true;        else            WhisperInvite.settings.channels[checkButton.channelname] = false;        end        WhisperInvite:RegisterChatEvents(WhisperInvite.frame);    endend-- Option SlashCommandsSLASH_WHISPERINVITE1, SLASH_WHISPERINVITE2 = "/wi", "/whisperinvite";SlashCmdList["WHISPERINVITE"] = function(msg, editBox)    WhisperInvite:SlashHandler(msg, editBox)endfunction WhisperInvite:SlashHandler(msg, editBox)    local commands = {strsplit(" ", strlower(msg) )}    for k,v in pairs(commands) do        commands[k] = strtrim(v);    end    if commands[1] == "remove" and commands[2] ~= nil then        if WhisperInvite.settings.blacklist.names[commands[2]] ~= nil then            WhisperInvite.settings.blacklist.names[commands[2]] = nil;            WhisperInvite:cm(format(L["%s aus Spieler Blacklist entfernt."], commands[2]) );        end    elseif commands[1] == "add" and commands[2] ~= nil then        WhisperInvite.settings.blacklist.names[commands[2]] = true;        WhisperInvite:cm(format(L["%s zu Spieler Blacklist hinzugefügt."], commands[2]) );    else        WhisperInvite:cm(L["Chat Commands:\nremove Spielername - Von Blacklist entfernt\nadd Spielername - Zu Blacklist hinzugefügen"]);    endend