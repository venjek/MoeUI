------------------------------------------------------------
-- WhisperPop.lua
--
-- Abin
-- 2010-9-28
------------------------------------------------------------

WhisperPop = {}
WhisperPop.IGNORED_MESSAGES = { "<DBM>", "<BWS>", "<BigWigs>", "<BIGWIGS>", "LVBM" } -- Add your ignore tags
WhisperPop.db = { sound = 1, time = 1, help = 1 }
WhisperPop.newNames = {}
WhisperPop.filter = {
	"����","�µ�","����","�ٴ�","���","ƽ̨","ƽ�_","������","ר����","��","С��","�㿨","����","�c��","�c��","�ձ�","���","С��","��Բ��","��Բ��","СԲ��","��rt2","��rt2","Сrt2","rt2rt2","����","����","�н�","�ֹ�","�ִ�","����","����","��ˢ","����","����","��ˢ","dai��","dai��","daiˢ","������","������","���","����","�۽�","����","�f��","���","w��","��g","��g","��g","�fg","��g","wg","����","��̸","��ѯ","����","����","��ֵ","��ֵ","�ײ�","ˢ��[���]","����[���]","��.*����","����.*��","�۸񹫵�","��������","�ǳ�����","��.*��Ǯ","��.*���","��.*�Ż�","��.*s1","��.*s1","��Ϸ��","��ͼ�","�޺ڽ�","�����","�޷���","���ٸ�","���ϵ�","��=","g=","Ԫ=","5173","֧����","֧����","�Ա�","�Ԍ�","�ʹ�","���","����","����","��q","��ҵq","��ѯ","��ϵ","�绰","����","�ڿ�","�ۿ�","ߵߵ","����","ѾѾ","��������","���ְ�æ��","��������ʦ","Ѫ�����fm","����",
	"taobao","8o","9o","��[o0]","��[o0]","��","��","��","��","��","��","��","��","��","��","��","�{","�",
		"�Ԍ�","�Ա�","����","���ֹ�","���ֹ�","ţ��","�f��","�ֹ���","�ֹ�G","ƽ�_","��һ�r","�ʹڵ�","����","����","�_�","�n�","���򲻐�","�e��","��Ԫ��","���A��܊","�߶�","1-85","����","���u��","��β��","ƽ̨����","����","�н�","������","���ֹ�","��Ϸ��","����","����","ս��","�ֹ���","�ֹ�G","�й�","����","�ʹڵ�","һ��","��װ����","�c��","����","����","�ʹ�","С��","��","���","С��","�ػ�","����","�߻�","�ײ�","�ֹ���","����","����","Style","��Ҷ","��ˢ","��ץ","��ˢ","ţ��","רҵ","��ҵ","����","QQ","���","��ϵ","����","-60","-100","-90","2200","2400","3200","0Ԫ","����","����","�Ż�","����","ĬĬ","����","��ֵ","����","��ζ","����","�ƽ�","ս��","����","����","С��","��","����","ѾѾ","����","һ����","С̖","�c�~","�ػ�","��ҹ","����","��Բ","����","����","���","�ս�","��G","�c�M","��װ","ǳ��","߹��","����","��ʱ��","Сʱ��","660","���ݻ���","����","0��","W��","PJ40","Ф��","���","0��","3015","�cо","-100","90-","��ζ","W=","��ɢ��","һ��","��","��","��","��","�fG","����","��","��ˢ","�ձ�","�c�M","����","�c.��","����","���ƾ�Ӫ","G����","��G","��.ȭ.��.¡","ȫ.��.��.��","ȫ��","��.��_��.��","RMB=","���Ű���ҵ","�����޵�","�޵�0��","С�ɰ�","ˢ����","��.��","��.��","��.��","��.��","������˹","��Q","С-��","��-��","H����","����","���һ��","վ��","С.��.��","��/С","С.��","��.��","ʮ��G","������","����ļ","��.��","42.W","ǧ��ǧѰ","Ϧ���辡","��{rt2}","С{rt2}","ˢ��[���]","����[���]","����G","����","����ҵ","��Z","ѩ��","��{rt2}","{rt2}shop","��{rt2}","��{rt2}","��{@}��","��{@}ս","��.��","��ˮ�Ʒ�","ˮ�Ʒ�","{*}��","{*}��","{*}��{*}��","����G��","����G","ţţ","����H��","��H��ʯ","��β��","����G��","�۸񹫵�","ǿ���ϰ�","��ʬ�ϰ�","�۸������","��ʯG��","�ʳ�","�ϰ��޾���","ǿ������","���ϰ�","���H��ʯ","G�Ű���","�����ϰ�","���ѵ��ϰ�","֧F��","�ݺ�ħ��","֧����ʬ","��","��","��ʯ���쳧","$����","����1W","��������","ɢ��","����","����","��ʯG��","ְҵ�ϰ�","��}","H���I","������Ʊ","����","����","������","���I","��ɢ","��ͼ�"
}

function WhisperPop:IsIgnoredMessage(text)
	local pattern
	for _, pattern in ipairs(self.IGNORED_MESSAGES) do
		if strfind(text, pattern) then
			return pattern
		end
	end
end

function WhisperPop:IsFilterMessage(text)
	local pattern
	local dofilter = false
	for _, pattern in ipairs(self.filter) do
		if strfind(text, pattern) then
			dofilter = true
		end
	end
	return dofilter
end

function WhisperPop:CreateCommonFrame(name, parent, titleText)
	local frame = CreateFrame("Button", name, parent)
	frame:Hide()
	frame:SetWidth(165)
	frame:SetHeight(262)
	frame:SetClampedToScreen(true)
	frame:SetBackdrop({ bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", tile = true, tileSize = 16, edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 16, insets = { left = 5, right = 5, top = 5, bottom = 5 } })

	local title = frame:CreateFontString(name.."Title", "ARTWORK", "GameFontNormal")
	title:SetPoint("TOP", 0, -7)
	title:SetText(titleText)
	frame.title = title

	local button = CreateFrame("Button", name.."CloseButton", frame, "UIPanelCloseButton")
	frame.topClose = button
	button:SetPoint("TOPRIGHT", -2, -2)
	button:SetWidth(24)
	button:SetHeight(24)

	return frame
end

function WhisperPop:CreatePlayerButton(button, name, parent)
	if not button then
		button = CreateFrame("Frame", name, parent)
		button:SetWidth(100)
		button:SetHeight(20)
	end

	button.classIcon = button:CreateTexture(button:GetName().."ClassIcon", "ARTWORK")	
	button.classIcon:SetWidth(16)
	button.classIcon:SetHeight(16)
	button.classIcon:SetPoint("LEFT", 4, 0)

	button.nameText = button:CreateFontString(button:GetName().."NameText", "ARTWORK", "GameFontHighlightSmallLeft")
	button.nameText:SetPoint("LEFT", button.classIcon, "RIGHT", 2, 0)

	button.SetPlayer = function(self, class, name)			
		self.nameText:SetText(name)
		local coords = CLASS_ICON_TCOORDS[class]
		if coords then
			self.classIcon:SetTexture("Interface\\WorldStateFrame\\Icons-Classes")
			self.classIcon:SetTexCoord(coords[1], coords[2], coords[3], coords[4])
			self.classIcon:Show()
		elseif class == "GM" then
			self.classIcon:SetTexture("Interface\\AddOns\\WhisperMaster\\GM")
			self.classIcon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
			self.classIcon:Show()
		elseif class == "BN" then
			self.classIcon:SetTexture("Interface\\AddOns\\WhisperMaster\\BN")
			self.classIcon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
			self.classIcon:Show()
		else
			self.classIcon:Hide()
		end
	end

	return button
end

function WhisperPop:OnNewMessage(name, text, inform, guid)
	if not inform and self.db.sound then
		PlaySoundFile("Interface\\AddOns\\WhisperMaster\\Notify.mp3") -- Got new message!
	end
end

function WhisperPop:GetNumNewNames()
	return getn(self.newNames)
end

function WhisperPop:GetNewName(id)
	return self.newNames[id or 1]
end

function WhisperPop:OnListUpdate()
	wipe(self.newNames)
	local i
	for i = 1, self.list:GetDataCount() do
		local data = self.list:GetData(i)
		if data.new then
			tinsert(self.newNames, data.name)
		end
	end

	self.tipFrame:SetTip(self.newNames[1])
end

function WhisperPop:ToggleFrame()
	if WhisperPop.mainFrame:IsShown() then
		WhisperPop.mainFrame:Hide()
	else
		WhisperPop.mainFrame:Show()
	end
end