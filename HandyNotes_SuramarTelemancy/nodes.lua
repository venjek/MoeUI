local myname, ns = ...

ns.points = {
    --[[ structure:
    [mapFile] = { -- "_terrain1" etc will be stripped from attempts to fetch this
        [coord] = {
            label=[string], -- label: text that'll be the label, optional
            item=[id], -- itemid
            quest=[id], -- will be checked, for whether character already has it
            achievement=[id], -- will be shown in the tooltip
            junk=[bool], -- doesn't count for achievement
            npc=[id], -- related npc id, used to display names in tooltip
            note=[string], -- some text which might be helpful
        },
    },
    --]]
    ["Suramar"] = {
		--传送门坐标
        [30801090] = { quest=43808, label="护月壁垒", },
        [21502990] = { quest=42230, label="法兰纳尔", note="主线任务指引开启", },
        [42203540] = { quest=43809, label="泰尔安诺", },
        [36204710] = { quest=40956, label="艾露尼丝废墟", },
        [43406070] = { quest=43813, label="秩序大殿", note="副本入口", },
        [43607910] = { quest=43811, label="月郡地产", },
        [39107630] = { quest=41575, label="邪魂壁垒", },
        [47508200] = { quest=42487, label="残月酒馆", note="主线任务指引开启", },
        [64006040] = { quest=44084, label="暮光酒庄", note="主线任务指引开启", },
		-- entrances
        [22903580] = { quest=42230, entrance=true, label="法兰纳尔 (入口)" },
        [35808210] = { quest=41575, entrance=true, label="邪魂壁垒 (入口)" },
        [27802230] = { quest=43808, entrance=true, label="护月壁垒 (入口)", note="当然你可以不走任务路线，直接穿过怪群过去开传送门" },
        [42606170] = { quest=43813, entrance=true, label="秩序大殿 (入口)" },
		--魔网坐标
	    [41703890] = { quest=41028, label="安诺拉山谷(魔网)", note="主线任务指引开启", IsGrid = true},
        [65804190] = { quest=43587, label="艾洛珊(魔网)", note="250远古魔力", IsGrid = true},
        [59304280] = { quest=43588, label="凯尔巴洛(魔网)", note="200远古魔力，需要击退3波枯法者进攻", IsGrid = true },
        [35702410] = { quest=43590, label="月语峡谷(魔网)", note="200远古魔力，需要先和魔网对话接任务消灭胖子收集6个任务物品", IsGrid = true},
        [24301940] = { quest=43591, label="月之守卫(魔网)", note="200远古魔力，需要消灭一个双头巨魔，额外奖励神器能量", IsGrid = true},
        [21404330] = { quest=43592, label="法兰纳尔北部(魔网)", note="250远古魔力，有两个内部地图，不在传送门所在的内部地图里", IsGrid = true},
        [20405040] = { quest=43593, label="法兰纳尔南部(魔网)", note="250远古魔力", IsGrid = true },
        [29008480] = { quest=43594, label="灵魂地窟(魔网)", note="250远古魔力", IsGrid = true },
    },
}
