﻿------------------------------------------------------------
if GetLocale() == "zhCN" then
	-- 简体中文
	WHISPERPOP_LOCALE = {
		["title"] = "|cffC495DD[聊天]|r密语管理",
		["tip tooltip"] = "拖拽左键以移动此提示图标，点击左键打开密语管理主框体。",
		["no new messages"] = "没有未阅读消息",
		["new messages from"] = "未阅读消息来自: ",
		["receive only"] = "仅显示接收到的消息",
		["sound notifying"] = "声音提示",
		["time"] = "显示时间标签",
		["receive only tooltip"] = "如果选中，外发的消息将不会显示在列表中。",
		["sound notifying tooltip"] = "如果选中，每次接收到新消息时将发出声音提示。",
		["time tooltip"] = "如果选中，时间标签将被添加到每一行消息文字前面。",
		["delete messages"] = "删除所有消息",
		["delete messages tooltip"] = "点击删除所有现有的消息。",
		["keep messages"] = "保留历史记录",
		["keep messages tooltip"] = "保留一天以内的消息，而且同帐号的各个角色均可查看。\n \n|cffff3333严重警告：因密语记录可以打开魔兽存档随意查看，因此请不要在网吧等公共环境开启此选项，以免信息泄漏。|r",
		["toggle frame"] = "    打开/关闭密语框体",
	}
	WHISPERINVITE_LOCALE = {
		["Locale"] = "本地",
		["WhisperInvite"] = "自动组队",
		["All character match"] = "全字匹配",
		["CHAT_MSG_BN_CONVERSATION"] = "Battle.net 聊天频道",
		["CHAT_MSG_BN_INLINE_TOAST_BROADCAST"] = "Battle.net 状态",
		["CHAT_MSG_BN_WHISPER"] = "Battle.net 密语",
		["CHAT_MSG_CHANNEL"] = "所有频道",
		["CHAT_MSG_GUILD"] = "公会频道",
		["CHAT_MSG_OFFICER"] = "官员频道",
		["CHAT_MSG_WHISPER"] = "密语",
		["%s aus Spieler Blacklist entfernt."] = "清除 %s from 黑名单",
		["%s zu Spieler Blacklist hinzugefügt."] = "加入 %s to 黑名单",
		["Chat Commands:\nremove Spielername - Von Blacklist entfernt\nadd Spielername - Zu Blacklist hinzugefügen"] = "频道指令:\nremove playername - 清除黑名单 blacklist\nadd playername - 加入黑名单",
		["Case sensitive"] = "区分大小写",
		["Keywords"] = "关键字",
		["Chat Channels"] = "聊天频道",
		["Blacklists"] = "黑名单",
		["Spieler Blacklist"] = "黑名单",
	}			
elseif GetLocale() == "zhTW" then
	-- 繁體中文
	WHISPERPOP_LOCALE = {
		["title"] = "|cffC495DD[聊天|r密語管理",
		["tip tooltip"] = "拖拽左鍵以移動此提示圖標，點擊左鍵打開密語管理主框體。",
		["no new messages"] = "沒有未閱讀消息",
		["new messages from"] = "未閱讀消息來自: ",
		["receive only"] = "僅顯示接收到的消息",
		["sound notifying"] = "聲音提示",
		["time"] = "顯示時間標簽",
		["receive only tooltip"] = "如果選中，外發的消息將不會顯示在列表中。",
		["sound notifying tooltip"] = "如果選中，每次接收到新消息時將發出聲音提示。",
		["time tooltip"] = "如果选中，時間標簽將被添加到每一行消息文字前面。",
		["delete messages"] = "刪除所有消息",
		["delete messages tooltip"] = "點擊刪除所有現有的消息。",
		["keep messages"] = "保留歷史記錄",
		["keep messages tooltip"] = "保留一天內消息 \n|cffff3333嚴重警告：因密語記錄可打開魔獸存檔隨意查看，因此請不要在網吧等公共環境開啟此項，以免信息洩露。|r",
		["toggle frame"] = "    打開/關閉密語框體",
	}
	WHISPERINVITE_LOCALE = {
		["Locale"] = "本地化",
		["WhisperInvite"] = "自動組隊",
		["All character match"] = "完全匹配",
		["CHAT_MSG_BN_CONVERSATION"] = "Battle.net 聊天頻道",
		["CHAT_MSG_BN_INLINE_TOAST_BROADCAST"] = "Battle.net 狀態",
		["CHAT_MSG_BN_WHISPER"] = "Battle.net 密語頻道",
		["CHAT_MSG_CHANNEL"] = "所有頻道",
		["CHAT_MSG_GUILD"] = "公會頻道",
		["CHAT_MSG_OFFICER"] = "官員頻道",
		["CHAT_MSG_WHISPER"] = "密語頻道",
		["%s aus Spieler Blacklist entfernt."] = "清除 %s 黑名單",
		["%s zu Spieler Blacklist hinzugefügt."] = "加入 %s 黑名單",
		["Chat Commands:\nremove Spielername - Von Blacklist entfernt\nadd Spielername - Zu Blacklist hinzugefügen"] = "頻道指令:\nremove playername - 清除黑名單\nadd playername - 加入黑名單",
		["Case sensitive"] = "注意大寫",
		["Keywords"] = "關鍵字",
		["Chat Channels"] = "聊天頻道",
		["Blacklists"] = "黑名單",
		["Spieler Blacklist"] = "黑名单",
	}
else
WHISPERPOP_LOCALE = {
	["title"] = "WhisperPop",
	["tip tooltip"] = "Left-drag to move this tip icon, left-click to open WhisperPop main frame.",
	["no new messages"] = "No unread messages",
	["new messages from"] = "Unread messages from: ",
	["receive only"] = "Show received messages only",
	["sound notifying"] = "Sound notifying",
	["time"] = "Show time stamp",
	["receive only tooltip"] = "If checked, sent messages will not be displayed in the list.",
	["sound notifying tooltip"] = "If checked, you will be notifyed with a sound alert every time a new message comes in.",
	["time tooltip"] = "If checked, a time stamp will be displayed in front of every message text.",
	["delete messages"] = "Delete all messages",
	["delete messages tooltip"] = "Click to delete all existing messages.",
	["keep messages"] = "Keep all messages",
	["keep messages tooltip"] = "Keep all existing messages.",
	["toggle frame"] = "Toggle WhisperPop frame",
}
WHISPERINVITE_LOCALE = {
	["Locale"] = "Locale",
	["WhisperInvite"] = "WhisperInvite",
	["All character match"] = "All character match",
	["CHAT_MSG_BN_CONVERSATION"] = "CHAT_MSG_BN_CONVERSATION",
	["CHAT_MSG_BN_INLINE_TOAST_BROADCAST"] = "CHAT_MSG_BN_INLINE_TOAST_BROADCAST",
	["CHAT_MSG_BN_WHISPER"] = "CHAT_MSG_BN_WHISPER",
	["CHAT_MSG_CHANNEL"] = "CHAT_MSG_CHANNEL",
	["CHAT_MSG_GUILD"] = "CHAT_MSG_GUILD",
	["CHAT_MSG_OFFICER"] = "CHAT_MSG_OFFICER",
	["CHAT_MSG_WHISPER"] = "CHAT_MSG_WHISPER",
	["%s aus Spieler Blacklist entfernt."] = "%s aus Spieler Blacklist entfernt.",
	["%s zu Spieler Blacklist hinzugefügt."] = "%s zu Spieler Blacklist hinzugefügt.",
	["Chat Commands:\nremove Spielername - Von Blacklist entfernt\nadd Spielername - Zu Blacklist hinzugefügen"] = "Chat Commands:\nremove Spielername - Von Blacklist entfernt\nadd Spielername - Zu Blacklist hinzugefügen",
	["Case sensitive"] = "Case sensitive",
	["Keywords"] = "Keywords",
	["Chat Channels"] = "Chat Channels",
	["Blacklists"] = "Blacklists",
	["Spieler Blacklist"] = "黑名单",
}
end