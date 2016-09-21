local L = LibStub("AceLocale-3.0"):NewLocale("WorldQuestTrackerAddon", "zhCN") 
if not L then return end 

L["S_APOWER_AVAILABLE"] = "可用的"
L["S_APOWER_NEXTLEVEL"] = "下一等级"
-- L["S_ENABLED"] = ""
L["S_ERROR_NOTIMELEFT"] = "这个任务已经到期"
L["S_ERROR_NOTLOADEDYET"] = "这个任务还没有被加载，请稍候。"
L["S_FLYMAP_SHOWTRACKEDONLY"] = "仅被追踪"
L["S_FLYMAP_SHOWTRACKEDONLY_DESC"] = "仅显示正在被追踪的任务"
L["S_FLYMAP_SHOWWORLDQUESTS"] = "显示世界任务"
L["S_MAPBAR_AUTOWORLDMAP"] = "自动世界地图"
L["S_MAPBAR_AUTOWORLDMAP_DESC"] = [=[在达拉然或职业大厅中时，按“M”键直接显示破碎群岛地图

连续两次按“M”键显示显示你所在的达拉然（或职业大厅）地图]=]
L["S_MAPBAR_FILTER"] = "过滤选项"
L["S_MAPBAR_FILTERMENU_FACTIONOBJECTIVES"] = "阵营目标"
L["S_MAPBAR_FILTERMENU_FACTIONOBJECTIVES_DESC"] = "始终显示阵营任务（即使他们被过滤）"
L["S_MAPBAR_OPTIONS"] = "选项"
-- L["S_MAPBAR_OPTIONSMENU_ARROWSPEED"] = ""
-- L["S_MAPBAR_OPTIONSMENU_ARROWSPEED_HIGH"] = ""
-- L["S_MAPBAR_OPTIONSMENU_ARROWSPEED_MEDIUM"] = ""
-- L["S_MAPBAR_OPTIONSMENU_ARROWSPEED_REALTIME"] = ""
-- L["S_MAPBAR_OPTIONSMENU_ARROWSPEED_SLOW"] = ""
-- L["S_MAPBAR_OPTIONSMENU_QUESTTRACKER"] = ""
-- L["S_MAPBAR_OPTIONSMENU_REFRESH"] = ""
L["S_MAPBAR_OPTIONSMENU_SHARE"] = "分享这个插件"
L["S_MAPBAR_OPTIONSMENU_SOUNDENABLED"] = "启用声音"
-- L["S_MAPBAR_OPTIONSMENU_TOMTOM_WPPERSISTENT"] = ""
-- L["S_MAPBAR_OPTIONSMENU_TRACKERMOVABLE_AUTO"] = ""
-- L["S_MAPBAR_OPTIONSMENU_TRACKERMOVABLE_CUSTOM"] = ""
-- L["S_MAPBAR_OPTIONSMENU_TRACKERMOVABLE_LOCKED"] = ""
-- L["S_MAPBAR_OPTIONSMENU_TRACKERMOVABLE_TITLE"] = ""
L["S_MAPBAR_OPTIONSMENU_UNTRACKQUESTS"] = "停止追踪所有任务"
L["S_MAPBAR_OPTIONSMENU_YARDSDISTANCE"] = "显示距离（单位：码）"
L["S_MAPBAR_RESOURCES_TOOLTIP_TRACKALL"] = "点击追踪所有 |cFFFFFFFF%s|r 任务"
L["S_MAPBAR_SORTORDER"] = "分类排序"
-- L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY"] = ""
-- L["S_MAPBAR_SORTORDER_TIMELEFTPRIORITY_OPTION"] = ""
L["S_MAPBAR_SUMMARY"] = "汇总"
L["S_MAPBAR_SUMMARYMENU_ACCOUNTWIDE"] = "本账号奖励汇总"
L["S_MAPBAR_SUMMARYMENU_MOREINFO"] = "点击显示更多信息"
L["S_MAPBAR_SUMMARYMENU_NOATTENTION"] = [=[你其他角色正在追踪任务的
剩余时限没有小于两小时的。]=]
L["S_MAPBAR_SUMMARYMENU_REQUIREATTENTION"] = "请注意"
L["S_MAPBAR_SUMMARYMENU_TODAYREWARDS"] = "本角色今日奖励汇总"
L["S_OVERALL"] = "全部"
-- L["S_PARTY"] = ""
-- L["S_PARTY_DESC1"] = ""
-- L["S_PARTY_DESC2"] = ""
-- L["S_PARTY_PLAYERSWITH"] = ""
-- L["S_PARTY_PLAYERSWITHOUT"] = ""
L["S_QUESTSCOMPLETED"] = "已经完成的任务"
L["S_QUESTTYPE_ARTIFACTPOWER"] = "神器能量"
L["S_QUESTTYPE_DUNGEON"] = "地下城"
L["S_QUESTTYPE_EQUIPMENT"] = "装备"
L["S_QUESTTYPE_GOLD"] = "金币"
L["S_QUESTTYPE_PETBATTLE"] = "宠物对战"
L["S_QUESTTYPE_PROFESSION"] = "专业"
L["S_QUESTTYPE_PVP"] = "PvP"
L["S_QUESTTYPE_RESOURCE"] = "职业大厅资源"
L["S_QUESTTYPE_TRADESKILL"] = "商业技能"
-- L["S_SHAREPANEL_THANKS"] = ""
-- L["S_SHAREPANEL_TITLE"] = ""
L["S_SUMMARYPANEL_EXPIRED"] = "已过期"
L["S_SUMMARYPANEL_LAST15DAYS"] = "最近的15天内"
L["S_SUMMARYPANEL_LIFETIMESTATISTICS_ACCOUNT"] = "账号在线时间统计"
L["S_SUMMARYPANEL_LIFETIMESTATISTICS_CHARACTER"] = "角色在线时间统计"
L["S_SUMMARYPANEL_OTHERCHARACTERS"] = "其他角色"
L["S_TUTORIAL_AMOUNT"] = "显示接收量"
L["S_TUTORIAL_CLICKTOTRACK"] = "点击追踪任务"
L["S_TUTORIAL_CLOSE"] = "关闭教程"
L["S_TUTORIAL_FACTIONBOUNTY"] = "显示被选中阵营任务的数量"
L["S_TUTORIAL_FACTIONBOUNTY_AMOUNTQUESTS"] = "显示在地图上有多少任务属于被选中的阵营"
L["S_TUTORIAL_HOWTOADDTRACKER"] = "单击鼠标左键以追踪任务。在追踪任务时，你可以|cFFFFFFFF点击右键|r 来取消追踪。"
-- L["S_TUTORIAL_PARTY"] = ""
L["S_TUTORIAL_RARITY"] = "显示品质（普通，稀有，史诗）"
L["S_TUTORIAL_REWARD"] = "显示奖励（装备，金币，神器能量，职业大厅资源，材料）"
L["S_TUTORIAL_TIMELEFT"] = "显示剩余时间（大于4小时，大于90分钟，大于30分钟，小于30分钟）"
L["S_TUTORIAL_WORLDMAPBUTTON"] = "点击这个按钮将向你显示破碎群岛地图"
L["S_UNKNOWNQUEST"] = "未知任务"
L["S_WORLDQUESTS"] = "世界任务"

