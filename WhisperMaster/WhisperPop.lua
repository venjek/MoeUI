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
	"信誉","下单","网游","速带","查店","平台","平臺","工作室","专卖店","大卡","小卡","点卡","点心","點卡","點心","烧饼","大饼","小饼","烧圆形","大圆形","小圆形","烧rt2","大rt2","小rt2","rt2rt2","担保","擔保","承接","手工","手打","代打","代练","代刷","带打","带练","带刷","dai打","dai练","dai刷","带评级","代评级","打金","卖金","售金","出金","萬金","万金","w金","打g","卖g","售g","萬g","万g","wg","详情","详谈","详询","信誉","信赖","充值","储值","套餐","刷屏[勿见]","扰屏[勿见]","绑定.*上马","上马.*绑定","价格公道","货到付款","非诚勿扰","先.*后钱","先.*后款","价.*优惠","代.*s1","售.*s1","游戏币","最低价","无黑金","不封号","无风险","好再付","年老店","金=","g=","元=","5173","支付宝","支付寶","淘宝","淘寶","皇冠","冲冠","热销","促销","加q","企业q","咨询","联系","电话","旺旺","口口","扣扣","叩叩","歪歪","丫丫","大神带你打","高手帮忙打","竞技场大师","血腥舞钢fm","满及",
	"taobao","8o","9o","八[o0]","九[o0]","０","○","①","②","③","④","⑤","⑥","⑦","⑧","⑨","泏","釒",
		"淘寶","淘宝","旺旺","純手工","纯手工","牛肉","萬斤","手工金","手工G","平臺","黑一賠","皇冠店","代練","代打","沖鑽","衝鑽","非球不愛","積分","總元帥","高階督軍","高督","1-85","消保","好評率","大尾巴","平台交易","担保","承接","工作室","纯手工","游戏币","代打","代练","战点","手工金","手工G","托管","带级","皇冠店","一赔","套装消费","點心","冲钻","店铺","皇冠","小卡","大卡","大饼","小饼","特惠","加盟","七煌","套餐","手工带","塞纳","尘埃","Style","落叶","代刷","代抓","带刷","牛肉","专业","毕业","大桥","QQ","企鹅","联系","点心","-60","-100","-90","2200","2400","3200","0元","消保","好评","优惠","付款","默默","续费","充值","大桥","美味","梦想","黄金","战场","征服","打扰","小花","大花","出货","丫丫","声旺","一波流","小號","渃葉","熵会","落夜","天意","佰圆","二佰","二二","金币","收金","万G","點訫","军装","浅唱","吖妹","续费","大时间","小时间","660","保驾护航","贰百","0万","W金","PJ40","肖废","万金","0块","3015","點芯","-100","90-","美味","W=","可散卖","一百","⒈","⒐","⒉","⒎","萬G","畅游","￥","代刷","陶宝","點訫","宝儿","點.卡","饼干","老牌经营","G出售","买G","重.拳.戈.隆","全.网.最.低","全网","荣.誉_征.服","RMB=","包团包毕业","风神无敌","无敌0灯","小可爱","刷红玉","荣.誉","征.服","荣.征","誉.服","波塞冬斯","的Q","小-可","可-爱","H副本","抱团","最后一波","站神","小.甜.心","大/小","小.可","可.爱","十万G","带红玉","接招募","二.佰","42.W","千与千寻","夕瑶歌尽","大{rt2}","小{rt2}","刷屏[勿见]","扰屏[勿见]","月下G","包团","包毕业","挑Z","雪亽","陶{rt2}","{rt2}shop","冰{rt2}","点{rt2}","冰{@}点","挑{@}战","上.陶","锈水财阀","水财阀","{*}冰","{*}点","{*}竞{*}技","月下G团","月下G","牛牛","冰封H黑","封H黑石","大尾巴","内销G团","价格公道","强力老板","躺尸老板","价格便宜啦","黑石G团","皇朝","老板无竞争","强力消费","来老板","跨服H黑石","G团包过","消费老板","消费的老板","支F宝","纵横魔兽","支持躺尸","⑥","⑤","黑石铸造厂","$带走","比例1W","马云消费","散卖","正负","消废","黑石G团","职业老板","清倉","H畢業","黑手门票","宝搜","内销","赈灾团","畢業","可散","最低价"
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