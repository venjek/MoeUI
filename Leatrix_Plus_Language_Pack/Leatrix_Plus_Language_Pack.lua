----------------------------------------------------------------------
-- 	L00: Leatrix Plus Language Pack Template 7.0.56 (1st September 2016)
----------------------------------------------------------------------

--  Create global table
	LeaPlusDX = {}; local L = LeaPlusDX

----------------------------------------------------------------------
-- 	Translator Credit
----------------------------------------------------------------------

	L["TranslatedBy"]
	= "Siweia"

----------------------------------------------------------------------
-- 	Home
----------------------------------------------------------------------

	L["Home"]
	= "主页"

	L["Version"]
	= "版本"

	L["Welcome to Leatrix Plus."]
	= "欢迎使用Leatrix Plus"

	L["To begin, choose an options page."]
	= "请选择一项开始使用"

	L["Support"]
	= "帮助支持"

	L["Translation"]
	= "翻译"

----------------------------------------------------------------------
-- 	L01: Automation
----------------------------------------------------------------------

	-- Title
	L["Automation"]
	= "自动交互"

	-- Headings
	L["Character"]
	= "角色"

	L["Vendors"]
	= "商贩"

	-- Automate quests
	L["Automate quests"]
	= "任务自动交接"

	L["If checked, quests will be selected, accepted and turned-in automatically.\n\nIgnored quests will not be automated.\n\nYou can hold the shift key down when you talk to a quest giver to over-ride this setting."]
	= "勾选后，任务会自动交接。\n\n忽略的任务不会被自动交接。\n\n当你和NPC对话时按住Shift键，可以暂时忽略此项功能。"

		-- Configuration panel
		L["Automate Quests"]
		= "任务自动交接"

		L["Include daily quests"]
		= "日常任务"

		L["If checked, daily quests will be selected and accepted automatically."]
		= "勾选后，日常任务会被自动交接。"

		L["Include weekly quests"]
		= "周长任务"

		L["If checked, weekly quests will be selected and accepted automatically."]
		= "勾选后，周长任务会被自动交接。"

	-- Automate gossip
	L["Automate gossip"]
	= "对话自动交互"

	L["If checked, gossip will be selected automatically if only one gossip option is being offered.\n\nGossip will not be automated if you are in a garrison or order hall.\n\nYou can hold the shift key down when you open a gossip window to over-ride this setting."]
	= "勾选后，会自动交互只有一个选择项的对话。\n\n在职业大厅或者要塞中会停止这种自动交互。\n\n当你打开对话窗口时按住Shift键，可以暂时忽略此项功能。"

	-- Accept summon
	L["Accept summon"]
	= "自动接受召唤"

	L["If checked, summon requests will be accepted automatically unless you are in combat."]
	= "勾选后，当你不处于战斗状态时会自动接受召唤。"

	-- Accept resurrection
	L["Accept resurrection"]
	= "自动接受战复"

	L["If checked, resurrection requests will be accepted automatically."]
	= "勾选后，你将自动接受战复。\n\n你可以点击右边的按钮进行设置。"

		-- Config panel
		L["Accept Resurrection"]
		= "自动接受战复"

		L["Thank the player who resurrected you"]
		= "感谢战复你的玩家"

		L["If checked, your character will emote a thank you when a resurrection is automatically accepted."]
		= "勾选后，当你接受战复时会发送一个感谢的表情。"

		L["Exclude combat resurrection requests"]
		= "战斗中不接受战复"

		L["If checked, resurrection requests will not be automatically accepted if the player resurrecting you is in combat."]
		= "勾选后，当你在战斗中被战复将不再自动接受。"

	-- Release in PvP
	L["Release in PvP"]
	= "PvP自动释放尸体"

	L["If checked, you will release automatically after you die in a designated PvP zone.\n\nYou will not release automatically if you have the ability to self-resurrect (soulstone, reincarnation, etc)."]
	= "勾选后，你在PVP区域阵亡时将自动释放尸体。\n\n你可以点击右边的按钮进行设置。\n\n当你能自我战复时（如术士灵魂石、萨满复生），不会自动释放尸体。"

		-- Config panel
		L["Select the zones where automatic release should operate."]
		= "选择可以自动释放尸体的区域"

		L["Battlegrounds"]
		= "战场"

		L["If checked, you will release automatically after you die in a battleground."]
		= "勾选后，在战场中阵亡将自动释放尸体。"

		L["Wintergrasp"]
		= "冬拥湖"

		L["If checked, you will release automatically after you die in Wintergrasp."]
		= "勾选后，在冬拥湖中阵亡将自动释放尸体。"

		L["Tol Barad (the PvP zone)"]
		= "托尔巴拉德战场"

		L["If checked, you will release automatically after you die in Tol Barad (the PvP zone)."]
		= "勾选后，在托尔巴拉德战场中阵亡将自动释放尸体。"

		L["Ashran"]
		= "阿什兰战场"

		L["If checked, you will release automatically after you die in Ashran."]
		= "勾选后，在阿什兰战场中阵亡将自动释放尸体。"

	-- Sell junk automatically
	L["Sell junk automatically"]
	= "自动出售杂物"

	L["If checked, all grey items in your bags will be sold automatically when you visit a merchant.\n\nYou can hold the shift key down when you talk to a merchant to over-ride this setting."]
	= "勾选后，当你访问商贩时将自动出售背包中的杂物。\n\n当你访问时按住Shift键，可以暂时忽略该功能。"

		-- Config panel
		L["Sell Junk Automatically"]
		= "自动出售杂物"

		L["Show a summary of items sold"]
		= "显示售出杂物的总价"

		L["If checked, a brief summary will be shown in chat when items are sold automatically."]
		= "勾选后，自动售出的杂物会在聊天窗口显示一个大致的总价。"

		L["Show item links for items sold"]
		= "显示售出杂物的物品链接"

		L["If checked, item links will be shown in chat when items are sold automatically."]
		= "勾选后，自动售出的杂物会在聊天窗口中显示物品链接。"

		-- Chat message
		L["Sold"]
		= "出售"

		L["item for"]
		= "物品价格"

		L["items for"]
		= "物品价格"

		-- Merchant frame banner
		L["SELLING JUNK"]
		= "出售杂物"

	-- Repair automatically
	L["Repair automatically"]
	= "自动修理装备"

	L["If checked, your gear will be repaired automatically when you visit a suitable merchant.\n\nYou can hold the shift key down when you talk to a merchant to over-ride this setting."]
	= "勾选后，当你访问修理商时将自动修理装备。\n\n你可以访问时按住Shift键，可以暂时忽略该功能。"

		-- Config panel
		L["Repair Automatically"]
		= "自动修理装备"

		L["Repair using guild funds if available"]
		= "优先可用的公会资金"

		L["If checked, repair costs will be taken from guild funds for characters that are guilded and have permission to repair."]
		= "勾选后，修理装备时将优先使用可用的公会资金。"

		L["Show a brief summary of repair costs"]
		= "显示修理花费"

		L["If checked, a brief summary of repair costs will be shown in chat when an automated repair is attempted."]
		= "勾选后，自动修理的大致费用会显示在聊天窗口。"

		-- Chat message
		L["Repaired for"]
		= "修理花费"

----------------------------------------------------------------------
-- 	L02: Social
----------------------------------------------------------------------

	-- Title
	L["Social"]
	= "社交信息"

	-- Headings
	L["Blocks"]
	= "屏蔽"

	L["Groups"]
	= "队伍"

	-- Block duels
	L["Block duels"]
	= "屏蔽决斗信息"

	L["If checked, duel requests will be blocked unless the player requesting the duel is in your friends list or guild."]
	= "勾选后，对于非好友和非公会成员的决斗信息会被屏蔽。"

	-- Block pet battle duels
	L["Block pet battle duels"]
	= "屏蔽宠物对战"

	L["If checked, pet battle duel requests will be blocked unless the player requesting the duel is in your friends list or guild."]
	= "勾选后，对于非好友和非公会成员的宠物对战信息会被屏蔽。"

	-- Block party invites
	L["Block party invites"]
	= "屏蔽队伍邀请"

	L["If checked, party invitations will be blocked unless the player inviting you is in your friends list or guild."]
	= "勾选后，对于非好友和非公会成员的组队邀请会被屏蔽。"

	-- Block friend requests
	L["Block friend requests"]
	= "屏蔽好友申请"

	L["If checked, BattleTag and Real ID friend requests will be automatically declined.\n\nEnabling this option will automatically decline any pending requests."]
	= "勾选后，战网好友申请会自动屏蔽。\n\n启用后，当前待处理的申请会自动拒绝。"

		-- Chat message
		L["A friend request from"]
		= "你有一个好友申请，来自"

		L["was automatically declined."]
		= "已经自动拒绝。"

	-- Party from friends
	L["Party from friends"]
	= "好友组队邀请"

	L["If checked, party invitations from friends or guild members will be automatically accepted unless you are queued in Dungeon Finder."]
	= "勾选后，如果你不在地下城队列中，你的好友或公会成员发送的组队申请会被自动接受。"

	-- Queue from friends
	L["Queue from friends"]
	= "好友队列申请"

	L["If checked, requests initiated by your party leader to join the Dungeon Finder queue will be automatically accepted if the party leader is in your friends list or guild.\n\nThis option requires that you have selected a role for your character in the Dungeon Finder window."]
	= "勾选后，如果你的小队队长是你的好友或公会成员，其申请的地下城请求会被自动接受。\n\n这个选项不会自动将你传送到副本中。\n\n这个选项需要你在地下城页面选择一个职责。"

	-- Group from premades
	L["Group from premades"]
	= "预创建队伍"

	L["If checked, premade group invitations (for premade groups that you are signed up for) will be automatically accepted."]
	= "勾选后，你所申请的预创建队伍的邀请会被自动接受。"

	-- Invite from whispers
	L["Invite from whispers"]
	= "密语邀请"

	L["If checked, a group invite will be automatically sent to anyone who whispers a designated keyword to you.\n\nYou need to be either ungrouped or party leader in your own group for this to work."]
	= "勾选后，你将自动邀请那些密语你关键词的玩家。\n\n你必须不处于队伍中，或当你是队长时才可进行此项操作。"

		-- Config panel
		L["Invite from Whispers"]
		= "密语邀请"

		L["Whisper keyword"]
		= "密语关键词"

		L["Enter the keyword that you want to use."]
		= "请输入你想设定的关键词。"

----------------------------------------------------------------------
-- 	L03: Chat
----------------------------------------------------------------------

	-- Title
	L["Chat"]
	= "聊天功能"

	-- Headings
	L["Chat Frame"]
	= "聊天窗口"

	L["Mechanics"]
	= "特性设置"

	-- Use easy resizing
	L["Use easy resizing"]
	= "使用简单拉伸"

	L["If checked, dragging the General chat tab while the chat frame is locked will expand the chat frame upwards.\n\n\If the chat frame is unlocked, dragging the General chat tab will move the chat frame."]
	= "勾选后，对锁定的聊天窗口进行拖动，会使其竖直拉伸。\n\n\对已解锁的聊天窗口进行拖动，会使其移动。"

	-- Hide the combat log
	L["Hide the combat log"]
	= "隐藏战斗记录窗口"

	L["If checked, the combat log will be hidden.\n\nThe combat log must be docked in order for this option to work.\n\nIf the combat log is undocked, you can dock it by dragging the tab (and reloading your UI) or by resetting the chat windows (from the chat menu)."]
	= "勾选后，战斗记录会被隐藏。\n\n战斗记录窗口必须未被分离时才能生效。\n\n如果战斗记录窗口被分离了，你可以拖动其合并至主窗口（然后重载插件），或者在聊天设置中重置设置。"

	L["Combat log cannot be hidden while undocked."]
	= "战斗记录窗口被分离时无法隐藏。"

	-- Hide chat buttons
	L["Hide chat buttons"]
	= "隐藏聊天窗口按钮"

	L["If checked, chat frame buttons will be hidden.\n\nClicking chat tabs will automatically show the latest messages.\n\nUse the mouse wheel to scroll through the chat history.  Hold down SHIFT for page jump or CTRL to jump to the top or bottom of the chat history."]
	= "勾选后，聊天窗口的按钮会被隐藏。\n\n点击窗口标签会自动显示最新的消息。\n\n使用鼠标滚轮可以查看历史消息。按住SHIFT进行消息页面跳转，按住CTRL将滚动至消息页首/页尾。"

	-- Unclamp chat frame
	L["Unclamp chat frame"]
	= "不限制窗口位置"

	L["If checked, you will be able to drag the chat frame to the edge of the screen."]
	= "勾选后，你可以把聊天窗口拖动到屏幕边缘。"

	-- Move editbox to top
	L["Move editbox to top"]
	= "把文本框移动上方"

	L["If checked, the editbox will be moved to the top of the chat frame."]
	= "勾选后文本框会被移动至聊天窗口上方。"

	-- Disable sticky chat
	L["Disable sticky chat"]
	= "禁用聊天频道粘滞"

	L["If checked, sticky chat will be disabled.\n\nNote that this does not apply to temporary chat windows."]
	= "勾选后，会禁用聊天频道的粘滞。\n\n此选项不会影响临时对话窗口。"

	-- Use arrow keys in chat
	L["Use arrow keys in chat"]
	= "允许使用方向键"

	L["If checked, you can press the arrow keys to move the insertion point left and right in the chat frame.\n\nIf unchecked, the arrow keys will use the default keybind setting."]
	= "勾选后，你可以使用方向键移动文本框中的光标。\n\n如果未被勾选，方向键将保持它所绑定的按键功能。"

	-- Disable chat fade
	L["Disable chat fade"]
	= "禁用聊天窗口淡出"

	L["If checked, chat text will not fade out after a time period."]
	= "勾选后，聊天信息不会在一定时间后淡出。"

	-- Universal group color
	L["Universal group color"]
	= "统一队伍颜色"

	L["If checked, raid chat and instance chat will both be colored blue (to match the default party chat color)."]
	= "勾选后，团队和副本聊天信息会改为蓝色（与小队一致）。"

	-- Use class colors in chat
	L["Use class colors in chat"]
	= "聊天职业染色"

	L["If checked, class colors will be used in the chat frame."]
	= "勾选后，聊天窗口中会使用职业颜色。"

	-- Increase chat history
	L["Increase chat history"]
	= "增加聊天历史记录"

	L["If checked, your chat history will increase to 4096 lines.  If unchecked, the default will be used (128 lines).\n\nEnabling this option may prevent some chat text from showing during login."]
	= "勾选后，你的聊天历史记录会增涨至4096行。如果未被勾选，会保持在默认的128行。\n\n启用这个设置可能会在登录时会隐藏一些聊天信息。"

----------------------------------------------------------------------
-- 	L04: Text
----------------------------------------------------------------------

	-- Title
	L["Text"]
	= "文本信息"

	-- Headings
	L["Visibility"]
	= "可见性"

	L["Text Size"]
	= "文本大小"

	-- Hide error messages
	L["Hide error messages"]
	= "隐藏错误信息"

	L["If checked, error messages (such as 'Not enough rage') will not be shown.\n\nIf you have the minimap button enabled, you can hold down CTRL and right-click it to toggle error messages without affecting this setting."]
	= "勾选后，错误信息（例如“怒气不足”）不再显示。\n\n如果你启用了小地图按钮，你可以CTRL+右键点击来进行开关。"

		-- Config panel
		L["Error Text"]
		= "错误文本"

		L["Show quest updates"]
		= "显示任务进度"

		L["If checked, quest updates will be shown in the error frame."]
		= "勾选后，任务进度会被显示在错误信息面板。"

		L["Show important error text"]
		= "显示重要错误文本"

		L["If checked, the following errors will be shown in the error frame:\n\n- Inventory full\n- Quest log full\n- Votekick alerts"]
		= "勾选后，如下的错误信息会显示在面板中：\n\n- 背包已满\n\n- 任务列表已满\n\n- 投票踢人通知"

	-- Hide portrait numbers
	L["Hide portrait numbers"]
	= "隐藏头像数字"

	L["If checked, damage and healing numbers in the player and pet portrait frames will be hidden."]
	= "勾选后，在玩家头像和宠物头像上的伤害及治疗数字不再显示。"

	-- Hide crafted names
	L["Hide crafted names"]
	= "隐藏制造者名字"

	L["If checked, crafted items will no longer show the name of the crafter."]
	= "勾选后，制造物品不再显示制造者的名字。"

	-- Hide zone text
	L["Hide zone text"]
	= "隐藏区域文本"

	L["If checked, zone text will not be shown (eg. 'Ironforge')."]
	= "勾选后，区域文本不再显示。"

	-- Hide subzone text
	L["Hide subzone text"]
	= "隐藏次级区域文本"

	L["If checked, subzone text will not be shown (eg. 'Mystic Quarter')."]
	= "勾选后，次级区域文本不再显示。"

	-- Resize mail text
	L["Resize mail text"]
	= "重设邮件文本"

	L["If checked, you will be able to change the font size of standard mail text.\n\nThis does not affect mail created using templates (such as auction house invoices)."]
	= "勾选后，你可以更改邮件文本的字体大小。\n\n这个选项不会影响系统邮件模版（例如拍卖行的收据信息）。"

		-- Configuration panel
		L["Mail Text"]
		= "邮件文本"

		L["Text size"]
		= "字体尺寸"

	-- Resize quest text
	L["Resize quest text"]
	= "重设任务文本"

	L["If checked, you will be able to change the font size of quest text.\n\nEnabling this option will also change the text size of other frames which inherit the same font (such as the Dungeon Finder frame)."]
	= "勾选后，你可以更改任务信息文本的字体大小。\n\n启用这个选项也会影响使用同一文本模版的框体（例如地下城查找器）。"

		-- Configuration panel
		L["Quest Text"]
		= "任务信息文本"

		L["Text Size"]
		= "字体尺寸"

----------------------------------------------------------------------
-- 	L05: Interface
----------------------------------------------------------------------

	-- Title
	L["Interface"]
	= "界面设置"

	-- Headings
	L["Enhancements"]
	= "增强功能"

	L["Extras"]
	= "其他"

	-- Enhance world map
	L["Enhance world map"]
	= "增强世界地图"

	L["If checked, you will be able to reveal unexplored areas of the map and show cursor coordinates at the top of the map."]
	= "勾选后，你可以显示地图的未探索区域，同时在顶部显示地图坐标。"

		-- Config panel
		L["World Map"]
		= "世界地图"

		L["Reveal unexplored areas of the map"]
		= "显示地图未探索区域"

		L["If checked, unexplored areas of the map will be revealed."]
		= "勾选后，将显示世界地图上的未探索区域。"

		L["Show reveal checkbox at the top of the map"]
		= "地图上方显示开关复选框"

		L["If checked, a checkbox will be shown at the top of the map which will allow you to toggle unexplored areas directly from the map frame."]
		= "勾选后，一个复选框会显示在地图上方，让你可以通过它自行开关未探索区域的显示功能。"

		L["Show cursor coordinates at the top of the map"]
		= "显示鼠标浮点坐标。"

		L["If checked, cursor coordinates will be shown at the top of the map."]
		= "勾选后，鼠标浮点坐标会显示在世界地图上方。"

		L["Fade windowed map while moving"]
		= "移动时淡出区域地图"

		L["If checked, the windowed map will fade while your character is moving and the cursor is not over the map."]
		= "勾选后，当你移动时，同时鼠标也并未指向区域地图，则区域地图会淡出。"

		-- Reveal checkbox on world map
		L["Reveal"]
		= "地图全亮"

	-- Customise minimap
	L["Customise minimap"]
	= "自定义小地图"

	L["If checked, you will be able to customise and rescale the minimap."]
	= "勾选后，你可以自定义小地图的大小。"

		-- Config panel
		L["Minimap"]
		= "小地图"

		L["Merge tracking button with calendar button"]
		= "合并追踪与日历按钮"

		L["If checked, the minimap tracking button will be merged with the calendar button to save space.\n\nThe new tracking button will be moved to the space normally occupied by the calendar button.\n\nYou will be able to left-click the tracking button to show the tracking menu and right-click it to show the calendar."]
		= "勾选后，小地图的追踪按钮会和日历按钮合并以便节省空间。\n\n新的追踪按钮会被移动至日历按钮的位置。\n\n你可以左键点击打开追踪，右键点击打开日历。"

		L["Hide zone information above the minimap"]
		= "隐藏区域信息"

		L["If checked, the zone information shown above the minimap, as well as the world map button, will be hidden.\n\nThe tooltip for the tracking button will show zone text information instead.\n\nTo show the world map, press the map bind key (M by default)."]
		= "勾选后，小地图上方的区域信息和地图按钮会被隐藏。\n\n追踪按钮的鼠标提示窗口会代为显示区域信息。\n\n你可以使用所绑定的按键来打开世界地图（默认M键）"

		L["Hide the clock below the minimap"]
		= "隐藏时钟"

		L["If checked, the clock will be hidden."]
		= "勾选后，隐藏小地图的时钟"

		L["Use the mousewheel to zoom in and out"]
		= "启用滚轮缩放"

		L["If checked, you will be able to use the mousewheel to zoom in and out of the minimap.  The zoom in/out buttons will be hidden."]
		= "勾选后，你可以通过滚轮缩放小地图的区域。相关放大/缩小按钮将被隐藏。"

		L["Minimap scale"]
		= "小地图尺寸"

		L["Scale and style the minimap using the settings on this page.\n\nThis panel will close automatically if you enter combat."]
		= "重设小地图的尺寸大小。\n\n这个页面在战斗中会自动隐藏"

	-- Manage tooltip
	L["Manage tooltip"]
	= "鼠标信息窗口"

	L["If checked, the tooltip will be color coded and you will be able to modify the tooltip layout and scale."]
	= "勾选后，鼠标信息会被着色，你可以设置他的布局和大小尺寸。"

		-- Config panel
		L["Tooltip"]
		= "鼠标信息窗口"

		L["Show guild ranks for your guild"]
		= "显示会阶"

		L["If checked, guild ranks will be shown for players in your guild."]
		= "勾选后，显示公会会阶。"

		L["Show the unit's target"]
		= "显示目标的目标"

		L["If checked, unit targets will be shown."]
		= "勾选后，目标的目标会显示在信息窗口上。"

		L["Color the backdrops based on faction"]
		= "根据阵营着色边框"

		L["If checked, backdrops will be tinted blue (friendly) or red (hostile)."]
		= "勾选后，信息窗口的边框会更改为蓝色（右方）或者红色（敌方）。"

		L["Hide tooltips for world units during combat"]
		= "战斗中隐藏窗口"

		L["If checked, tooltips for world units will be hidden during combat.\n\nYou can hold the shift key down to over-ride this setting."]
		= "勾选后，目标的信息窗口在战斗中会被隐藏。\n\n你可以按住SHIFT键暂时忽略这个设置。"

		L["Tooltip scale"]
		= "信息窗口大小"

		L["Drag the tooltip overlay to position it.\n\nScale and style the tooltip using the settings on this page."]
		= "拖动鼠标信息的外框来重新定位。\n\n尺寸大小的通过下方选项设置。"

	-- Show volume slider
	L["Show volume slider"]
	= "显示音量控制"

	L["If checked, a master volume slider will be shown on the character sheet.\n\nThe volume slider can be placed in either of two locations on the character sheet.  To toggle between them, hold the shift key down and right-click the slider."]
	= "勾选后，一个全局音量控制滑块会显示在角色信息框体。\n\n这个音量控制可以在两个位置之间切换，你可以按住SHIFT+鼠标右键进行切换。"

	-- Show auction controls
	L["Show auction controls"]
	= "显示拍卖行控制"

	L["If checked, additional functionality will be added to the auction house.\n\nBuyout only - create buyout auctions without filling in the starting price.\n\nGold only - set the copper and silver prices at 99 to speed up new auctions.\n\nFind - search the auction house for the item you are selling.\n\nIn addition, the auction duration setting will be saved account-wide."]
	= "勾选后，会给拍卖行添加额外的功能：\n\n仅限一口价 - 使用后，你不再需要输入起始价格。\n\n仅输入金币 - 自动在银币和铜币位输入99，以便加快新物品的上架。\n\n搜索按钮 - 在拍卖行搜索你正在出售的物品。\n\n额外的，拍卖物品的持续时间设置将保存为账户通用设置。"

		-- Auction controls
		L["Find Item"]
		= "查找物品"

		L["Buyout Only"]
		= "仅限一口价"

		L["Gold Only"]
		= "仅输入金币"

		-- Chat message
		L["To use the Find button, you need to deselect the Game Time filter."]
		= "使用搜索功能前，你要取消选择游戏时间过滤器。"

	-- Show dressup buttons
	L["Show dressup buttons"]
	= "显示试衣间按钮"

	L["If checked, two buttons will be added to the dressup frame which will allow you to hide your tabard or appear nude."]
	= "勾选后，两个按钮会添加到试衣间框体，用来隐藏战袍或者隐藏着装。"

		-- Dressup panel controls
		L["Nude"]
		= "隐藏着装"

		L["Tabard"]
		= "隐藏战袍"

	-- Show coordinates
	L["Show coordinates"]
	= "显示坐标"

	L["If checked, coordinates representing your character's location will be shown in a movable, customisable frame."]
	= "勾选后，你当前所在地点的坐标会显示在一个可自定义的窗口。"

		-- Config panel
		L["Coordinates"]
		= "坐标"

		L["Show the coordinates frame"]
		= "显示坐标框体"

		L["If checked, the coordinates frame will be shown.\n\nIf you have the minimap button enabled, you can hold down SHIFT and right-click it to toggle this setting at any time.\n\nIf unchecked, the coordinates frame will be disabled and no CPU power will be allocated to updating it."]
		= "勾选后，会显示坐标框体。\n\n如果插件的小地图按钮启用了，你可以按住SHIFT+右键点击来进行设置。\n\n如果未勾选，这个坐标框体会被禁用，同时也不会有任何资源占用。"

		L["Darken the frame background"]
		= "显示深色背景"

		L["If checked, a dark background will be used for the frame."]
		= "勾选后，框体会启用一个深色的背景。"

		L["Raise the frame strata level"]
		= "提高框体层级"

		L["If checked, the frame strata level will be set to HIGH allowing it to show on top of most frames.\n\nIf unchecked, the strata level will be set to MEDIUM."]
		= "勾选后，框体的层级会提升至最高，允许它显示在其他框体之上。\n\n如果未勾选，这个框体层级会被设置为中等。"

		L["Lock the frame and make it non-interactive"]
		= "框体禁用交互"

		L["If checked, the frame will be locked and you will not be able to move it.\n\nEnabling this option will make the frame non-interactive, meaning you will be able to click through it as if it wasn't there.\n\nThis is useful if you are showing the coordinates in a space where you would normally click (such as the game world or minimap)."]
		= "勾选后，框体会被锁定，你不能再移动它。\n\n启用这个选项后，框体不可交互，意味着你的鼠标不会再被其检测，仿佛框体不存在一般。\n\n这个选项用在当你把其放置于你经常需要点击的地方（比如游戏中央或者小地图）。"

		L["Scale"]
		= "尺寸"

		L["Drag the coordinates frame to position it.\n\nScale and style the frame using the settings on this page."]
		= "拖动坐标框体来自定义尺寸。\n\n在这个框体上有尺寸大小的设置选项。"

	-- Show spell icons
	L["Show spell icons"]
	= "显示法术监视"

	L["If checked, you will be able to place up to five beneficial spell icons (per specialisation) above the target or player frame.\n\nThis option is designed for watching spell cooldowns (such as Mend Pet or Ice Barrier).\n\nEnabling this option will prevent you from placing buffs above the target frame."]
	= "勾选后，你每个专精最高可在目标或玩家框体上放置5个法术图标。\n\n这个选项是为监视法术冷却准备的（例如治疗宠物或寒冰护体）。\n\n启用这个选项会阻止你在目标头像上放置法术。"

		-- Config panel
		L["Spell Icons"]
		= "法术监视"

		L["Show tooltips for the spell icons"]
		= "显示鼠标信息"

		L["If checked, tooltips for the spell icons will be shown when you hover over them."]
		= "勾选后，启用法术图标的鼠标提示信息。"

		L["Show the spell ID in buff icon tooltips"]
		= "显示法术ID"

		L["If checked, spell IDs will be shown in the tooltips of beneficial spell icons (located in the buff frame and under the target frame)."]
		= "勾选后，法术的鼠标提示信息会显示法术ID（在目标框体下方）。"

		L["Hide spell duration numbers (if enabled)"]
		= "隐藏法术计时"

		L["If checked, spell duration numbers will not be shown over the spell icons.\n\nIf unchecked, spell duration numbers will be shown over the spell icons if they are enabled in the game options panel ('ActionBars' menu)."]
		= "勾选后，法术的持续计时不再显示。\n\n如果未勾选，当你在界面-动作条开启相关选项后，会显示法术计时。"

		L["Anchor the spell icons to the player frame"]
		= "移动至玩家头像"

		L["If checked, spell icons will be shown above the player frame instead of the target frame.\n\nIf unchecked, spell icons will be shown above the target frame."]
		= "勾选后，法术图标会显示在玩家头像上方，而不是在目标头像上方。\n\n如果未勾选，法术图标会显示在目标头像上方。"

		L["Enter the spell IDs for the spell icons that you want to see.\n\nIf you want a spell icon to show only when the spell is stacked, enter the minimum stack size (otherwise leave it blank).\n\nIf a spell icon normally appears under the pet frame, check the pet checkbox.\n\nSpells are saved to your class specialisation.  You can enter a unique set of spells for each specialisation."]
		= "输入你想要监视的法术ID。\n\n如果你只想监视法术层数，那么请输入最低的层数（否则请留空）。\n\n如果法术通常出现在宠物框体，请勾选宠物复选框。\n\n所监视的法术是依据角色专精存储，你可以为自身的每一个专精独立设置。"

		-- Editbox headings
		L["Spell ID"]
		= "法术ID"

		L["Stack"]
		= "层数"

		L["Pet"]
		= "宠物"

		-- Tooltip
		L["Spell ID"]
		= "法术ID"

	-- Show durability status
	L["Show durability status"]
	= "显示耐久度"

	L["If checked, a button will be added to the character sheet which will show your equipped item durability when you hover the pointer over it.\n\nIn addition, an overall percentage will be shown in the chat frame when you die."]
	= "勾选后，一个按钮会显示在角色框体，其鼠标提示信息会显示身上的装备耐久度。\n\n当你死后，你的整体耐久度也会显示在聊天框体。"

		-- Chat message
		L["You have"]
		= "你有"

		L["durability"]
		= "耐久度"

		-- Character sheet tooltip
		L["Durability"]
		= "耐久度"

		L["Overall"]
		= "总计"

	-- Show pet save button
	L["Show pet save button"]
	= "保存宠物按钮"

	L["If checked, you will be able to save your current battle pet team (including abilities) to a single command.\n\nA button will be added to the Pet Journal.  Clicking the button will toggle showing the assignment command for your current team.  Pressing CTRL/C will copy the command to memory.\n\nYou can then paste the command (with CTRL/V) into the chat window or a macro to instantly assign your team."]
	= "勾选后，你可以通过一个单独的指令来保存你当前宠物对战的队伍配置信息（包括技能）。\n\n一个保存的按钮会添加到宠物面板。点击该按钮会给你当前的队伍显示相关的工作指令。按下<CTRL+C>会复制并缓存你的指令。\n\n你可以通过<CTRL+V>粘贴你的指令到聊天窗口或者宏页面，以实现快速配置队伍。"

		-- Chat messages
		L["All 3 battle pet slots need to be unlocked."]
		= "所有3个宠物栏位需要预先解锁。"

		L["You need a battle pet team."]
		= "你需要一个宠物对战队伍。"

		L["Invalid battle pet team parameter."]
		= "无效的宠物对战队伍参数。"

		-- Editbox tooltip
		L["This command will assign your current pet team and selected abilities.\n\nPress CTRL/C to copy the command then paste it into a macro or chat window with CTRL/V."]
		= "这个命令会指派你的当前宠物对战队伍并保存技能选择信息。\n\n按下<CTRL+C>来复制指令，然后通过<CTRL+V>来粘贴指令到聊天窗口或者宏页面中。"

----------------------------------------------------------------------
-- 	L06: Frames
----------------------------------------------------------------------

	-- Title
	L["Frames"]
	= "框体相关"

	-- Headings
	L["Features"]
	= "功能"

	L["Visibility"]
	= "可见性"

	-- Manage frames
	L["Manage frames"]
	= "管理框体面板"

	L["If checked, you will be able to change the position and scale of the player frame, target frame, world state, ghost frame and timer bar.  Your layout will be saved account-wide."]
	= "勾选后，你可以改动玩家/目标框体、灵魂状态等框体的位置和尺寸。你的布局设置会保存为帐号通用。"

		-- Config panel
		L["Overlay frames"]
		= "面板布局"

		L["Selected frame scale"]
		= "框体尺寸"

		L["Player"]
		= "玩家框体"

		L["Target"]
		= "目标框体"

		L["World State"]
		= "世界信息框体"

		L["Ghost"]
		= "灵魂状态框体"

		L["Timer"]
		= "计时框体"

		L["Player frame"]
		= "玩家框体"

		L["Click to toggle the player frame overlay."]
		= "点击移动玩家框体"

		L["Target frame"]
		= "目标框体"

		L["Click to toggle the target frame overlay."]
		= "点击移动目标框体"

		L["World state frame"]
		= "世界信息框体"

		L["Click to toggle the world state frame overlay.\n\nThe world state frame is most commonly used for keeping score in PvP zones."]
		= "点击移动世界信息框体。\n\n通常该框体用于显示PvP区域的计分系统。"

		L["Ghost frame"]
		= "灵魂状态框体"

		L["Click to toggle the ghost frame overlay.\n\nThe ghost frame appears when your character is a ghost.  It allows you to return to the spirit healer."]
		= "点击移动灵魂状态框体。\n\n该框体仅在你处于灵魂状态时显示。它可以让你回到灵魂天使姐姐旁边。"

		L["Mirror timer bar frame"]
		= "镜像计时框体"

		L["Click to toggle the mirror timer bar overlay.\n\nThe mirror timer bar is used for activities such as underwater breathing.\n\nNote that not all timer bars use this frame."]
		= "点击移动镜像计时框体"

		L["Drag the frame overlays to position the frames.  You can toggle the overlays using the checkboxes on this page.\n\nTo change the scale of a frame, click it to select it then adjust the scale slider.\n\nThis panel will close automatically if you enter combat."]
		= "移动面板来定位框体。你可以在此页面的复选框开关它们。\n\n如果想要改变框体尺寸，你需选定面板，然后移动滑块来选择。\n\n你一旦进入战斗，这个框体会自动关闭。"

		-- Chat messages
		L["Use Leatrix Plus to reset that frame."]
		= "使用Leatrix Plues来重置框体"

		L["Use Leatrix Plus to move that frame."]
		= "使用Leatrix Plues来移动框体"

	-- Manage buff frame
	L["Manage buff frame"]
	= "Buff框体管理"

	L["If checked, you will be able to change the position and scale of the buff frame."]
	= "勾选后，你可以改变Buff框体的位置以及缩放大小。"

		-- Configuration panel
		L["Buff Frame"]
		= "Buff框体"

		L["Scale"]
		= "缩放"

		L["Drag the frame overlay to position the frame."]
		= "拖动框体边框来移动。"

		L["Buffs"]
		= "Buffs"

	-- Class colored frames
	L["Class colored frames"]
	= "框体职业染色"

	L["If checked, you will be able to show class coloring in the player frame, target frame and focus frame backgrounds."]
	= "勾选后，你会在玩家、目标及焦点框体的背景显示职业颜色。"

		-- Config panel
		L["Class Colored Frames"]
		= "框体职业染色"

		L["Show player frame in class color"]
		= "玩家框体"

		L["If checked, the player frame background will be shown in class color."]
		= "勾选后，玩家框体的背景会显示职业颜色。"

		L["Show target frame and focus frame in class color"]
		= "目标及焦点框体"

		L["If checked, the target frame background and focus frame background will be shown in class color."]
		= "勾选后，目标及焦点框体的背景会显示职业颜色。"

	-- Show player chain
	L["Show player chain"]
	= "显示玩家边框"

		-- Config panel
		L["Player Chain"]
		= "玩家边框"

		L["Chain style"]
		= "边框样式"

		L["RARE"]
		= "稀有"

		L["ELITE"]
		= "精英"

		L["RARE ELITE"]
		= "稀有精英"

		L["If checked, you will be able to show a rare, elite or rare elite chain around the player frame."]
		= "勾选后，会在玩家框体显示稀有、精英或者稀有精英的边框。"

		L["Choose a chain style for the player frame from the dropdown menu."]
		= "在选项菜单中为玩家框体选择一个边框样式。"

	-- Raid frame toggle
	L["Raid frame toggle"]
	= "切换团队框体"

	L["If checked, the button to toggle the raid container frame will be shown just above the raid management frame (left side of the screen) instead of in the raid management frame itself.\n\nThis allows you to toggle the raid container frame without needing to open the raid management frame."]
	= "勾选后，打开团队信息的按钮会显示在左侧团队管理框体的上方，而不是在其内部。\n\n此选项让你无需打开团队管理框体，就可以切换团队框体。"

	-- Combat plates
	L["Combat plates"]
	= "自动开关姓名板"

	L["If checked, enemy nameplates will be shown during combat and hidden when combat ends."]
	= "勾选后，敌对姓名板会在战斗中自动开启，离开战斗后关闭。"

	-- Hide alerts
	L["Hide alerts"]
	= "隐藏信息提示"

	L["If checked, you will be able to hide alert frames."]
	= "勾选后，你可以隐藏信息提示框体。"

		-- Config panel
		L["Alerts"]
		= "隐藏通知提示"

		L["Hide achievement alerts"]
		= "隐藏成就通知"

		L["If checked, achievement alerts will not be shown."]
		= "勾选后，获得成就的提示不再显示。"

		L["Hide encounter alerts"]
		= "隐藏地城通知"

		L["If checked, encounter alerts will not be shown.\n\nThis includes dungeons, raids, scenarios, invasions, guild challenges and world quests."]
		= "勾选后，地城的提示不再显示。\n\n包括地下城、团队、场景战役、要塞入侵、公会挑战和世界任务。"

		L["Hide garrison alerts"]
		= "隐藏要塞通知"

		L["If checked, garrison alerts will not be shown.\n\nThis includes buildings, followers, missions and talents."]
		= "勾选后，要塞的提示信息不再显示。\n\n这包括了要塞建筑、追随者、任务及天赋的通知。"

		L["Hide loot alerts"]
		= "隐藏拾取通知"

		L["If checked, loot alerts will not be shown.\n\nThis includes items, money, resources and store purchases."]
		= "勾选后，拾取的提示信息不再显示。\n\n这包括物品、金钱、资源和商城购物的相关提示。"

		L["Hide profession alerts"]
		= "隐藏专业通知"

		L["If checked, profession alerts will not be shown.\n\nThis includes recipes and digsites."]
		= "勾选后，专业技能的相关提示不再显示。\n\n这包括图纸和考古的提示。"

	-- Hide character controls
	L["Hide character controls"]
	= "隐藏角色控制按钮"

	L["If checked, model control buttons (such as zoom) will not be shown in the character frame, inspect frame, dressup frame and transmogrification frame."]
	= "勾选后，处于玩家、目标、试衣间和幻化框体的模型上方的控制按钮不再显示。"

	-- Hide bodyguard gossip
	L["Hide bodyguard gossip"]
	= "隐藏保镖对话"

	L["If checked, the gossip window will not be shown when you talk to an active garrison bodyguard.\n\nYou can hold the shift key down when you talk to a bodyguard to over-ride this setting."]
	= "勾选后，你的保镖对话时不再出现选项。\n\n对话时按住Shift键，可以暂时忽略该项设置。"

	-- Hide talking frame
	L["Hide talking frame"]
	= "隐藏对话框体"

	L["If checked, the talking frame will not be shown.\n\nThe talking frame normally appears in the lower portion of the screen when certain NPCs communicate with you."]
	= "勾选后，对话面板不再显示。\n\n当NPC与你交流时，该框体通常出现在界面下方。"

	-- Hide clean-up buttons
	L["Hide clean-up buttons"]
	= "隐藏背包整理按钮"

	L["If checked, the backpack clean-up button and the bank frame clean-up button will not be shown."]
	= "勾选后，背包及银行的整理按钮不再显示。"

	-- Hide boss banner
	L["Hide boss banner"]
	= "隐藏BOSS横幅"

	L["If checked, the boss banner will not be shown.\n\nThe boss banner appears when a boss is defeated.  It shows the name of the boss and the loot that was distributed."]
	= "勾选后，BOSS的横幅信息不再显示。\n\n该信息通常在BOSS被击败后显示。它显示BOSS的名字以及掉落。"

	-- Hide level-up display
	L["Hide level-up display"]
	= "隐藏升级提示"

	L["If checked, the level-up display will not be shown.\n\nThe level-up display shows encounter objectives, level-ups, pet battle rewards, etc."]
	= "勾选后，升级提示不再显示。\n\n升级提示功能包括副本目标、升级、小宠物奖励等等。"

	-- Hide gryphons
	L["Hide gryphons"]
	= "隐藏动作条狮鹫"

	L["If checked, the main bar gryphons will not be shown."]
	= "勾选后，动作条两边的狮鹫不再显示。"

	-- Hide stance bar
	L["Hide stance bar"]
	= "隐藏姿态条"

	L["If checked, the stance bar will not be shown."]
	= "勾选后，姿态条不再显示。"

	-- Hide command bar
	L["Hide command bar"]
	= "隐藏命令条"

	L["If checked, the order hall command bar will not be shown."]
	= "勾选后，职业大厅的命令条不再显示。"

----------------------------------------------------------------------
-- 	l07: System
----------------------------------------------------------------------

	-- Title
	L["System"]
	= "系统设置"

	-- Headings
	L["Graphics and Sound"]
	= "界面和音效"

	L["Game Options"]
	= "游戏设置"

	-- Disable screen glow
	L["Disable screen glow"]
	= "禁用画面晕眩"

	L["If checked, the screen glow effect will be disabled.\n\nEnabling this option may increase your overall graphics performance and reduce nausea."]
	= "勾选后，画面的景深会被禁用。\n\n启用这个选项可能会提高你的画面表现，减少晕眩效果。"

	-- Max camera zoom
	L["Max camera zoom"]
	= "最大镜头距离"

	L["If checked, you will be able to zoom out to a greater distance.\n\nEnabling this option will prevent you from changing the camera distance setting in the game options panel ('Camera' menu)."]
	= "勾选后，你可以加大镜头的缩放距离。\n\n启用这个选项后，你将不能再修改界面-镜头中的相关设置。"

	-- Enable viewport
	L["Enable viewport"]
	= "画面视口"

	L["If checked, you will be able to create a viewport.  A viewport adds adjustable black borders around the game world.\n\nThe borders are placed on top of the game world but under the UI so you can place UI elements over them."]
	= "勾选后，你会生成一个画面视口，这个可以在游戏界面周围增加黑色的边框背景。\n\n边框的层级是处于游戏界面和插件之间，所以你仍可以放置插件元素在上面。"

		-- Config panel
		L["Viewport"]
		= "视口"

		L["Top"]
		= "顶部"

		L["Bottom"]
		= "底部"

		L["Left"]
		= "左边"

		L["Right"]
		= "右边"

		L["Transparency"]
		= "透明度"

		L["Resize the game world"]
		= "修改界面大小"

		L["If checked, the game world will be resized to fit between the top and bottom borders.\n\nNote that if you enable this setting, the transparency slider will no longer affect the top and bottom borders."]
		= "勾选后，游戏界面的大小会修改适应顶部和底部的边框。\n\n当你启用这个选项时，透明度的调节不再影响这两个边框。"

		L["Configure the viewport using the controls on this page.\n\nThis panel will close automatically if you enter combat."]
		= "你可以在本页设置视口。\n\n当你进入战斗时，这个面板会自动关闭。"

	-- Silence rested emotes
	L["Silence rested emotes"]
	= "表情禁音"

	L["If checked, emote sounds will be silenced while your character is:\n\n- resting\n- in a pet battle\n- at the Hathill Market\n- at the Grim Guzzler\n\nEmote sounds will be enabled when none of the above apply."]
	= "选后，当你处于下列情况时表情音效会被禁音：\n\n休息时\n\n处于宠物对战中\n\n在半山集市\n\n在黑铁酒吧\n\n当你不处于上述位置时表情音效恢复。"

	-- Disable bag automation
	L["Disable bag automation"]
	= "禁用自动背包"

	L["If checked, your bags will not be opened or closed automatically when you interact with a merchant, bank or mailbox."]
	= "勾选后，当你打开商贩、银行或者邮箱时，背包不会自动开启或者关闭。"

	-- Disable pet automation
	L["Disable pet automation"]
	= "禁用自动换宠"

	L["If checked, battle pets which are automatically summoned will be dismissed within a few seconds.\n\nThis includes dragging a pet onto the first team slot in the pet journal and entering a battle pet team save command.\n\nNote that pets which are automatically summoned during combat will be dismissed when combat ends."]
	= "勾选后，被自动召唤的战斗宠物会在若干秒后被自动召回。\n\n这包括将宠物拖动到对战队伍栏位和进入宠物对战的指令。\n\n需要注意的是，战斗中自动召唤的宠物会在战斗结束后再解散。"

	-- Show character addons
	L["Show character addons"]
	= "显示角色插件"

	L["If checked, the addon list (accessible from the game menu) will show character based addons by default."]
	= "勾选后，插件列表（游戏菜单处）会显示默认的对角色生效的插件。"

	-- Remove raid restrictions
	L["Remove raid restrictions"]
	= "移除团队等级限制"

	L["If checked, your low level characters will be allowed to join raid groups.\n\nNote that you cannot join a raid group directly with a low level character.  You have to join a party group first then the party leader should convert the party group to a raid group.\n\nReload your UI if the group leader is unable to convert the party group to a raid group."]
	= "勾选后，你的低等级角色会被允许加入到团队中。\n\n你的低等级角色无法直接加入团队。你必须先加入到队伍中再切换成团队才可以。\n\n当队伍的队长无法把队伍转换成团队，请重载你的插件"

	-- Disable loot warnings
	L["Disable loot warnings"]
	= "禁用拾取通报"

	L["If checked, confirmations will no longer appear when you choose a loot roll option or attempt to sell or mail a tradable item."]
	= "勾选后，当你选择Roll点或者想要出售/邮寄一个可交易物品时，不再显示确认信息。"

	-- Disable map emote
	L["Disable map emote"]
	= "禁用地图查看动作"

	L["If checked, your character will not perform the reading emote when you open the map."]
	= "勾选后，当你在查看地图时，你的角色不再有一个阅读的动作。"

	-- Skip cinematics
	L["Skip cinematics"]
	= "跳过过场动画"

	L["If checked, in-game cinematics will be skipped if at all possible.\n\nYou can hold the shift key down when a cinematic is about to start to over-ride this setting.\n\nNote that some cinematics cannot be skipped."]
	= "勾选后，游戏内可以跳过的过程动画会自动跳过。\n\n当一个过场动画开始前，你可以按住Shift键来忽略该项设置。\n\n注意，部分过场动画无法跳过。"

	L["A cinematic skip was attempted."]
	= "一个过场动画成功跳过。"

	L["A movie skip was attempted."]
	= "一个电影片段成功跳过。"

	-- Faster auto loot
	L["Faster auto loot"]
	= "加速自动拾取"

	L["If checked, the amount of time it takes to auto loot creatures will be significantly reduced."]
	= "勾选后，自动拾取所耗的时间将大幅缩短。"

	-- Lockout sharing
	L["Lockout sharing"]
	= "成就共享锁定"

	L["If checked, the 'Display only character achievements to others' setting in the game options panel ('Social' menu) will be permanently checked and locked."]
	= "勾选后，“对他人只显示角色成就”的选项（界面-社交）会被永久勾选并锁定。"

----------------------------------------------------------------------
-- 	L08: Settings
----------------------------------------------------------------------

	-- Title
	L["Settings"]
	= "设置"

	-- Headings
	L["Addon"]
	= "插件"

	L["Scale"]
	= "尺寸"

	L["Transparency"]
	= "透明度"

	L["Memory Usage"]
	= "内存占用"

	-- Show minimap button
	L["Show minimap button"]
	= "显示小地图按钮"

	L["If checked, a minimap button will be available.\n\nLeft-click - Toggle options.\n\nSHIFT/Left-click - Toggle music.\n\nSHIFT/Right-click - Toggle coordinates (if enabled).\n\nCTRL/Left-click - Toggle minimap target tracking.\n\nCTRL/Right-click - Toggle errors (if enabled).\n\nCTRL/SHIFT/Left-click - Toggle Zygor (if installed).\n\nCTRL/SHIFT/Right-click - Toggle windowed mode."]
	= "勾选后，小地图设置按钮可用。\n\n左键：开关设置面板。\n\nShift+左键：开关音乐。\n\nShift+右键：开关坐标显示（需启用设置）。\n\nCtrl+左键：开关小地图目标追踪。\n\nCTRL+右键：开关错误信息（启用后，红色为显示）。\n\nCtrl+Shift+左键：开关Zygor插件（需安装插件）。\n\nCtrl+Shift+右键：开关窗口模式。"

		-- Minimap button clicks
		L["Target Tracking Enabled"]
		= "启用目标追踪"

		L["Target Tracking Disabled"]
		= "禁用目标追踪"

		L["Coordinates Enabled"]
		= "启用坐标显示"

		L["Coordinates Disabled"]
		= "禁用坐标显示"

		L["Error frame text will be shown"]
		= "显示错误信息"

		L["Error frame text will be hidden"]
		= "隐藏错误信息"

		L["Zygor addon not found."]
		= "你尚未安装Zygor插件。"

	-- Show startup message
	L["Show startup message"]
	= "显示启动信息"

	L["If checked, the addon name and version will be shown in chat when you login or reload your UI."]
	= "勾选后，插件的名字和版本会在你登录游戏时显示在聊天窗口。"

	-- Show option tooltips
	L["Show option tooltips"]
	= "显示设置提示信息"

	L["If checked, tooltips will be shown for all of the checkboxes and buttons in the options panel.\n\nIf unchecked, no tooltips will be shown and the configuration panel help buttons will be unavailable.\n\nIt's recommended that you leave this option checked."]
	= "勾选后，设置面板中的所有复选框和按钮都会显示鼠标提示信息。\n\n如果未勾选，鼠标提示信息会被禁用，同时设置面板的帮助按钮不再可用。\n\n建议你勾选这个复选框。"

	-- Enable hotkey
	L["Enable hotkey"]
	= "启用热键"

	L["If checked, you will be able to open Leatrix Plus by pressing a designated hotkey."]
	= "勾选后，你可以绑定一个快捷键来打开Leatrix Plus。"

		-- Configuration panel
		L["Hotkey"]
		= "热键"

		L["Select the hotkey that you want to use.\n\nThis panel will close automatically if you enter combat."]
		= "选择一个你想设置的按键。\n\n这个面板会在你进入战斗时自动关闭。"

----------------------------------------------------------------------
-- 	L09: Miscellaneous
----------------------------------------------------------------------

	-- Configuration button tooltips
	L["Click to configure the settings for this option."]
	= "点击进行额外的选项设置"

	-- Subheading
	L["Configuration Panel"]
	= "设置面板"

	-- Help button
	L["Help"]
	= "帮助"

	L["Select the settings that you want to use."]
	= "选择你想启用的设置。"

	L["No help is available for this page."]
	= "此页面没有帮助信息。"

	-- Reset button
	L["Reset"]
	= "重置"

	L["Click to reset the settings on this page."]
	= "点击重置此页面的设置。"

	-- Main menu button
	L["Back to Main Menu"]
	= "返回"

	L["Click to return to the main menu."]
	= "点击返回到主菜单"

	-- Reload button
	L["Reload"]
	= "重载插件"

	L["Your UI needs to be reloaded for some of the changes to take effect.\n\nYou don't have to click the reload button immediately but you do need to click it when you are done making changes and you want the changes to take effect."]
	= "你需要进行重载插件后才能使部分设置生效。\n\n你无需立即点击重载插件按钮，但是你完成设置并希望其生效时，必须点击它。"

	L["Your UI needs to be reloaded."]
	= "你的插件需要重新载入。"

	-- You cannot do that in combat
	L["You cannot do that in combat."]
	= "你无法在战斗中进行该项操作。"

	-- Requires UI reload
	L["Requires UI reload."]
	= "需要重载插件"

	-- Settings (used in various places)
	L["Settings"]
	= "设置"

	-- Managed by Leatrix Plus
	L["Managed by Leatrix Plus"]
	= "LeatrixPlus托管"

----------------------------------------------------------------------
-- 	L10: Commands
----------------------------------------------------------------------

	-- Show rested bubbles
	L["Rested bubbles"]
	= "休息气泡信息"

	-- Dark soil alert
	L["Dark Soil scanning activated.  Reload UI to exit."]
	= "黑色泥土扫描启用，取消需重载插件。"

	L["Dark Soil scanning is already activated.  You only need to run this once.  Reload UI to exit."]
	= "黑色泥土扫描已经启用，你只需要进行一次操作。取消需重载插件。"

	-- Test achievement alert
	L["Achievement UI is not loaded yet.  Open Achievements frame then try again."]
	= "成就插件尚未载入，请打开成就面板后重试。"

	-- Show config
	L["Camera distance"]
	= "镜头距离"

	L["Shaders"]
	= "阴影"

	L["Particle density"]
	= "粒子密度"

	L["Weather density"]
	= "天气密度"

	L["Account achievements are hidden."]
	= "账号成就已隐藏。"

	L["Account achievements are being shared."]
	= "帐号成就已经共享。"

	-- Show default tooltip title color
	L["Tooltip title color"]
	= "鼠标提示信息颜色"

	L["No tooltip showing."]
	= "目前没有任何提示信息。"

	-- Show lifetime honorable kills
	L["Lifetime honorable kills"]
	= "荣誉击杀总数"

	-- List truncated checkbox labels
	L["Checkbox labels are Ok."]
	= "复选框信息检查通过"

	-- Invalid parameter
	L["Invalid parameter."]
	= "无效参数"
