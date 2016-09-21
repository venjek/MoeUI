﻿local _, nss = ...

local GetScreenWidth = GetScreenWidth
local GetScreenHeight = GetScreenHeight
local IsDressableItem = IsDressableItem

local setDefaults, db

local LAT = LibStub("LibArmorToken-1.0")

local tooltip = CreateFrame("Frame", "AppearanceTooltipTooltip", UIParent, "TooltipBorderedFrameTemplate")
tooltip:SetClampedToScreen(true)
tooltip:SetFrameStrata("TOOLTIP")
tooltip:SetSize(280, 380)
tooltip:Hide()

tooltip:SetScript("OnEvent", function(self, event, ...)
    self[event](self, ...)
end)
tooltip:RegisterEvent("ADDON_LOADED")
tooltip:RegisterEvent("PLAYER_LOGIN")
tooltip:RegisterEvent("PLAYER_REGEN_DISABLED")
tooltip:RegisterEvent("PLAYER_REGEN_ENABLED")

function tooltip:ADDON_LOADED(addon)
    if addon ~= "TransMogMaster" then return end

    _G["AppearanceTooltipDB"] = setDefaults(_G["AppearanceTooltipDB"] or {}, {
        modifier = "None", -- or "Alt", "Ctrl", "Shift"
        mousescroll = true, -- scrolling mouse rotates model
        rotate = true, -- turn the model slightly, so it's not face-on to the camera
        spin = false, -- constantly spin the model
        zoomWorn = true, -- zoom in on the item in question
        zoomHeld = true, -- zoom in on weapons
        zoomMasked = false, -- use the transmog mask while zoomed
        dressed = true, -- whether the model should be wearing your current outfit, or be naked
        uncover = true, -- remove clothing to expose the previewed item
        customModel = false, -- use a model other than your current class, and if so:
        modelRace = 7, -- raceid (1:human)
        modelGender = 1, -- 0:male, 1:female
        notifyKnown = true, -- show text explaining the transmog state of the item previewed
        currentClass = false, -- only show for items the current class can transmog
        anchor = "vertical", -- vertical / horizontal
        byComparison = true, -- whether to show by the comparison, or fall back to vertical if needed
    })
    db = _G["AppearanceTooltipDB"]
    nss.db = db

    self:UnregisterEvent("ADDON_LOADED")
end

function tooltip:PLAYER_LOGIN()
    tooltip.model:SetUnit("player")
    tooltip.modelZoomed:SetUnit("player")
    C_TransmogCollection.SetShowMissingSourceInItemTooltips(true)
end

function tooltip:PLAYER_REGEN_ENABLED()
    if self:IsShown() and db.mousescroll then
        SetOverrideBinding(tooltip, true, "MOUSEWHEELUP", "AppearanceKnown_TooltipScrollUp")
        SetOverrideBinding(tooltip, true, "MOUSEWHEELDOWN", "AppearanceKnown_TooltipScrollDown")
    end
end

function tooltip:PLAYER_REGEN_DISABLED()
    ClearOverrideBindings(tooltip)
end

tooltip:SetScript("OnShow", function(self)
    if db.mousescroll and not InCombatLockdown() then
        SetOverrideBinding(tooltip, true, "MOUSEWHEELUP", "AppearanceKnown_TooltipScrollUp")
        SetOverrideBinding(tooltip, true, "MOUSEWHEELDOWN", "AppearanceKnown_TooltipScrollDown")
    end
end);

tooltip:SetScript("OnHide",function(self)
    if not InCombatLockdown() then
        ClearOverrideBindings(tooltip);
    end
end)

local function makeModel()
    local model = CreateFrame("DressUpModel", nil, tooltip)
    model:SetFrameLevel(1)
    model:SetPoint("TOPLEFT", tooltip, "TOPLEFT", 5, -5)
    model:SetPoint("BOTTOMRIGHT", tooltip, "BOTTOMRIGHT", -5, 5)
    model:SetKeepModelOnHide(true)
    model:SetScript("OnModelLoaded", function(self, ...)
        -- Makes sure the zoomed camera is correct, if the model isn't loaded right away
        if self.cameraID then
            Model_ApplyUICamera(self, self.cameraID)
        end
    end)
    -- Use the blacked-out model:
    -- model:SetUseTransmogSkin(true)
    -- Display in combat pose:
    -- model:FreezeAnimation(1)
    return model
end
tooltip.model = makeModel()
tooltip.modelZoomed = makeModel()
tooltip.modelWeapon = makeModel()

tooltip.model:SetScript("OnShow", function(self)
    nss:ResetModel(self)
end)

local known = tooltip:CreateFontString(nil, "OVERLAY", "GameFontNormal")
known:SetWordWrap(true)
known:SetTextColor(0.5333, 0.6666, 0.9999, 0.9999)
known:SetPoint("BOTTOMLEFT", tooltip, "BOTTOMLEFT", 6, 12)
known:SetPoint("BOTTOMRIGHT", tooltip, "BOTTOMRIGHT", -6, 12)
known:Show()

local classwarning = tooltip:CreateFontString(nil, "OVERLAY", "GameFontRed")
classwarning:SetWordWrap(true)
classwarning:SetPoint("TOPLEFT", tooltip, "TOPLEFT", 6, -12)
classwarning:SetPoint("TOPRIGHT", tooltip, "TOPRIGHT", -6, -12)
-- ITEM_WRONG_CLASS = "That item can't be used by players of your class!"
-- STAT_USELESS_TOOLTIP = "|cff808080Provides no benefit for your class|r"
classwarning:SetText("这件装备你的职业是不能幻化滴~")
classwarning:Show()

-- Ye showing:
GameTooltip:HookScript("OnTooltipSetItem", function(self)
    nss:ShowItem(select(2, self:GetItem()))
end)
GameTooltip:HookScript("OnHide", function()
    nss:HideItem()
end)

----

local positioner = CreateFrame("Frame")
positioner:Hide()
positioner:SetScript("OnShow", function(self)
    self.updateTooltip = 0
end)
positioner:SetScript("OnUpdate", function(self, elapsed)
    self.updateTooltip = self.updateTooltip - elapsed
    if self.updateTooltip > 0 then
        return
    end
    self.updateTooltip = TOOLTIP_UPDATE_TIME

    local owner, our_point, owner_point = nss:ComputeTooltipAnchors(tooltip.owner, tooltip, db.anchor)
    if our_point and owner_point then
        tooltip:ClearAllPoints()
        tooltip:SetPoint(our_point, owner, owner_point)
    end
end)

do
    local points = {
        -- key is the direction our tooltip should be biased, with the first component being the primary (i.e. "on the top side, to the left")
        -- these are [our point, owner point]
        top = {
            left = {"BOTTOMRIGHT", "TOPRIGHT"},
            right = {"BOTTOMLEFT", "TOPLEFT"},
        },
        bottom = {
            left = {"TOPRIGHT", "BOTTOMRIGHT"},
            right = {"TOPLEFT", "BOTTOMLEFT"},
        },
        left = {
            top = {"BOTTOMRIGHT", "BOTTOMLEFT"},
            bottom = {"TOPRIGHT", "TOPLEFT"},
        },
        right = {
            top = {"BOTTOMLEFT", "BOTTOMRIGHT"},
            bottom = {"TOPLEFT", "TOPRIGHT"},
        },
    }
    function nss:ComputeTooltipAnchors(owner, tooltip, anchor)
        -- Because I always forget: x is left-right, y is bottom-top
        -- Logic here: our tooltip should trend towards the center of the screen, unless something is stopping it.
        local originalOwner = owner
        local x, y = owner:GetCenter()
        if not (x and y) then
            return
        end
        -- Screen into quadrants: UL, UR, BL, BR
        -- What side of the screen are we on
        local ownerIsUp = y > GetScreenHeight() / 2
        local ownerIsLeft = x < GetScreenWidth() / 2
        local comparisonShown = ShoppingTooltip1:IsVisible()
        local comparisonOnRight = comparisonShown and ((ShoppingTooltip1:GetCenter()) > x)
        --
        local primary, secondary
        if anchor == "vertical" then
            primary = ownerIsUp and "bottom" or "top"
            if comparisonShown then
                secondary = comparisonOnRight and "left" or "right"
            else
                secondary = ownerIsLeft and "right" or "left"
            end
        else -- horizontal
            if comparisonShown then
                if db.byComparison then
                    primary = ownerIsLeft and "right" or "left"
                    owner = ShoppingTooltip1
                else
                    primary = comparisonOnRight and "left" or "right"
                end
            else
                primary = ownerIsLeft and "right" or "left"
            end
            secondary = ownerIsUp and "bottom" or "top"
        end
        if
            -- would we be pushing against the edge of the screen?
            (primary == "left" and (owner:GetLeft() - tooltip:GetWidth()) < 0)
            or (primary == "right" and (owner:GetRight() + tooltip:GetWidth() > GetScreenWidth()))
        then
            return self:ComputeTooltipAnchors(originalOwner, tooltip, "vertical")
        end
        return owner, unpack(points[primary][secondary])
    end
end

local spinner = CreateFrame("Frame", nil, tooltip);
spinner:Hide()
spinner:SetScript("OnUpdate", function(self, elapsed)
    if not (tooltip.activeModel and tooltip.activeModel:IsVisible()) then
        return self:Hide()
    end
    tooltip.activeModel:SetFacing(tooltip.activeModel:GetFacing() + elapsed)
end)

local hider = CreateFrame("Frame")
hider:Hide()
hider:SetScript("OnUpdate", function(self)
    if (tooltip.owner and not (tooltip.owner:IsShown() and tooltip.owner:GetItem())) or not tooltip.owner then
        spinner:Hide()
        positioner:Hide()
        tooltip:Hide()
        tooltip.item = nil
    end
    self:Hide()
end)

----

local _, class = UnitClass("player")
function nss:ShowItem(link)
    if not link then return end
    local id = tonumber(link:match("item:(%d+)"))
    if not id or id == 0 then return end
    local token = LAT:ItemIsToken(id)
    local maybelink

    if token then
        -- It's a set token! Replace the id.
        local found
        for _, itemid in LAT:IterateItemsForTokenAndClass(id, class) do
            _, maybelink = GetItemInfo(id)
            if maybelink then
                id = itemid
                link = maybelink
                found = true
                break
            end
        end
        if not found then
            for _, tokenclass in LAT:IterateClassesForToken(id) do
                for _, itemid in LAT:IterateItemsForTokenAndClass(id, tokenclass) do
                    _, maybelink = GetItemInfo(itemid)
                    if maybelink then
                        id = itemid
                        link = maybelink
                        found = true
                        break
                    end
                end
                break
            end
        end
        if found then
            GameTooltip:AddDoubleLine(ITEM_PURCHASED_COLON, link)
            GameTooltip:Show()
        end
    end

    local slot = select(9, GetItemInfo(id))
    if (not db.modifier or self.modifiers[db.modifier]()) and tooltip.item ~= id then
        tooltip.item = id

        local appropriateItem = nss.ItemIsAppropriateForPlayer(id)

        if self.slot_facings[slot] and IsDressableItem(id) and (not db.currentClass or appropriateItem) then
            local model
            local cameraID, itemCamera
            if db.zoomWorn or db.zoomHeld then
                cameraID, itemCamera = self:GetCameraID(id, db.customModel and db.modelRace, db.customModel and db.modelGender)
            end

            tooltip.model:Hide()
            tooltip.modelZoomed:Hide()
            tooltip.modelWeapon:Hide()

            local shouldZoom = (db.zoomHeld and cameraID and itemCamera) or (db.zoomWorn and cameraID and not itemCamera)

            if shouldZoom then
                if itemCamera then
                    model = tooltip.modelWeapon
                    model:SetItem(id)
                else
                    model = tooltip.modelZoomed
                    model:SetUseTransmogSkin(db.zoomMasked and slot ~= "INVTYPE_HEAD")
                    self:ResetModel(model)
                end
                model.cameraID = cameraID
                Model_ApplyUICamera(model, cameraID)
                -- ApplyUICamera locks the animation, but...
                model:SetAnimation(0, 0)
            else
                model = tooltip.model

                self:ResetModel(model)
            end
            tooltip.activeModel = model
            model:Show()

            if not cameraID then
                model:SetFacing(self.slot_facings[slot] - (db.rotate and 0.5 or 0))
            end

            tooltip:Show()
            tooltip.owner = GameTooltip

            positioner:Show()
            spinner:SetShown(db.spin)

            if nss.slot_removals[slot] and (nss.always_remove[slot] or db.uncover) then
                -- 1. If this is a weapon, force-remove the item in the main-hand slot! Otherwise it'll get dressed into the
                --    off-hand, maybe, depending on things which are more hassle than it's worth to work out.
                -- 2. Other slots will be entirely covered, making for a useless preview. e.g. shirts.
                for _, slotid in ipairs(nss.slot_removals[slot]) do
                    if slotid == nss.SLOT_ROBE then
                        local chest_itemid = GetInventoryItemID("player", nss.SLOT_CHEST)
                        if chest_itemid and select(4, GetItemInfoInstant(chest_itemid)) == 'INVTYPE_ROBE' then
                            slotid = nss.SLOT_CHEST
                        end
                    end
                    if slotid > 0 then
                        model:UndressSlot(slotid)
                    end
                end
            end
            model:TryOn(link)
        else
            tooltip:Hide()
        end

        classwarning:Hide()
        known:Hide()

        if db.notifyKnown then
            local hasAppearance, appearanceFromOtherItem, notTransmoggable = nss.PlayerHasAppearance(link)

            local label
            if notTransmoggable then
                label = "|c00ffff00" .. TRANSMOGRIFY_INVALID_DESTINATION
            else
                if hasAppearance then
                    if appearanceFromOtherItem then
                        label = "|TInterface\\RaidFrame\\ReadyCheck-Ready:0|t " .. (TRANSMOGRIFY_TOOLTIP_ITEM_UNKNOWN_APPEARANCE_KNOWN):gsub(', ', ',\n')
                    else
                        label = "|TInterface\\RaidFrame\\ReadyCheck-Ready:0|t " .. TRANSMOGRIFY_TOOLTIP_APPEARANCE_KNOWN
                    end
                else
                    label = "|TInterface\\RaidFrame\\ReadyCheck-NotReady:0|t |cffff0000" .. TRANSMOGRIFY_TOOLTIP_APPEARANCE_UNKNOWN
                end
                classwarning:SetShown(not appropriateItem)
            end
            known:SetText(label)
            known:Show()
        end
    end
end

function nss:HideItem()
    hider:Show()
end

function nss:ResetModel(model)
    if db.customModel then
        model:SetCustomRace(db.modelRace, db.modelGender)
    else
        model:Dress()
    end
    model:RefreshCamera()
    if not db.dressed then
        model:Undress()
    end
end

nss.SLOT_MAINHAND = GetInventorySlotInfo("MainHandSlot")
nss.SLOT_OFFHAND = GetInventorySlotInfo("SecondaryHandSlot")
nss.SLOT_TABARD = GetInventorySlotInfo("TabardSlot")
nss.SLOT_CHEST = GetInventorySlotInfo("ChestSlot")
nss.SLOT_HANDS = GetInventorySlotInfo("HandsSlot")
nss.SLOT_WAIST = GetInventorySlotInfo("WaistSlot")
nss.SLOT_SHOULDER = GetInventorySlotInfo("ShoulderSlot")
nss.SLOT_FEET = GetInventorySlotInfo("FeetSlot")
nss.SLOT_ROBE = -99 -- Magic!

nss.slot_removals = {
    INVTYPE_WEAPON = {nss.SLOT_MAINHAND},
    INVTYPE_2HWEAPON = {nss.SLOT_MAINHAND},
    INVTYPE_BODY = {nss.SLOT_TABARD, nss.SLOT_CHEST, nss.SLOT_SHOULDER, nss.SLOT_OFFHAND, nss.SLOT_WAIST},
    INVTYPE_CHEST = {nss.SLOT_TABARD, nss.SLOT_OFFHAND, nss.SLOT_WAIST},
    INVTYPE_ROBE = {nss.SLOT_TABARD, nss.SLOT_WAIST, nss.SLOT_SHOULDER, nss.SLOT_OFFHAND},
    INVTYPE_LEGS = {nss.SLOT_TABARD, nss.SLOT_WAIST, nss.SLOT_FEET, nss.SLOT_ROBE, nss.SLOT_OFFHAND},
    INVTYPE_WAIST = {nss.SLOT_OFFHAND},
    INVTYPE_FEET = {nss.SLOT_ROBE},
    INVTYPE_WRIST = {nss.SLOT_HANDS, nss.SLOT_CHEST, nss.SLOT_ROBE},
    INVTYPE_HAND = {nss.SLOT_OFFHAND},
    INVTYPE_TABARD = {nss.SLOT_WAIST, nss.SLOT_OFFHAND},
}
nss.always_remove = {
    INVTYPE_WEAPON = true,
    INVTYPE_2HWEAPON = true,
}

nss.slot_facings = {
    INVTYPE_HEAD = 0,
    INVTYPE_SHOULDER = 0,
    INVTYPE_CLOAK = 3.4,
    INVTYPE_CHEST = 0,
    INVTYPE_ROBE = 0,
    INVTYPE_WRIST = 0,
    INVTYPE_2HWEAPON = 1.6,
    INVTYPE_WEAPON = 1.6,
    INVTYPE_WEAPONMAINHAND = 1.6,
    INVTYPE_WEAPONOFFHAND = -0.7,
    INVTYPE_SHIELD = -0.7,
    INVTYPE_HOLDABLE = -0.7,
    INVTYPE_RANGED = 1.6,
    INVTYPE_RANGEDRIGHT = 1.6,
    INVTYPE_THROWN = 1.6,
    INVTYPE_HAND = 0,
    INVTYPE_WAIST = 0,
    INVTYPE_LEGS = 0,
    INVTYPE_FEET = 0,
    INVTYPE_TABARD = 0,
    INVTYPE_BODY = 0,
}

nss.modifiers = {
    Shift = IsShiftKeyDown,
    Ctrl = IsControlKeyDown,
    Alt = IsAltKeyDown,
    None = function() return true end,
}

-- Utility fun

--/dump C_Transmog.GetItemInfo(GetItemInfoInstant(""))
function nss.CanTransmogItem(itemLink)
    local itemID = GetItemInfoInstant(itemLink)
    if itemID then
        local canBeChanged, noChangeReason, canBeSource, noSourceReason = C_Transmog.GetItemInfo(itemID)
        return canBeSource, noSourceReason
    end
end

function nss.PlayerHasAppearance(item)
    if not nss.CanTransmogItem(item) then
        return false, false, true
    end
    local state = nss.CheckTooltipFor(item, TRANSMOGRIFY_TOOLTIP_APPEARANCE_UNKNOWN, TRANSMOGRIFY_TOOLTIP_ITEM_UNKNOWN_APPEARANCE_KNOWN)
    if state == TRANSMOGRIFY_TOOLTIP_APPEARANCE_UNKNOWN then
        return
    end
    return true, state == TRANSMOGRIFY_TOOLTIP_ITEM_UNKNOWN_APPEARANCE_KNOWN
end

do
    local tooltip
    function nss.CheckTooltipFor(link, ...)
        if not tooltip then
            tooltip = CreateFrame("GameTooltip", "AppearanceTooltipScanningTooltip", nil, "GameTooltipTemplate")
            tooltip:SetOwner(WorldFrame, "ANCHOR_NONE")
        end
        tooltip:ClearLines()

        -- just showing tooltip for an itemid
        -- uses rather innocent checking so that slot can be a link or an itemid
        local link = tostring(link) -- so that ":match" is guaranteed to be okay
        if not link:match("item:") then
            link = "item:"..link
        end
        tooltip:SetHyperlink(link)

        for i=2, tooltip:NumLines() do
            local left = _G["AppearanceTooltipScanningTooltipTextLeft"..i]
            --local right = _G["AppearanceTooltipScanningTooltipTextRight"..i]
            if left and left:IsShown() then
                local text = left:GetText()
                for ii=1, select('#', ...) do
                    if string.match(text, (select(ii, ...))) then
                        return text
                    end
                end
            end
            --if right and right:IsShown() and string.match(right:GetText(), text) then return true end
        end
        return false
    end
end

local debugf = tekDebug and tekDebug:GetFrame(myname)
function nss.Debug(...) if debugf then debugf:AddMessage(string.join(", ", tostringall(...))) end end

function setDefaults(options, defaults)
    setmetatable(options, { __index = function(t, k)
        if type(defaults[k]) == "table" then
            t[k] = setDefaults({}, defaults[k])
            return t[k]
        end
        return defaults[k]
    end, })
    return options
end


local valid_classes = {
    ALL = {
        [LE_ITEM_CLASS_WEAPON] = {
            [LE_ITEM_WEAPON_GENERIC] = true,
            [LE_ITEM_WEAPON_FISHINGPOLE] = true,
        },
        [LE_ITEM_CLASS_ARMOR] = {
            [LE_ITEM_ARMOR_GENERIC] = true, -- includes things like trinkets and rings
            [LE_ITEM_ARMOR_COSMETIC] = true,
        },
    },
    DEATHKNIGHT = {
        [LE_ITEM_CLASS_WEAPON] = {
            [LE_ITEM_WEAPON_AXE1H] = true,
            [LE_ITEM_WEAPON_MACE1H] = true,
            [LE_ITEM_WEAPON_SWORD1H] = true,
            [LE_ITEM_WEAPON_AXE2H] = true,
            [LE_ITEM_WEAPON_MACE2H] = true,
            [LE_ITEM_WEAPON_SWORD2H] = true,
            [LE_ITEM_WEAPON_POLEARM] = true,
            -- [LE_ITEM_WEAPON_WARGLAIVE] = true,
        },
        [LE_ITEM_CLASS_ARMOR] = {
            [LE_ITEM_ARMOR_PLATE] = true,
            [LE_ITEM_ARMOR_MAIL] = false,
            [LE_ITEM_ARMOR_LEATHER] = false,
            [LE_ITEM_ARMOR_CLOTH] = false,
        },
    },
    WARRIOR = {
        [LE_ITEM_CLASS_WEAPON] = {
            [LE_ITEM_WEAPON_DAGGER] = true,
            [LE_ITEM_WEAPON_UNARMED] = true,
            [LE_ITEM_WEAPON_AXE1H] = true,
            [LE_ITEM_WEAPON_MACE1H] = true,
            [LE_ITEM_WEAPON_SWORD1H] = true,
            [LE_ITEM_WEAPON_AXE2H] = true,
            [LE_ITEM_WEAPON_MACE2H] = true,
            [LE_ITEM_WEAPON_SWORD2H] = true,
            [LE_ITEM_WEAPON_POLEARM] = true,
            [LE_ITEM_WEAPON_STAFF] = true,
            -- [LE_ITEM_WEAPON_WARGLAIVE] = true,
            [LE_ITEM_WEAPON_BOWS] = true,
            [LE_ITEM_WEAPON_CROSSBOW] = true,
            [LE_ITEM_WEAPON_GUNS] = true,
        },
        [LE_ITEM_CLASS_ARMOR] = {
            [LE_ITEM_ARMOR_SHIELD] = true,
            [LE_ITEM_ARMOR_PLATE] = true,
            [LE_ITEM_ARMOR_MAIL] = false,
            [LE_ITEM_ARMOR_LEATHER] = false,
            [LE_ITEM_ARMOR_CLOTH] = false,
        },
    },
    PALADIN = {
        [LE_ITEM_CLASS_WEAPON] = {
            [LE_ITEM_WEAPON_AXE1H] = true,
            [LE_ITEM_WEAPON_MACE1H] = true,
            [LE_ITEM_WEAPON_SWORD1H] = true,
            [LE_ITEM_WEAPON_AXE2H] = true,
            [LE_ITEM_WEAPON_MACE2H] = true,
            [LE_ITEM_WEAPON_SWORD2H] = true,
            [LE_ITEM_WEAPON_POLEARM] = true,
        },
        [LE_ITEM_CLASS_ARMOR] = {
            [LE_ITEM_ARMOR_SHIELD] = true,
            [LE_ITEM_ARMOR_PLATE] = true,
            [LE_ITEM_ARMOR_MAIL] = false,
            [LE_ITEM_ARMOR_LEATHER] = false,
            [LE_ITEM_ARMOR_CLOTH] = false,
        },
    },
    HUNTER = {
        [LE_ITEM_CLASS_WEAPON] = {
            [LE_ITEM_WEAPON_BOWS] = true,
            [LE_ITEM_WEAPON_CROSSBOW] = true,
            [LE_ITEM_WEAPON_GUNS] = true,
            -- verify the 2h below...
            [LE_ITEM_WEAPON_DAGGER] = true,
            [LE_ITEM_WEAPON_UNARMED] = true,
            [LE_ITEM_WEAPON_AXE1H] = true,
            [LE_ITEM_WEAPON_MACE1H] = true,
            [LE_ITEM_WEAPON_SWORD1H] = true,
            [LE_ITEM_WEAPON_AXE2H] = true,
            [LE_ITEM_WEAPON_MACE2H] = true,
            [LE_ITEM_WEAPON_SWORD2H] = true,
            [LE_ITEM_WEAPON_POLEARM] = true,
            [LE_ITEM_WEAPON_STAFF] = true,
        },
        [LE_ITEM_CLASS_ARMOR] = {
            [LE_ITEM_ARMOR_MAIL] = true,
            [LE_ITEM_ARMOR_LEATHER] = false,
            [LE_ITEM_ARMOR_CLOTH] = false,
        },
    },
    SHAMAN = {
        [LE_ITEM_CLASS_WEAPON] = {
            [LE_ITEM_WEAPON_DAGGER] = true,
            [LE_ITEM_WEAPON_UNARMED] = true,
            [LE_ITEM_WEAPON_AXE1H] = true,
            [LE_ITEM_WEAPON_MACE1H] = true,
            [LE_ITEM_WEAPON_STAFF] = true,
            [LE_ITEM_WEAPON_AXE2H] = true,
            [LE_ITEM_WEAPON_MACE2H] = true,
        },
        [LE_ITEM_CLASS_ARMOR] = {
            [LE_ITEM_ARMOR_SHIELD] = true,
            [LE_ITEM_ARMOR_MAIL] = true,
            [LE_ITEM_ARMOR_LEATHER] = false,
            [LE_ITEM_ARMOR_CLOTH] = false,
        },
    },
    DEMONHUNTER = {
        [LE_ITEM_CLASS_WEAPON] = {
            [LE_ITEM_WEAPON_WARGLAIVE] = true,
            [LE_ITEM_WEAPON_DAGGER] = true,
            [LE_ITEM_WEAPON_UNARMED] = true,
            [LE_ITEM_WEAPON_AXE1H] = true,
            [LE_ITEM_WEAPON_MACE1H] = true,
            [LE_ITEM_WEAPON_SWORD1H] = true,
        },
        [LE_ITEM_CLASS_ARMOR] = {
            [LE_ITEM_ARMOR_LEATHER] = true,
            [LE_ITEM_ARMOR_CLOTH] = false,
        },
    },
    ROGUE = {
        [LE_ITEM_CLASS_WEAPON] = {
            [LE_ITEM_WEAPON_DAGGER] = true,
            [LE_ITEM_WEAPON_UNARMED] = true,
            [LE_ITEM_WEAPON_AXE1H] = true,
            [LE_ITEM_WEAPON_MACE1H] = true,
            [LE_ITEM_WEAPON_SWORD1H] = true,
            [LE_ITEM_WEAPON_BOWS] = true,
            [LE_ITEM_WEAPON_CROSSBOW] = true,
            [LE_ITEM_WEAPON_GUNS] = true,
        },
        [LE_ITEM_CLASS_ARMOR] = {
            [LE_ITEM_ARMOR_LEATHER] = true,
            [LE_ITEM_ARMOR_CLOTH] = false,
        },
    },
    MONK = {
        [LE_ITEM_CLASS_WEAPON] = {
            [LE_ITEM_WEAPON_UNARMED] = true,
            [LE_ITEM_WEAPON_AXE1H] = true,
            [LE_ITEM_WEAPON_MACE1H] = true,
            [LE_ITEM_WEAPON_SWORD1H] = true,
            [LE_ITEM_WEAPON_POLEARM] = true,
            [LE_ITEM_WEAPON_STAFF] = true,
        },
        [LE_ITEM_CLASS_ARMOR] = {
            [LE_ITEM_ARMOR_LEATHER] = true,
            [LE_ITEM_ARMOR_CLOTH] = false,
        },
    },
    DRUID = {
        [LE_ITEM_CLASS_WEAPON] = {
            [LE_ITEM_WEAPON_DAGGER] = true,
            [LE_ITEM_WEAPON_UNARMED] = true,
            [LE_ITEM_WEAPON_MACE1H] = true,
            [LE_ITEM_WEAPON_POLEARM] = true,
            [LE_ITEM_WEAPON_STAFF] = true,
            [LE_ITEM_WEAPON_MACE2H] = true,
        },
        [LE_ITEM_CLASS_ARMOR] = {
            [LE_ITEM_ARMOR_LEATHER] = true,
            [LE_ITEM_ARMOR_CLOTH] = false,
        },
    },
    PRIEST = {
        [LE_ITEM_CLASS_WEAPON] = {
            [LE_ITEM_WEAPON_DAGGER] = true,
            [LE_ITEM_WEAPON_WAND] = true,
            [LE_ITEM_WEAPON_STAFF] = true,
            [LE_ITEM_WEAPON_MACE1H] = true,
        },
        [LE_ITEM_CLASS_ARMOR] = {
            [LE_ITEM_ARMOR_CLOTH] = true,
        },
    },
    MAGE = {
        [LE_ITEM_CLASS_WEAPON] = {
            [LE_ITEM_WEAPON_DAGGER] = true,
            [LE_ITEM_WEAPON_WAND] = true,
            [LE_ITEM_WEAPON_STAFF] = true,
            [LE_ITEM_WEAPON_SWORD1H] = true,
        },
        [LE_ITEM_CLASS_ARMOR] = {
            [LE_ITEM_ARMOR_CLOTH] = true,
        },
    },
    WARLOCK = {
        [LE_ITEM_CLASS_WEAPON] = {
            [LE_ITEM_WEAPON_DAGGER] = true,
            [LE_ITEM_WEAPON_WAND] = true,
            [LE_ITEM_WEAPON_STAFF] = true,
            [LE_ITEM_WEAPON_SWORD1H] = true,
        },
        [LE_ITEM_CLASS_ARMOR] = {
            [LE_ITEM_ARMOR_CLOTH] = true,
        },
    },

}
local _, class = UnitClass("player")

-- Can the player equip this at all?
function nss.PlayerCanEquipItem(item)
    return nss.ItemIsAppropriateForPlayer(item) ~= nil
end

-- Is the item "appropriate", per transmog rules -- i.e. is it equipable and of the primary armor-type
function nss.ItemIsAppropriateForPlayer(item)
    local slot, _, itemclass, itemsubclass = select(4, GetItemInfoInstant(item))
    if not (class and valid_classes[class] and itemclass and itemsubclass) then
        return
    end
    if valid_classes[class][itemclass] and valid_classes[class][itemclass][itemsubclass] then
        return valid_classes[class][itemclass][itemsubclass]
    end
    if valid_classes.ALL[itemclass] and valid_classes.ALL[itemclass][itemsubclass] then
        return valid_classes.ALL[itemclass][itemsubclass]
    end
    if slot == 'INVTYPE_CLOAK' then
        -- Cloaks are cloth, technically. But everyone can wear them.
        return true
    end
end
-- PlayerCanEquipItem = nss.PlayerCanEquipItem

local races = {
    [1] = "Human",
    [3] = "Dwarf",
    [4] = "NightElf",
    [11] = "Draenei",
    [22] = "Worgen",
    [7] = "Gnome",
    [24] = "Pandaren",
    [2] = "Orc",
    [5] = "Undead",
    [10] = "BloodElf",
    [8] = "Troll",
    [6] = "Tauren",
    [9] = "Goblin",
}
local genders = {
    [0] = "Male",
    [1] = "Female",
}

local slots = {
    INVTYPE_BODY = "Shirt",
    INVTYPE_CHEST = "Chest", -- the game files call this one "shirt" too, but...
    INVTYPE_CLOAK = "Back",
    INVTYPE_FEET = "Feet",
    INVTYPE_HAND = "Hands",
    INVTYPE_HEAD = "Head",
    INVTYPE_LEGS = "Legs",
    INVTYPE_ROBE = "Robe",
    INVTYPE_SHOULDER = "Shoulder",
    -- INVTYPE_SHOULDER = "Shoulder-Alt",
    INVTYPE_TABARD = "Tabard",
    INVTYPE_WAIST = "Waist",
    INVTYPE_WRIST = "Wrist",
}
local item_slots = {
    INVTYPE_2HWEAPON = true,
    INVTYPE_WEAPON = true,
    INVTYPE_WEAPONMAINHAND = true,
    INVTYPE_WEAPONOFFHAND = true,
    INVTYPE_RANGED = true,
    INVTYPE_RANGEDRIGHT = true,
    INVTYPE_HOLDABLE = "Offhand",
    INVTYPE_SHIELD = "Shield",
}
local subclasses = {
    [LE_ITEM_WEAPON_DAGGER] = "Dagger",
    [LE_ITEM_WEAPON_UNARMED] = "FistWeapon",
    [LE_ITEM_WEAPON_AXE1H] = "1HAxe",
    [LE_ITEM_WEAPON_MACE1H] = "1HMace",
    [LE_ITEM_WEAPON_SWORD1H] = "1HSword",
    [LE_ITEM_WEAPON_AXE2H] = "2HAxe",
    [LE_ITEM_WEAPON_MACE2H] = "2HMace",
    [LE_ITEM_WEAPON_SWORD2H] = "2HSword",
    [LE_ITEM_WEAPON_POLEARM] = "Polearm",
    [LE_ITEM_WEAPON_STAFF] = "Staff",
    [LE_ITEM_WEAPON_WARGLAIVE] = "Glaive",
    [LE_ITEM_WEAPON_BOWS] = "Bow",
    [LE_ITEM_WEAPON_CROSSBOW] = "Crossbow",
    [LE_ITEM_WEAPON_GUNS] = "Gun",
    [LE_ITEM_WEAPON_WAND] = "Wand",
    -- Fallbacks
    [LE_ITEM_WEAPON_FISHINGPOLE] = "Staff",
    [LE_ITEM_WEAPON_GENERIC] = "1HSword",
}

local _, playerRace = UnitRace("player")
local playerSex
if UnitSex("player") == 2 then
    playerSex = "Male";
else
    playerSex = "Female";
end

local slots_to_cameraids

-- Get a cameraid for Model_ApplyUICamera which will focus a DressUpModel on a specific item
-- itemid: number/string Anything that GetItemInfoInstant will accept
-- race: number raceid
-- gender: number genderid (0: male, 1: female)
function nss:GetCameraID(itemid, race, gender)
    local key, itemcamera
    local slot, _, class, subclass = select(4, GetItemInfoInstant(itemid))
    if item_slots[slot] then
        itemcamera = true
        if item_slots[slot] == true then
            key = "Weapon-" .. subclasses[subclass]
        else
            key = "Weapon-" .. item_slots[slot]
        end
    else
        race = races[race]
        gender = genders[gender]
        if not race then
            race = playerRace
            if race == 'Worgen' and select(2, HasAlternateForm()) then
                race = 'Human'
            end
        end
        if not gender then
            gender = playerSex
        end
        key = ("%s-%s-%s"):format(race, gender, slots[slot] or "Default")
    end
    -- nss.Debug("GetCameraID", key, slots_to_cameraids[key], itemcamera)
    return slots_to_cameraids[key], itemcamera
end

slots_to_cameraids = {
    ["Weapon-1HSword"] = 238,
    ["Weapon-2HSword"] = 239,
    ["Weapon-Wand"] = 240,
    ["Weapon-Dagger"] = 241,
    ["Weapon-1HAxe"] = 242,
    ["Weapon-2HAxe"] = 243,
    ["Weapon-1HMace"] = 244,
    ["Weapon-2HMace"] = 245,
    ["Weapon-Staff"] = 246,
    ["Weapon-Polearm"] = 247,
    ["Weapon-Glaive"] = 624,
    ["Weapon-FistWeapon"] = 248,
    ["Weapon-Shield"] = 249,
    ["Weapon-Offhand"] = 250,
    ["Weapon-Bow"] = 251,
    ["Weapon-Gun"] = 252,
    ["Weapon-Crossbow"] = 253,
    --
    ["BloodElf-Female-Back"] = 467,
    ["BloodElf-Female-Feet"] = 475,
    ["BloodElf-Female-Hands"] = 472,
    ["BloodElf-Female-Head"] = 465,
    ["BloodElf-Female-Legs"] = 474,
    ["BloodElf-Female-Robe"] = 468,
    ["BloodElf-Female-Chest"] = 469,
    ["BloodElf-Female-Shirt"] = 469,
    ["BloodElf-Female-Shoulder"] = 466,
    ["BloodElf-Female-Shoulder-Alt"] = 739,
    ["BloodElf-Female-Tabard"] = 470,
    ["BloodElf-Female-Waist"] = 473,
    ["BloodElf-Female-Wrist"] = 471,
    ["BloodElf-Male-Back"] = 456,
    ["BloodElf-Male-Feet"] = 464,
    ["BloodElf-Male-Hands"] = 461,
    ["BloodElf-Male-Head"] = 454,
    ["BloodElf-Male-Legs"] = 463,
    ["BloodElf-Male-Robe"] = 457,
    ["BloodElf-Male-Chest"] = 458,
    ["BloodElf-Male-Shirt"] = 458,
    ["BloodElf-Male-Shoulder"] = 455,
    ["BloodElf-Male-Shoulder-Alt"] = 738,
    ["BloodElf-Male-Tabard"] = 459,
    ["BloodElf-Male-Waist"] = 462,
    ["BloodElf-Male-Wrist"] = 460,
    ["Draenei-Female-Back"] = 345,
    ["Draenei-Female-Feet"] = 358,
    ["Draenei-Female-Hands"] = 352,
    ["Draenei-Female-Head"] = 342,
    ["Draenei-Female-Legs"] = 356,
    ["Draenei-Female-Robe"] = 347,
    ["Draenei-Female-Chest"] = 348,
    ["Draenei-Female-Shirt"] = 348,
    ["Draenei-Female-Shoulder"] = 343,
    ["Draenei-Female-Shoulder-Alt"] = 730,
    ["Draenei-Female-Tabard"] = 349,
    ["Draenei-Female-Waist"] = 355,
    ["Draenei-Female-Wrist"] = 350,
    ["Draenei-Male-Back"] = 333,
    ["Draenei-Male-Chest"] = 677,
    ["Draenei-Male-Feet"] = 341,
    ["Draenei-Male-Hands"] = 338,
    ["Draenei-Male-Head"] = 331,
    ["Draenei-Male-Legs"] = 340,
    ["Draenei-Male-Robe"] = 334,
    ["Draenei-Male-Chest"] = 335,
    ["Draenei-Male-Shirt"] = 335,
    ["Draenei-Male-Shoulder"] = 332,
    ["Draenei-Male-Shoulder-Alt"] = 729,
    ["Draenei-Male-Tabard"] = 336,
    ["Draenei-Male-Waist"] = 339,
    ["Draenei-Male-Wrist"] = 337,
    ["Dwarf-Female-Back"] = 376,
    ["Dwarf-Female-Feet"] = 384,
    ["Dwarf-Female-Hands"] = 381,
    ["Dwarf-Female-Head"] = 374,
    ["Dwarf-Female-Legs"] = 383,
    ["Dwarf-Female-Robe"] = 377,
    ["Dwarf-Female-Chest"] = 378,
    ["Dwarf-Female-Shirt"] = 378,
    ["Dwarf-Female-Shoulder"] = 375,
    ["Dwarf-Female-Shoulder-Alt"] = 809,
    ["Dwarf-Female-Tabard"] = 379,
    ["Dwarf-Female-Waist"] = 382,
    ["Dwarf-Female-Wrist"] = 380,
    ["Dwarf-Male-Back"] = 365,
    ["Dwarf-Male-Feet"] = 373,
    ["Dwarf-Male-Hands"] = 370,
    ["Dwarf-Male-Head"] = 363,
    ["Dwarf-Male-Legs"] = 372,
    ["Dwarf-Male-Robe"] = 366,
    ["Dwarf-Male-Chest"] = 367,
    ["Dwarf-Male-Shirt"] = 367,
    ["Dwarf-Male-Shoulder"] = 364,
    ["Dwarf-Male-Shoulder-Alt"] = 731,
    ["Dwarf-Male-Tabard"] = 368,
    ["Dwarf-Male-Waist"] = 371,
    ["Dwarf-Male-Wrist"] = 369,
    ["Gnome-Female-Back"] = 401,
    ["Gnome-Female-Feet"] = 409,
    ["Gnome-Female-Hands"] = 406,
    ["Gnome-Female-Head"] = 399,
    ["Gnome-Female-Legs"] = 408,
    ["Gnome-Female-Robe"] = 402,
    ["Gnome-Female-Chest"] = 403,
    ["Gnome-Female-Shirt"] = 403,
    ["Gnome-Female-Shoulder"] = 400,
    ["Gnome-Female-Shoulder-Alt"] = 733,
    ["Gnome-Female-Tabard"] = 404,
    ["Gnome-Female-Waist"] = 407,
    ["Gnome-Female-Wrist"] = 405,
    ["Gnome-Male-Back"] = 387,
    ["Gnome-Male-Feet"] = 398,
    ["Gnome-Male-Hands"] = 395,
    ["Gnome-Male-Head"] = 385,
    ["Gnome-Male-Legs"] = 397,
    ["Gnome-Male-Robe"] = 389,
    ["Gnome-Male-Chest"] = 390,
    ["Gnome-Male-Shirt"] = 390,
    ["Gnome-Male-Shoulder"] = 386,
    ["Gnome-Male-Shoulder-Alt"] = 732,
    ["Gnome-Male-Tabard"] = 393,
    ["Gnome-Male-Waist"] = 396,
    ["Gnome-Male-Wrist"] = 394,
    ["Goblin-Female-Back"] = 445,
    ["Goblin-Female-Feet"] = 453,
    ["Goblin-Female-Hands"] = 450,
    ["Goblin-Female-Head"] = 443,
    ["Goblin-Female-Legs"] = 452,
    ["Goblin-Female-Robe"] = 446,
    ["Goblin-Female-Chest"] = 447,
    ["Goblin-Female-Shirt"] = 447,
    ["Goblin-Female-Shoulder"] = 444,
    ["Goblin-Female-Shoulder-Alt"] = 737,
    ["Goblin-Female-Tabard"] = 448,
    ["Goblin-Female-Waist"] = 451,
    ["Goblin-Female-Wrist"] = 449,
    ["Goblin-Male-Back"] = 434,
    ["Goblin-Male-Feet"] = 442,
    ["Goblin-Male-Hands"] = 439,
    ["Goblin-Male-Head"] = 432,
    ["Goblin-Male-Legs"] = 441,
    ["Goblin-Male-Robe"] = 435,
    ["Goblin-Male-Chest"] = 436,
    ["Goblin-Male-Shirt"] = 436,
    ["Goblin-Male-Shoulder"] = 433,
    ["Goblin-Male-Shoulder-Alt"] = 736,
    ["Goblin-Male-Tabard"] = 437,
    ["Goblin-Male-Waist"] = 440,
    ["Goblin-Male-Wrist"] = 438,
    ["Human-Female-Back"] = 276,
    ["Human-Female-Feet"] = 284,
    ["Human-Female-Hands"] = 281,
    ["Human-Female-Head"] = 274,
    ["Human-Female-Legs"] = 283,
    ["Human-Female-Robe"] = 277,
    ["Human-Female-Chest"] = 278,
    ["Human-Female-Shirt"] = 278,
    ["Human-Female-Shoulder"] = 275,
    ["Human-Female-Shoulder-Alt"] = 724,
    ["Human-Female-Tabard"] = 279,
    ["Human-Female-Waist"] = 282,
    ["Human-Female-Wrist"] = 280,
    ["Human-Male-Back"] = 235,
    ["Human-Male-Chest"] = 674,
    ["Human-Male-Feet"] = 227,
    ["Human-Male-Hands"] = 226,
    ["Human-Male-Head"] = 236,
    ["Human-Male-Legs"] = 228,
    ["Human-Male-Robe"] = 225,
    ["Human-Male-Shirt"] = 229,
    ["Human-Male-Shoulder"] = 221,
    ["Human-Male-Shoulder-Alt"] = 723,
    ["Human-Male-Tabard"] = 230,
    ["Human-Male-Waist"] = 234,
    ["Human-Male-Wrist"] = 237,
    ["NightElf-Female-Back"] = 423,
    ["NightElf-Female-Feet"] = 431,
    ["NightElf-Female-Hands"] = 428,
    ["NightElf-Female-Head"] = 421,
    ["NightElf-Female-Legs"] = 430,
    ["NightElf-Female-Robe"] = 424,
    ["NightElf-Female-Shirt"] = 425,
    ["NightElf-Female-Chest"] = 425,
    ["NightElf-Female-Shoulder"] = 422,
    ["NightElf-Female-Shoulder-Alt"] = 735,
    ["NightElf-Female-Tabard"] = 426,
    ["NightElf-Female-Waist"] = 429,
    ["NightElf-Female-Wrist"] = 427,
    ["NightElf-Male-Back"] = 412,
    ["NightElf-Male-Feet"] = 420,
    ["NightElf-Male-Hands"] = 417,
    ["NightElf-Male-Head"] = 410,
    ["NightElf-Male-Legs"] = 419,
    ["NightElf-Male-Robe"] = 413,
    ["NightElf-Male-Chest"] = 414,
    ["NightElf-Male-Shirt"] = 414,
    ["NightElf-Male-Shoulder"] = 411,
    ["NightElf-Male-Shoulder-Alt"] = 734,
    ["NightElf-Male-Tabard"] = 415,
    ["NightElf-Male-Waist"] = 418,
    ["NightElf-Male-Wrist"] = 416,
    ["Orc-Female-Back"] = 489,
    ["Orc-Female-Feet"] = 497,
    ["Orc-Female-Hands"] = 494,
    ["Orc-Female-Head"] = 487,
    ["Orc-Female-Legs"] = 496,
    ["Orc-Female-Robe"] = 490,
    ["Orc-Female-Chest"] = 491,
    ["Orc-Female-Shirt"] = 491,
    ["Orc-Female-Shoulder"] = 488,
    ["Orc-Female-Shoulder-Alt"] = 741,
    ["Orc-Female-Tabard"] = 492,
    ["Orc-Female-Waist"] = 495,
    ["Orc-Female-Wrist"] = 493,
    ["Orc-Male-Back"] = 478,
    ["Orc-Male-Feet"] = 486,
    ["Orc-Male-Hands"] = 483,
    ["Orc-Male-Head"] = 476,
    ["Orc-Male-Legs"] = 485,
    ["Orc-Male-Robe"] = 479,
    ["Orc-Male-Chest"] = 480,
    ["Orc-Male-Shirt"] = 480,
    ["Orc-Male-Shoulder"] = 477,
    ["Orc-Male-Shoulder-Alt"] = 740,
    ["Orc-Male-Tabard"] = 481,
    ["Orc-Male-Waist"] = 484,
    ["Orc-Male-Wrist"] = 482,
    ["Pandaren-Female-Back"] = 300,
    ["Pandaren-Female-Chest"] = 676,
    ["Pandaren-Female-Feet"] = 308,
    ["Pandaren-Female-Hands"] = 305,
    ["Pandaren-Female-Head"] = 298,
    ["Pandaren-Female-Legs"] = 307,
    ["Pandaren-Female-Robe"] = 301,
    ["Pandaren-Female-Shirt"] = 302,
    ["Pandaren-Female-Shoulder"] = 299,
    ["Pandaren-Female-Shoulder-Alt"] = 726,
    ["Pandaren-Female-Tabard"] = 303,
    ["Pandaren-Female-Waist"] = 306,
    ["Pandaren-Female-Wrist"] = 304,
    ["Pandaren-Male-Back"] = 287,
    ["Pandaren-Male-Chest"] = 675,
    ["Pandaren-Male-Feet"] = 295,
    ["Pandaren-Male-Hands"] = 292,
    ["Pandaren-Male-Head"] = 285,
    ["Pandaren-Male-Legs"] = 294,
    ["Pandaren-Male-Robe"] = 288,
    ["Pandaren-Male-Shirt"] = 289,
    ["Pandaren-Male-Shoulder"] = 286,
    ["Pandaren-Male-Shoulder-Alt"] = 725,
    ["Pandaren-Male-Tabard"] = 290,
    ["Pandaren-Male-Waist"] = 293,
    ["Pandaren-Male-Wrist"] = 291,
    ["Tauren-Female-Back"] = 511,
    ["Tauren-Female-Feet"] = 519,
    ["Tauren-Female-Hands"] = 516,
    ["Tauren-Female-Head"] = 509,
    ["Tauren-Female-Legs"] = 518,
    ["Tauren-Female-Robe"] = 512,
    ["Tauren-Female-Chest"] = 513,
    ["Tauren-Female-Shirt"] = 513,
    ["Tauren-Female-Shoulder"] = 510,
    ["Tauren-Female-Shoulder-Alt"] = 743,
    ["Tauren-Female-Tabard"] = 514,
    ["Tauren-Female-Waist"] = 517,
    ["Tauren-Female-Wrist"] = 515,
    ["Tauren-Male-Back"] = 500,
    ["Tauren-Male-Feet"] = 508,
    ["Tauren-Male-Hands"] = 505,
    ["Tauren-Male-Head"] = 498,
    ["Tauren-Male-Legs"] = 507,
    ["Tauren-Male-Robe"] = 501,
    ["Tauren-Male-Chest"] = 502,
    ["Tauren-Male-Shirt"] = 502,
    ["Tauren-Male-Shoulder"] = 499,
    ["Tauren-Male-Shoulder-Alt"] = 742,
    ["Tauren-Male-Tabard"] = 503,
    ["Tauren-Male-Waist"] = 506,
    ["Tauren-Male-Wrist"] = 504,
    ["Troll-Female-Back"] = 533,
    ["Troll-Female-Feet"] = 541,
    ["Troll-Female-Hands"] = 538,
    ["Troll-Female-Head"] = 531,
    ["Troll-Female-Legs"] = 540,
    ["Troll-Female-Robe"] = 534,
    ["Troll-Female-Chest"] = 535,
    ["Troll-Female-Shirt"] = 535,
    ["Troll-Female-Shoulder"] = 532,
    ["Troll-Female-Shoulder-Alt"] = 745,
    ["Troll-Female-Tabard"] = 536,
    ["Troll-Female-Waist"] = 539,
    ["Troll-Female-Wrist"] = 537,
    ["Troll-Male-Back"] = 522,
    ["Troll-Male-Chest"] = 689,
    ["Troll-Male-Feet"] = 530,
    ["Troll-Male-Hands"] = 527,
    ["Troll-Male-Head"] = 520,
    ["Troll-Male-Legs"] = 529,
    ["Troll-Male-Robe"] = 523,
    ["Troll-Male-Chest"] = 524,
    ["Troll-Male-Shoulder"] = 521,
    ["Troll-Male-Shoulder-Alt"] = 744,
    ["Troll-Male-Tabard"] = 525,
    ["Troll-Male-Waist"] = 528,
    ["Troll-Male-Wrist"] = 526,
    ["Undead-Female-Back"] = 555,
    ["Undead-Female-Feet"] = 563,
    ["Undead-Female-Hands"] = 560,
    ["Undead-Female-Head"] = 553,
    ["Undead-Female-Legs"] = 562,
    ["Undead-Female-Robe"] = 556,
    ["Undead-Female-Chest"] = 557,
    ["Undead-Female-Shirt"] = 557,
    ["Undead-Female-Shoulder"] = 554,
    ["Undead-Female-Shoulder-Alt"] = 747,
    ["Undead-Female-Tabard"] = 558,
    ["Undead-Female-Waist"] = 561,
    ["Undead-Female-Wrist"] = 559,
    ["Undead-Male-Back"] = 544,
    ["Undead-Male-Chest"] = 690,
    ["Undead-Male-Feet"] = 552,
    ["Undead-Male-Hands"] = 549,
    ["Undead-Male-Head"] = 542,
    ["Undead-Male-Legs"] = 551,
    ["Undead-Male-Robe"] = 545,
    ["Undead-Male-Shirt"] = 546,
    ["Undead-Male-Shoulder"] = 543,
    ["Undead-Male-Shoulder-Alt"] = 746,
    ["Undead-Male-Tabard"] = 547,
    ["Undead-Male-Waist"] = 550,
    ["Undead-Male-Wrist"] = 548,
    ["Worgen-Female-Back"] = 322,
    ["Worgen-Female-Feet"] = 330,
    ["Worgen-Female-Hands"] = 327,
    ["Worgen-Female-Head"] = 320,
    ["Worgen-Female-Legs"] = 329,
    ["Worgen-Female-Robe"] = 323,
    ["Worgen-Female-Chest"] = 324,
    ["Worgen-Female-Shirt"] = 324,
    ["Worgen-Female-Shoulder"] = 321,
    ["Worgen-Female-Shoulder-Alt"] = 728,
    ["Worgen-Female-Tabard"] = 325,
    ["Worgen-Female-Waist"] = 328,
    ["Worgen-Female-Wrist"] = 326,
    ["Worgen-Male-Back"] = 311,
    ["Worgen-Male-Feet"] = 319,
    ["Worgen-Male-Hands"] = 316,
    ["Worgen-Male-Head"] = 309,
    ["Worgen-Male-Legs"] = 318,
    ["Worgen-Male-Robe"] = 312,
    ["Worgen-Male-Chest"] = 313,
    ["Worgen-Male-Shirt"] = 313,
    ["Worgen-Male-Shoulder"] = 310,
    ["Worgen-Male-Shoulder-Alt"] = 727,
    ["Worgen-Male-Tabard"] = 314,
    ["Worgen-Male-Waist"] = 317,
    ["Worgen-Male-Wrist"] = 315,
}

local function checkboxGetValue(self) return nss.db[self.key] end
local function checkboxSetChecked(self) self:SetChecked(self:GetValue()) end
local function checkboxSetValue(self, checked) nss.db[self.key] = checked end
local function checkboxOnClick(self)
    local checked = self:GetChecked()
    PlaySound(checked and "igMainMenuOptionCheckBoxOn" or "igMainMenuOptionCheckBoxOff")
    self:SetValue(checked)
end

local function newCheckbox(parent, key, label, description, getValue, setValue)
    local check = CreateFrame("CheckButton", "AppearanceTooltipOptionsCheck" .. key, parent, "InterfaceOptionsCheckButtonTemplate")

    check.key = key
    check.GetValue = getValue or checkboxGetValue
    check.SetValue = setValue or checkboxSetValue
    check:SetScript('OnShow', checkboxSetChecked)
    check:SetScript("OnClick", checkboxOnClick)
    check.label = _G[check:GetName() .. "Text"]
    check.label:SetText(label)
    check.tooltipText = label
    check.tooltipRequirement = description
    return check
end

local function newDropdown(parent, key, description, values)
    local dropdown = CreateFrame("Frame", "AppearanceTooltipOptions" .. key .. "Dropdown", parent, "UIDropDownMenuTemplate")
    dropdown.key = key
    dropdown:HookScript("OnShow", function()
        if not dropdown.initialize then
            UIDropDownMenu_Initialize(dropdown, function(frame)
                for k, v in pairs(values) do
                    local info = UIDropDownMenu_CreateInfo()
                    info.text = v
                    info.value = k
                    info.func = function(self)
                        nss.db[key] = self.value
                        UIDropDownMenu_SetSelectedValue(dropdown, self.value)
                    end
                    UIDropDownMenu_AddButton(info)
                end
            end)
            UIDropDownMenu_SetSelectedValue(dropdown, nss.db[key])
        end
    end)
    dropdown:HookScript("OnEnter", function(self)
        if not self.isDisabled then
            GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT")
            GameTooltip:SetText(description, nil, nil, nil, nil, true)
        end
    end)
    dropdown:HookScript("OnLeave", GameTooltip_Hide)
    return dropdown
end

local function newFontString(parent, text, template,  ...)
    local label = parent:CreateFontString(nil, nil, template or 'GameFontHighlight')
    label:SetPoint(...)
    label:SetText(text)

    return label
end

local function newBox(parent, title, height)
    local boxBackdrop = {
        bgFile = [[Interface\ChatFrame\ChatFrameBackground]], tile = true, tileSize = 16,
        edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]], edgeSize = 16,
        insets = {left = 4, right = 4, top = 4, bottom = 4},
    }

    local box = CreateFrame('Frame', nil, parent)
    box:SetBackdrop(boxBackdrop)
    box:SetBackdropBorderColor(.3, .3, .3)
    box:SetBackdropColor(.1, .1, .1, .5)

    box:SetHeight(height)
    box:SetPoint('LEFT', 12, 0)
    box:SetPoint('RIGHT', -12, 0)

    if title then
        box.Title = newFontString(box, title, nil, 'BOTTOMLEFT', box, 'TOPLEFT', 6, 0)
    end

    return box
end

-- and the actual config now

local panel = CreateFrame("Frame", nil, InterfaceOptionsFramePanelContainer)
panel:Hide()
panel:SetAllPoints()
panel.name = "|cff02F78E[幻化]|r功能增强"

local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
title:SetPoint("TOPLEFT", 16, -16)
title:SetText(panel.name)

local subText = panel:CreateFontString(nil, 'ARTWORK', 'GameFontHighlightSmall')
subText:SetMaxLines(3)
subText:SetNonSpaceWrap(true)
subText:SetJustifyV('TOP')
subText:SetJustifyH('LEFT')
subText:SetPoint('TOPLEFT', title, 'BOTTOMLEFT', 0, -8)
subText:SetPoint('RIGHT', -32, 0)
subText:SetText("以下设置便于你更好的使用幻化鼠标提示框插件")

local dressed = newCheckbox(panel, 'dressed', '穿衣状态', "Show the model wearing your current outfit, apart from the previewed item")
local uncover = newCheckbox(panel, 'uncover', 'Uncover previewed item', "Remove clothes that would hide the item you're trying to preview")
local mousescroll = newCheckbox(panel, 'mousescroll', '鼠标滚轮旋转', "Use the mousewheel to rotate the model in the tooltip")
local spin = newCheckbox(panel, 'spin', '旋转模型', "Constantly spin the model while it's displayed")
local notifyKnown = newCheckbox(panel, 'notifyKnown', '提示是否已收藏', "Display a label showing whether you know the item appearance already")
local currentClass = newCheckbox(panel, 'currentClass', '仅限当前角色', "Only show previews on items that the current character can collect")
local byComparison = newCheckbox(panel, 'byComparison', '在对比框显示', "If the comparison tooltip is shown where the preview would want to be, show next to it (this makes it *much* less likely you'll have the preview overlap your cursor)")

local zoomWorn = newCheckbox(panel, 'zoomWorn', '仅显示该装备部位', "Zoom in on the part of your model which wears the item")
local zoomHeld = newCheckbox(panel, 'zoomHeld', '不保持手持状态', "Zoom in on the held item being previewed, without seeing your character")
local zoomMasked = newCheckbox(panel, 'zoomMasked', 'Mask out model while zoomed', "Hide the details of your player model while you're zoomed (like the transmog wardrobe does)")

local modifier = newDropdown(panel, 'modifier', "设置组合功能键", {
    Alt = "Alt",
    Ctrl = "Ctrl",
    Shift = "Shift",
    None = "无",
})
UIDropDownMenu_SetWidth(modifier, 100)

local anchor = newDropdown(panel, 'anchor', "Side of the tooltip to attach to, depending on where on the screen it's showing", {
    vertical = "上 / 下",
    horizontal = "左 / 右",
})
UIDropDownMenu_SetWidth(anchor, 100)
local modelBox = newBox(panel, "自定义模型种族", 48)
local customModel = newCheckbox(modelBox, 'customModel', '使用不同的模型', "Instead of your current character, use a specific race/gender")
local customRaceDropdown = newDropdown(modelBox, 'modelRace', "选择你要的种族模型", {
    [1] = "人类",
    [3] = "矮人",
    [4] = "暗夜精灵",
    [11] = "德莱尼",
    [22] = "狼人",
    [7] = "侏儒",
    [24] = "熊猫人",
    [2] = "兽人",
    [5] = "亡灵",
    [10] = "血精灵",
    [8] = "巨魔",
    [6] = "牛头人",
    [9] = "地精",
})
UIDropDownMenu_SetWidth(customRaceDropdown, 100)
local customGenderDropdown = newDropdown(modelBox, 'modelGender', "选择你要的性别", {
    [0] = "男",
    [1] = "女",
})
UIDropDownMenu_SetWidth(customGenderDropdown, 100)

-- And put them together:

zoomWorn:SetPoint("TOPLEFT", subText, "BOTTOMLEFT", 0, -8)
zoomHeld:SetPoint("TOPLEFT", zoomWorn, "BOTTOMLEFT", 0, -4)
zoomMasked:SetPoint("TOPLEFT", zoomHeld, "BOTTOMLEFT", 0, -4)

dressed:SetPoint("TOPLEFT", zoomMasked, "BOTTOMLEFT", 0, -4)
uncover:SetPoint("TOPLEFT", dressed, "BOTTOMLEFT", 0, -4)
notifyKnown:SetPoint("TOPLEFT", uncover, "BOTTOMLEFT", 0, -4)
currentClass:SetPoint("TOPLEFT", notifyKnown, "BOTTOMLEFT", 0, -4)
mousescroll:SetPoint("TOPLEFT", currentClass, "BOTTOMLEFT", 0, -4)
spin:SetPoint("TOPLEFT", mousescroll, "BOTTOMLEFT", 0, -4)

local modifierLabel = newFontString(panel, "设置组合功能键:", nil, 'TOPLEFT', spin, 'BOTTOMLEFT', 0, -10)
modifier:SetPoint("LEFT", modifierLabel, "RIGHT", 4, -2)

local anchorLabel = newFontString(panel, "附着于:", nil, 'TOPLEFT', modifierLabel, 'BOTTOMLEFT', 0, -16)
anchor:SetPoint("LEFT", anchorLabel, "RIGHT", 4, -2)

byComparison:SetPoint("TOPLEFT", anchorLabel, "BOTTOMLEFT", 0, -10)

modelBox:SetPoint("TOP", anchor, "BOTTOM", 0, -50)
customModel:SetPoint("LEFT", modelBox, 12, 0)
customRaceDropdown:SetPoint("LEFT", customModel.Text, "RIGHT", 12, -2)
customGenderDropdown:SetPoint("TOPLEFT", customRaceDropdown, "TOPRIGHT", 4, 0)

InterfaceOptions_AddCategory(panel)

-- Slash handler
SlashCmdList.APPEARANCETOOLTIP = function(msg)
    InterfaceOptionsFrame_OpenToCategory("|cff02F78E[幻化]|r功能增强")
    InterfaceOptionsFrame_OpenToCategory("|cff02F78E[幻化]|r功能增强")
end
SLASH_APPEARANCETOOLTIP1 = "/appearancetooltip"
SLASH_APPEARANCETOOLTIP2 = "/aptip"
