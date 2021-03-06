﻿local _, ns = ...

local foo = {""}
local spellcache = setmetatable({}, 
{__index=function(t,id) 
	local a = {GetSpellInfo(id)} 

	if GetSpellInfo(id) then
	    t[id] = a
	    return a
	end

   t[id] = foo
	return foo
end
})
local function GetSpellInfo(a)
    return unpack(spellcache[a])
end
--优先级别设置最小为1,数字越大优先级越高.
--first = 主要图标里显示 
--second = 次要图标里显示
--如果first与second列表里有重复spellid,将只会在主要图标显示.

--ascending  添加需要正数显示而并非传统的倒数显示aura剩余时间.比如龙母的毁坏debuff.同时你还要在debuffs或者instances里添加相应的spellid.只适用于debuff.true= 启用,false=禁用

--debuffs 要监视的debuff,任何地图.

--buffs 要监视的buff,任何地图.

--instances 副本地图里的debuff,可以使用地图的MapID(使用GetCurrentMapAreaID()获得)或者使用地图名称分类.

ns.auras_ascending = {
	[GetSpellInfo(89435)] =  true,
	[GetSpellInfo(89421)] =  true,
}

ns.auras_buffs = {
	first = {
	},
	second = {	
		----------------------恶魔猎手---------------
		[GetSpellInfo(187827)] = 3,	--恶魔变形
		[GetSpellInfo(218256)] = 1,	--强化结界
		[GetSpellInfo(227225)] = 2,	--灵魂壁垒
		--------------------------战士---------------
		[GetSpellInfo(871)] = 2,	--盾墙
		[GetSpellInfo(12975)] = 2,	--破釜沉舟
		[GetSpellInfo(97463)] = 2,	--命令怒吼
		[GetSpellInfo(125565)] = 2,	--挫志怒吼
		[GetSpellInfo(132404)] = 1,	--盾牌格挡
		--------------------------骑士---------------		
		[GetSpellInfo(498)] = 2,	--圣佑术
		[GetSpellInfo(642)] = 2,	--圣盾术
		[GetSpellInfo(1022)] = 2,	--保护之手
		[GetSpellInfo(6940)] = 2,	--牺牲之手
		[GetSpellInfo(86659)] = 2,	--远古列王守卫
		[GetSpellInfo(31821)] = 2,	--虔诚光环
		[GetSpellInfo(31850)] = 2,	--炽热防御者	
		[GetSpellInfo(114039)] = 2,	--纯净之手
		[GetSpellInfo(152262)] = 2,	--炽天使
		--------------------------DK---------------
		[GetSpellInfo(48707)] = 2,	--反魔法护罩
		[GetSpellInfo(145629)] = 2,	--反魔法领域
		[GetSpellInfo(49222)] = 1,	--白骨之盾
		[GetSpellInfo(48792)] = 2,	--冰封之韧
		[GetSpellInfo(171049)] = 2,	--符文分流
		[GetSpellInfo(55233)] = 2,	--吸血鬼之血
		[GetSpellInfo(81256)] = 2,	--符文刃舞
		------------------------德鲁伊---------------
		[GetSpellInfo(22812)] = 1,	--树皮术
		[GetSpellInfo(61336)] = 2,	--生存本能
		[GetSpellInfo(132402)] = 1,	--野蛮防御
		[GetSpellInfo(102342)] = 2,	--铁木树皮
		[GetSpellInfo(192083)] = 1,	--乌索尔的印记
		[GetSpellInfo(200851)] = 1,	--沉睡者之怒
		------------------------牧师--------------------
		[GetSpellInfo(33206)] = 2, 	--痛苦压制
		[GetSpellInfo(47788)] = 2, 	--守护之魂
		[GetSpellInfo(62618)] = 2, 	--真言术:障
		------------------------武僧--------------------
		[GetSpellInfo(116849)] = 2, 	--作茧缚命
		[GetSpellInfo(115176)] = 2, 	--禅悟冥想
		[GetSpellInfo(122278)] = 1,	--躯不坏
		[GetSpellInfo(122783)] = 2, 	--散魔功
		[GetSpellInfo(115308)] = 1, 	--飘渺酒
		[GetSpellInfo(115295)] = 2, 	--金钟罩
		[GetSpellInfo(115203)] = 2, 	--壮胆酒
		------------------------法师--------------------
		[GetSpellInfo(159916)] = 1, 	--魔法增效
		------------------------raid-------------------
		[GetSpellInfo(106213)] = 71, 	--奈萨里奥的血液 DS7#
		[GetSpellInfo(115856)] = 71,    --废灵壁垒 MV2#     
	},	
}

ns.auras_debuffs = {
	first = {
		[GetSpellInfo(39171)] =  9, -- Mortal Strike
		[GetSpellInfo(76622)] =  9, -- Sunder Armor
		[GetSpellInfo(145263)] =  9, --
		[GetSpellInfo(61385)] =  9, --定身 

		--Sha of Anger 怒之煞
		[GetSpellInfo(119626)] = 11, --Aggressive Behavior
		[GetSpellInfo(119488)] = 12, --Unleashed Wrath
		[GetSpellInfo(119610)] = 13, --Bitter Thoughts
		[GetSpellInfo(119601)] = 14, --Bitter Thoughts

		--Nalak, The Storm Lord 暴风领主纳拉克
		[GetSpellInfo(136339)] = 12,
		[GetSpellInfo(136340)] = 13,

		--Oondasta 乌达斯塔
		[GetSpellInfo(137504)] = 12, --Crush
		
		--Ordos, Fire-God of the Yaungol 野牛人火神斡耳朵斯
		[GetSpellInfo(144689)] = 12, --Burning Soul
		
		--Chi-Ji, The Red Crane 朱鹤赤精
		
		--Yu'lon, The Jade Serpent 青龙玉珑
		[GetSpellInfo(144630)] = 12, --Jadeflame Buffet
		
		--Niuzao, The Black Ox 玄牛砮皂
		[GetSpellInfo(144607)] = 12, --Oxen Fortitude
		
		--Xuen, The White Tiger 白虎雪怒
		[GetSpellInfo(144638)] = 12, --Spectral Swipe

		--Drov the Ruiner 毁灭者多弗

		--Tarlna the Ageless 永恒的塔尔纳
		[GetSpellInfo(175973)] = 12, 
		[GetSpellInfo(176001)] = 13, 

		--Rukhmar 鲁克玛
		[GetSpellInfo(167615)] = 12, 
	},
	second = {	
	},	
}

ns.auras_instances_debuffs = {
	first = {
		[799] = {--"卡拉赞"
			[GetSpellInfo(37066)] =  4,
			[GetSpellInfo(29522)] =  4,
			[GetSpellInfo(29511)] =  4,
			[GetSpellInfo(30115)] =  4,
			[GetSpellInfo(30753)] =  4,
			[GetSpellInfo(30843)] =  4,
		},
		[780] = {--"毒蛇神殿"
			[GetSpellInfo(39042)] =  4,
			[GetSpellInfo(39044)] =  4, 
			[GetSpellInfo(38235)] =  4, 
			[GetSpellInfo(38246)] =  4, 
			[GetSpellInfo(37850)] =  4, 
			[GetSpellInfo(38023)] =  4, 
			[GetSpellInfo(38024)] =  4, 
			[GetSpellInfo(38025)] =  4, 
			[GetSpellInfo(37676)] =  4, 
			[GetSpellInfo(37641)] =  4, 
			[GetSpellInfo(37749)] =  4, 
			[GetSpellInfo(38280)] =  4,
		},
		[775] = {--"海加尔山之战"
			[GetSpellInfo(31249)] =  4,
			[GetSpellInfo(31306)] =  4, 
			[GetSpellInfo(31347)] =  4, 
			[GetSpellInfo(31341)] =  4, 
			[GetSpellInfo(31344)] =  4, 
			[GetSpellInfo(31944)] =  4, 
			[GetSpellInfo(31972)] =  4,
		},
		[796] = {--"黑暗神庙"
			[GetSpellInfo(34654)] =  4,
			[GetSpellInfo(39674)] =  4, 
			[GetSpellInfo(41150)] =  4, 
			[GetSpellInfo(41168)] =  4, 
			[GetSpellInfo(39837)] =  4, 
			[GetSpellInfo(40239)] =  4, 
			[GetSpellInfo(40251)] =  4, 
			[GetSpellInfo(40604)] =  4, 
			[GetSpellInfo(40481)] =  4, 
			[GetSpellInfo(40508)] =  4, 
			[GetSpellInfo(42005)] =  4, 
			[GetSpellInfo(41303)] =  4, 
			[GetSpellInfo(41410)] =  4, 
			[GetSpellInfo(41376)] =  4, 
			[GetSpellInfo(40860)] =  4, 
			[GetSpellInfo(41001)] =  4, 
			[GetSpellInfo(41485)] =  4, 
			[GetSpellInfo(41472)] =  4, 
			[GetSpellInfo(41914)] =  4, 
			[GetSpellInfo(41917)] =  4, 
			[GetSpellInfo(40585)] =  4, 
			[GetSpellInfo(40932)] =  4,
		},
		[789] = {--"太阳井"
			[GetSpellInfo(46561)] =  4,
			[GetSpellInfo(46562)] =  4, 
			[GetSpellInfo(46266)] =  4, 
			[GetSpellInfo(46557)] =  4, 
			[GetSpellInfo(46560)] =  4, 
			[GetSpellInfo(46543)] =  4, 
			[GetSpellInfo(46427)] =  4, 
			[GetSpellInfo(45032)] =  4, 
			[GetSpellInfo(45034)] =  4, 
			[GetSpellInfo(45018)] =  4, 
			[GetSpellInfo(46384)] =  4, 
			[GetSpellInfo(45150)] =  4, 
			[GetSpellInfo(45855)] =  4, 
			[GetSpellInfo(45662)] =  4, 
			[GetSpellInfo(45402)] =  4, 
			[GetSpellInfo(45717)] =  4, 
			[GetSpellInfo(45256)] =  4, 
			[GetSpellInfo(45333)] =  4, 
			[GetSpellInfo(46771)] =  4, 
			[GetSpellInfo(45270)] =  4, 
			[GetSpellInfo(45347)] =  4, 
			[GetSpellInfo(45348)] =  4, 
			[GetSpellInfo(45996)] =  4, 
			[GetSpellInfo(45442)] =  4, 
			[GetSpellInfo(45641)] =  4, 
			[GetSpellInfo(45885)] =  4, 
			[GetSpellInfo(45737)] =  4, 
			[GetSpellInfo(45740)] =  4, 
			[GetSpellInfo(45741)] =  4, 
		},
		[527] = {--"永恒之眼"
			--Malygos
			[GetSpellInfo(56272)] =  4, -- Arcane Breath
			[GetSpellInfo(57407)] =  4, -- Surge of Power
		},
		[529] = {--奥杜尔
			--Trash
			[GetSpellInfo(62310)] =  4, --Impale  
			[GetSpellInfo(63612)] =  4, --Lightning Brand  
			[GetSpellInfo(63615)] =  4, --Ravage Armor  
			[GetSpellInfo(62283)] =  4, --Iron Roots  
			[GetSpellInfo(63169)] =  4, --Petrify Joints  
			--Razorscale
			[GetSpellInfo(64771)] =  4,--Fuse Armor  
			--Ignis the Furnace Master
			[GetSpellInfo(62548)] =  4, --Scorch  
			[GetSpellInfo(62680)] =  4, --Flame Jet  
			[GetSpellInfo(62717)] =  4, --Slag Pot  
			--XT-002
			[GetSpellInfo(63024)] =  4, --Gravity Bomb  
			[GetSpellInfo(63018)] =  4, --Light Bomb  
			--The Assembly of Iron
			[GetSpellInfo(61888)] =  4, --Overwhelming Power  
			[GetSpellInfo(62269)] =  4, --Rune of Death  
			[GetSpellInfo(61903)] =  4, --Fusion Punch  
			[GetSpellInfo(61912)] =  4, --Static Disruption 
			--Kologarn
			[GetSpellInfo(64290)] =  4, --Stone Grip  
			[GetSpellInfo(63355)] =  4, --Crunch Armor  
			[GetSpellInfo(62055)] =  4, --Brittle Skin  
			--]Hodir
			[GetSpellInfo(62469)] =  4, --Freeze  
			[GetSpellInfo(61969)] =  4, --Flash Freeze  
			[GetSpellInfo(62188)] =  4, --Biting Cold  
			--Thorim
			[GetSpellInfo(62042)] =  4, --Stormhammer  
			[GetSpellInfo(62130)] =  4, --Unbalancing Strike  
			[GetSpellInfo(62526)] =  4, --Rune Detonation  
			[GetSpellInfo(62470)] =  4, --Deafening Thunder  
			[GetSpellInfo(62331)] =  4, --Impale  
			--Freya
			[GetSpellInfo(62532)] =  4, --Conservator's Grip  
			[GetSpellInfo(62589)] =  4, --Nature's Fury  
			[GetSpellInfo(62861)] =  4, --Iron Roots  
			--Mimiron
			[GetSpellInfo(63666)] =  4,--Napalm Shell  
			[GetSpellInfo(62997)] =  4,--Plasma Blast  
			[GetSpellInfo(64668)] =  4,--Magnetic Field  
			--General Vezax
			[GetSpellInfo(63276)] =  4,--Mark of the Faceless  
			[GetSpellInfo(63322)] =  4,--Saronite Vapors  
			--Yogg-Saron
			[GetSpellInfo(63147)] =  4,--Sara's Anger 
			[GetSpellInfo(63134)] =  4,--Sara's Blessing 
			[GetSpellInfo(63138)] =  4,--Sara's Fervor 
			[GetSpellInfo(63830)] =  4,--Malady of the Mind  
			[GetSpellInfo(63802)] =  4,--Brain Link 
			[GetSpellInfo(63042)] =  4,--Dominate Mind  
			[GetSpellInfo(64152)] =  4,--Draining Poison  
			[GetSpellInfo(64153)] =  4,--Black Plague  
			[GetSpellInfo(64125)] =  4,--Squeeze  
			[GetSpellInfo(64156)] =  4,--Apathy  
			[GetSpellInfo(64157)] =  4,--Curse of Doom  
			--Algalon
			[GetSpellInfo(64412)] =  4,--Phase Punch		
		},
		[531] = {--"黑曜石圣殿"
			--Trash
			[GetSpellInfo(39647)] =  4, -- Curse of Mending
			[GetSpellInfo(58936)] =  4, -- Rain of Fire
			--Sartharion
			[GetSpellInfo(60708)] =  4, -- Fade Armor
			[GetSpellInfo(57491)] =  4, -- Flame Tsunami
		},
		[532] = {--"阿尔卡冯的宝库"
			--Koralon the Flame Watcher
			[GetSpellInfo(66684)] =  4, -- Flaming Cinder
			--Toravon the Ice Watcher
			[GetSpellInfo(72004)] =  4, -- Frostbite
		},
		[535] = { --Naxxramas
			--Trash
			[GetSpellInfo(55314)] =  4,--Strangulate
			--Anub'Rekhan
			[GetSpellInfo(28786)] =  4,--Locust Swarm 
			--Grand Widow Faerlina--
			[GetSpellInfo(28796)] =  4,--Poison Bolt Volley
			[GetSpellInfo(28794)] =  4,--Rain of Fire
			--Maexxna
			[GetSpellInfo(28622)] =  4,--Web Wrap
			[GetSpellInfo(54121)] =  4,--Necrotic Poison
			--Noth the Plaguebringer
			[GetSpellInfo(29213)] =  4,--Curse of the Plaguebringer
			[GetSpellInfo(29214)] =  4,--Wrath of the Plaguebringer 
			[GetSpellInfo(29212)] =  4,--Cripple 
			--Heigan the Unclean
			[GetSpellInfo(29998)] =  4,--Decrepit Fever 
			[GetSpellInfo(29310)] =  4,--Spell Disruption 
			--Grobbulus
			[GetSpellInfo(28169)] =  4,--Mutating Injection 
			--Gluth
			[GetSpellInfo(54378)] =  4,--Mortal Wound 
			[GetSpellInfo(29306)] =  4,--Infected Wound 
			--Thaddius
			[GetSpellInfo(28084)] =  4,--Negative Charge 
			[GetSpellInfo(28059)] =  4,--Positive Charge 
			--Instructor Razuvious
			[GetSpellInfo(55550)] =  4,--Jagged Knife 
			--Sapphiron
			[GetSpellInfo(28522)] =  4,--Icebolt 
			[GetSpellInfo(28542)] =  4,--Life Drain
			--Kel'Thuzad
			[GetSpellInfo(28410)] =  4,--Chains of Kel'Thuzad
			[GetSpellInfo(27819)] =  4,--Detonate Mana
			[GetSpellInfo(27808)] =  4,--Frost Blast 		
			},
		[543] = {--"十字军的试炼"
			--Gormok the Impaler
			[GetSpellInfo(66331)] =  5, -- Impale
			[GetSpellInfo(67475)] =  5, -- Fire Bomb
			[GetSpellInfo(66406)] =  5, -- Snowbolled!
			--Acidmaw --Dreadscale
			[GetSpellInfo(67618)] =  5, -- Paralytic Toxin
			[GetSpellInfo(66869)] =  5, -- Burning Bile
			--Icehowl
			[GetSpellInfo(67654)] =  5, -- Ferocious Butt
			[GetSpellInfo(66689)] =  5, -- Arctic Breathe
			[GetSpellInfo(66683)] =  5, -- Massive Crash
			--Lord Jaraxxus
			[GetSpellInfo(66532)] =  5, -- Fel Fireball
			[GetSpellInfo(66237)] =  9, -- 血肉成灰
			[GetSpellInfo(66242)] =  7, -- Burning Inferno
			[GetSpellInfo(66197)] =  5, -- Legion Flame
			[GetSpellInfo(66283)] =  9, -- Spinning Pain Spike
			[GetSpellInfo(66209)] =  5, -- Touch of Jaraxxus(hard)
			[GetSpellInfo(66211)] =  5, -- Curse of the Nether(hard)
			[GetSpellInfo(67906)] =  5, -- Mistress's Kiss 10H
			--Faction Champions
			[GetSpellInfo(65812)] =  9, -- Unstable Affliction
			[GetSpellInfo(65960)] =  5, -- Blind
			[GetSpellInfo(65801)] =  5, -- Polymorph
			[GetSpellInfo(65543)] =  5, -- Psychic Scream
			[GetSpellInfo(66054)] =  5, -- Hex
			[GetSpellInfo(65809)] =  5, -- Fear
			--The Twin Val'kyr
			[GetSpellInfo(67176)] =  5, -- Dark Essence
			[GetSpellInfo(67222)] =  5, -- Light Essence
			[GetSpellInfo(67283)] =  7, -- Dark Touch
			[GetSpellInfo(67298)] =  7, -- Ligth Touch
			[GetSpellInfo(67309)] =  5, -- Twin Spike
			--Anub'arak
			[GetSpellInfo(67574)] =  9, -- Pursued by Anub'arak
			[GetSpellInfo(66013)] =  7, -- Penetrating Cold
			[GetSpellInfo(67847)] =  5, -- Expose Weakness
			[GetSpellInfo(66012)] =  5, -- Freezing Slash
			[GetSpellInfo(67863)] =  5, -- Acid-Drenched Mandibles(25H)
		},
		[604] = {--"冰冠堡垒"
			--The Lower Spire
			[GetSpellInfo(70980)] =  7, -- Web Wrap
			[GetSpellInfo(69483)] =  6, -- Dark Reckoning
			[GetSpellInfo(69969)] =  5, -- Curse of Doom
			--The Plagueworks
			[GetSpellInfo(71089)] =  5, -- Bubbling Pus
			[GetSpellInfo(71127)] =  7, -- Mortal Wound
			[GetSpellInfo(71163)] =  6, -- Devour Humanoid
			[GetSpellInfo(71103)] =  6, -- Combobulating Spray
			[GetSpellInfo(71157)] =  5, -- Infested Wound
			--The Crimson Hall
			[GetSpellInfo(70645)] =  9, -- Chains of Shadow
			[GetSpellInfo(70671)] =  5, -- Leeching Rot
			[GetSpellInfo(70432)] =  6, -- Blood Sap
			[GetSpellInfo(70435)] =  7, -- Rend Flesh
			--Frostwing Hall
			[GetSpellInfo(71257)] =  6, -- Barbaric Strike
			[GetSpellInfo(71252)] =  5, -- Volley
			[GetSpellInfo(71327)] =  6, -- Web
			[GetSpellInfo(36922)] =  5, -- Bellowing Roar
			--Lord Marrowgar
			[GetSpellInfo(70823)] =  5, -- Coldflame
			[GetSpellInfo(69065)] =  8, -- Impaled
			[GetSpellInfo(70835)] =  5, -- Bone Storm
			--Lady Deathwhisper
			[GetSpellInfo(72109)] =  5, -- Death and Decay
			[GetSpellInfo(71289)] =  9, -- Dominate Mind
			[GetSpellInfo(71204)] =  4, -- Touch of Insignificance
			[GetSpellInfo(67934)] =  5, -- Frost Fever
			[GetSpellInfo(71237)] =  5, -- Curse of Torpor
			[GetSpellInfo(72491)] =  5, -- Necrotic Strike
			--Gunship Battle
			[GetSpellInfo(69651)] =  5, -- Wounding Strike
			--Deathbringer Saurfang
			[GetSpellInfo(72293)] =  6, -- Mark of the Fallen Champion
			[GetSpellInfo(72442)] =  8, -- Boiling Blood
			[GetSpellInfo(72449)] =  5, -- Rune of Blood
			[GetSpellInfo(72769)] =  5, -- Scent of Blood (heroic)
			--Rotface
			[GetSpellInfo(71224)] =  5, -- Mutated Infection
			[GetSpellInfo(71215)] =  5, -- Ooze Flood
			[GetSpellInfo(69774)] =  5, -- Sticky Ooze
			--Festergut
			[GetSpellInfo(69279)] =  5, -- Gas Spore
			[GetSpellInfo(71218)] =  5, -- Vile Gas
			[GetSpellInfo(72219)] =  5, -- Gastric Bloat
			--Proffessor
			[GetSpellInfo(70341)] =  5, -- Slime Puddle
			[GetSpellInfo(72549)] =  5, -- Malleable Goo
			[GetSpellInfo(71278)] =  5, -- Choking Gas Bomb
			[GetSpellInfo(70215)] =  5, -- Gaseous Bloat
			[GetSpellInfo(70447)] =  5, -- Volatile Ooze Adhesive
			[GetSpellInfo(72454)] =  5, -- Mutated Plague
			[GetSpellInfo(70405)] =  5, -- Mutated Transformation
			[GetSpellInfo(72856)] =  6, -- Unbound Plague
			[GetSpellInfo(70953)] =  4, -- Plague Sickness
			--Blood Princes
			[GetSpellInfo(72796)] =  7, -- Glittering Sparks
			[GetSpellInfo(71822)] =  5, -- Shadow Resonance
			--Blood-Queen Lana'thel
			[GetSpellInfo(70867)] =  8, -- 鲜血女王的精华
			[GetSpellInfo(70838)] =  5, -- Blood Mirror
			[GetSpellInfo(72265)] =  6, -- Delirious Slash
			[GetSpellInfo(71473)] =  5, -- Essence of the Blood Queen
			[GetSpellInfo(71474)] =  6, -- Frenzied Bloodthirst
			[GetSpellInfo(73070)] =  5, -- Incite Terror
			[GetSpellInfo(71340)] =  7, -- Pact of the Darkfallen
			[GetSpellInfo(71265)] =  6, -- Swarming Shadows
			[GetSpellInfo(70923)] =  9, -- Uncontrollable Frenzy
			--Valithria Dreamwalker
			[GetSpellInfo(70873)] =  1, -- Emerald Vigor
			[GetSpellInfo(71746)] =  5, -- Column of Frost
			[GetSpellInfo(71741)] =  4, -- Mana Void
			[GetSpellInfo(71738)] =  7, -- Corrosion
			[GetSpellInfo(71733)] =  6, -- Acid Burst
			[GetSpellInfo(71283)] =  6, -- Gut Spray
			[GetSpellInfo(71941)] =  1, -- Twisted Nightmares
			--Sindragosa
			[GetSpellInfo(69762)] =  5, -- Unchained Magic
			[GetSpellInfo(70106)] =  6, -- Chlled to the Bone
			[GetSpellInfo(69766)] =  6, -- Instability
			[GetSpellInfo(70126)] =  9, -- Frost Beacon
			[GetSpellInfo(70157)] =  8, -- Ice Tomb
			[GetSpellInfo(70127)] =  7, -- Mystic Buffet
			--The Lich King
			[GetSpellInfo(70337)] =  8, -- Necrotic plague
			[GetSpellInfo(72149)] =  5, -- Shockwave
			[GetSpellInfo(70541)] =  7, -- Infest
			[GetSpellInfo(69242)] =  5, -- Soul Shriek
			[GetSpellInfo(69409)] =  9, -- Soul Reaper
			[GetSpellInfo(72762)] =  5, -- Defile
			[GetSpellInfo(68980)] =  8, --Harvest Soul
		},
		[609] = {--“晶红龙殿”
			--Baltharus the Warborn
			[GetSpellInfo(74502)] =  4, -- Enervating Brand
			--General Zarithrian
			[GetSpellInfo(74367)] =  4, -- Cleave Armor
			--Saviana Ragefire
			[GetSpellInfo(74452)] =  4, -- Conflagration
			--Halion
			[GetSpellInfo(74562)] =  7, -- Fiery Combustion
			[GetSpellInfo(74567)] =  5, -- Combustion
			[GetSpellInfo(74792)] =  6, -- Soul Consumption
			[GetSpellInfo(74795)] =  4, -- Consumption
		},		
		[769] = {--旋云之巅

		},
		[747] = {--托维尔失落之城

		},
		[759] = {--起源大厅

		},

		[756] = {--"死亡矿井"
			[GetSpellInfo(91016)] =  7, -- 劈头斧
			[GetSpellInfo(88352)] =  8, -- 放置炸弹
			[GetSpellInfo(91830)] =  7, -- 注视
		},		
		[781] = {--"祖阿曼(5人)"
			[GetSpellInfo(43150)] =  8, -- 利爪之怒
			[GetSpellInfo(43648)] =  8, -- 电能风暴
			[GetSpellInfo(43501)] =  8, -- 灵魂虹吸
			[GetSpellInfo(43093)] =  10, -- 重伤投掷
			[GetSpellInfo(43095)] =  10, -- 麻痹蔓延
			[GetSpellInfo(42402)] =  10, -- 澎湃
		},
		[793] = {--"祖尔格拉布(5人)"
			[GetSpellInfo(96477)] =  10, -- 剧毒连接
			[GetSpellInfo(96466)] =  8, -- 赫希斯之耳语
			[GetSpellInfo(96776)] =  12, -- 血祭
			[GetSpellInfo(96423)] =  10, -- 痛苦鞭笞
			[GetSpellInfo(96342)] =  10, -- 扑杀
		},
		[800] = { -- 火源
			--Trash 
			--Flamewaker Forward Guard 
			[GetSpellInfo(76622)] =  4, -- Sunder Armor 
			[GetSpellInfo(99610)] =  5, -- Shockwave 
			--Flamewaker Pathfinder 
			[GetSpellInfo(99695)] =  4, -- Flaming Spear 
			[GetSpellInfo(99800)] =  4, -- Ensnare 
			--Flamewaker Cauterizer 
			[GetSpellInfo(99625)] =  4, -- Conflagration (Magic/dispellable) 
			--Fire Scorpion 
			[GetSpellInfo(99993)] =  4, -- Fiery Blood 
			--Molten Lord 
			[GetSpellInfo(100767)] =  4, -- Melt Armor 
			--Ancient Core Hound 
			[GetSpellInfo(99692)] =  4, -- Terrifying Roar (Magic/dispellable) 
			[GetSpellInfo(99693)] =  4, -- Dinner Time 
			--Magma 
			[GetSpellInfo(97151)] =  4, -- Magma 

			--Beth'tilac 
			[GetSpellInfo(99506)] =  5, -- The Widow's Kiss 
			--Cinderweb Drone 
			[GetSpellInfo(49026)] =  6, -- Fixate 
			--Cinderweb Spinner 
			[GetSpellInfo(97202)] =  5, -- Fiery Web Spin 
			--Cinderweb Spiderling 
			[GetSpellInfo(97079)] =  4, -- Seeping Venom 
			--Cinderweb Broodling 

			[GetSpellInfo(100048)] =  4, --Fiery Web 

			--Lord Rhyolith 
			[GetSpellInfo(98492)] =  5, --Eruption 

			--Alysrazor 
			[GetSpellInfo(101729)] =  5, -- Blazing Claw 
			[GetSpellInfo(100094)] =  4, -- Fieroblast 
			[GetSpellInfo(99389)] =  5, -- Imprinted 
			[GetSpellInfo(99308)] =  4, -- Gushing Wound 
			[GetSpellInfo(100640)] =  6, -- Harsh Winds 
			[GetSpellInfo(100555)] =  6, -- Smouldering Roots 
			--Do we want to show these? 
			[GetSpellInfo(99461)] =  4, -- Blazing Power 
			--[GetSpellInfo(98734)] =  4, -- Molten Feather 
			--[GetSpellInfo(98619)] =  4, -- Wings of Flame 
			--[GetSpellInfo(100029)] =  4, -- Alysra's Razor 

			--Shannox 
			[GetSpellInfo(99936)] =  5, -- Jagged Tear 
			[GetSpellInfo(99837)] =  7, -- Crystal Prison Trap Effect 
			[GetSpellInfo(101208)] =  4, -- Immolation Trap 
			[GetSpellInfo(99840)] =  4, -- Magma Rupture 
			-- Riplimp 
			[GetSpellInfo(99937)] =  5, -- Jagged Tear 
			-- Rageface 
			[GetSpellInfo(99947)] =  6, -- Face Rage 
			[GetSpellInfo(100415)] =  5, -- Rage  

			--守门人贝尔洛克 
			[GetSpellInfo(99252)] =  4, -- Blaze of Glory 
			[GetSpellInfo(99256)] =  15, -- 饱受磨难 
			[GetSpellInfo(99403)] =  6, -- Tormented 
			[GetSpellInfo(99262)] =  4, -- 活力火花
			[GetSpellInfo(99263)] =  4, -- 生命之焰
			[GetSpellInfo(99516)] =  7, -- Countdown 
			[GetSpellInfo(99353)] =  7, -- Decimating Strike 
			[GetSpellInfo(100908)] =  6, -- Fiery Torment 

			--Majordomo Staghelm 
			[GetSpellInfo(98535)] =  5, -- Leaping Flames 
			[GetSpellInfo(98443)] =  6, -- Fiery Cyclone 
			[GetSpellInfo(98450)] =  5, -- Searing Seeds 
			--Burning Orbs 
			[GetSpellInfo(100210)] =  6, -- Burning Orb 
			[GetSpellInfo(96993)] =  5, -- Stay Withdrawn? 

			--Ragnaros 
			[GetSpellInfo(99399)] =  5, -- Burning Wound 
			[GetSpellInfo(100293)] =  5, -- Lava Wave 
			[GetSpellInfo(100238)] =  4, -- Magma Trap Vulnerability 
			[GetSpellInfo(98313)] =  4, -- Magma Blast 
			--Lava Scion 
			[GetSpellInfo(100460)] =  7, -- Blazing Heat 
			--Dreadflame? 
			--Son of Flame 
			--Lava 
			[GetSpellInfo(98981)] =  5, -- Lava Bolt 
			--Molten Elemental 
			--Living Meteor 
			[GetSpellInfo(100249)] =  5, -- Combustion 
			--Molten Wyrms 
			[GetSpellInfo(99613)] =  6, -- Molten Blast   

		},

		[752] = { --[GetSpellInfo([GetSpellInfo( 巴拉丁 )])]--	
			-- Demon Containment Unit
			[GetSpellInfo(89354)] =  10,
			-- Argaloth
			[GetSpellInfo(88942)] =  8, -- Meteor Slash
			[GetSpellInfo(88954)] =  12, -- Consuming Darkness
			-- Occu'thar
			[GetSpellInfo(96913)] =  10, -- 灼热暗影
			[GetSpellInfo(96884)] =  7, 	-- 集火
			-- Eye of Occu'thar
			[GetSpellInfo(105069)] =  11, -- 沸腾之怨
			[GetSpellInfo(104936)] =  12, -- 刺穿
		},
		
		[754] = { --[GetSpellInfo([GetSpellInfo( 黑翼)])]--
			--熔喉
			[GetSpellInfo(78941)] =  6, -- 寄生感染
			[GetSpellInfo(89773)] =  7, -- 裂伤

			--全能金刚
			[GetSpellInfo(79888)] =  6, -- 闪电导体
			[GetSpellInfo(79505)] =  8, -- 火焰喷射器
			[GetSpellInfo(80161)] =  7, -- 化学云雾
			[GetSpellInfo(79501)] =  8, -- 获取目标
			[GetSpellInfo(80011)] =  7, -- 浸透毒液
			[GetSpellInfo(80094)] =  7, -- 锁定
			[GetSpellInfo(92023)] =  9, -- 暗影包围
			[GetSpellInfo(92048)] =  9, -- 暗影灌注
			[GetSpellInfo(92053)] =  9, -- 暗影导体
			--[GetSpellInfo(91858)] =  6, -- 超载的能量发生器
			
			--马洛拉克 教授龙
			[GetSpellInfo(92973)] =  8, -- 消蚀烈焰
			[GetSpellInfo(92978)] =  8, -- 快速冻结
			[GetSpellInfo(92976)] =  7, -- 酷寒
			[GetSpellInfo(91829)] =  7, -- 注视
			[GetSpellInfo(92787)] =  9, -- 黑暗吞噬

			--音波龙
			[GetSpellInfo(78092)] =  7, -- 追踪
			[GetSpellInfo(78897)] =  8, -- 声音太大了
			[GetSpellInfo(78023)] =  7, -- 咆哮烈焰

			--奇美隆
			[GetSpellInfo(89084)] =  8, -- 生命值过低
			[GetSpellInfo(82881)] =  7, -- 突破
			[GetSpellInfo(82890)] =  9, -- 至死方休
			[GetSpellInfo(82935)] =  10, -- 腐蚀烂泥

			--奈法利安
			[GetSpellInfo(94128)] =  7, -- 扫尾
			[GetSpellInfo(94075)] =  8, -- 熔岩
			[GetSpellInfo(81118)] =  8, -- 熔岩
			[GetSpellInfo(79339)] =  9, -- 爆裂灰烬
			[GetSpellInfo(79318)] =  9, -- 统御
			[GetSpellInfo(77827)] =  6, -- 龙尾扫击
		},

		[758] = { --[GetSpellInfo([GetSpellInfo( 暮光)])]--
			--破龙
			[GetSpellInfo(39171)] =  7, -- 致伤打击
			[GetSpellInfo(86169)] =  8, -- 狂怒咆哮

			--双龙
			[GetSpellInfo(86788)] =  8, -- 眩晕
			[GetSpellInfo(86622)] =  7, -- 嗜体魔法
			[GetSpellInfo(86202)] =  7, -- 暮光位移

			--议会
			[GetSpellInfo(82665)] =  7, -- 寒冰之心
			[GetSpellInfo(82660)] =  7, -- 燃烧之血
			[GetSpellInfo(82762)] =  7, -- 浸水
			[GetSpellInfo(83099)] =  9, -- 闪电魔棒
			[GetSpellInfo(82285)] =  8, -- 元素禁止
			[GetSpellInfo(92488)] =  8, -- 重力碾压

			--古加尔
			[GetSpellInfo(86028)] =  6, -- 古加尔的冲击波
			[GetSpellInfo(93189)] =  7, -- 堕落之血
			[GetSpellInfo(93133)] =  7, -- 衰弱光线
			[GetSpellInfo(81836)] =  8, -- 腐蚀:加速
			[GetSpellInfo(81831)] =  8, -- 腐蚀:疫病
			[GetSpellInfo(82125)] =  8, -- 腐蚀:畸变
			[GetSpellInfo(82170)] =  8, -- 腐蚀:绝对

			--龙母
			[GetSpellInfo(89435)] =  15, -- 毁坏
		},

		[773] = { --[GetSpellInfo([GetSpellInfo( 四风 )])]--
			--风之议会
			[GetSpellInfo(85576)] =  9, -- 枯萎之风
			[GetSpellInfo(85573)] =  9, -- 呼啸狂风
			[GetSpellInfo(93057)] =  7, -- 刺骨旋风
			[GetSpellInfo(86481)] =  8, -- 飓风
			[GetSpellInfo(93123)] =  7, -- 风寒
			[GetSpellInfo(93121)] =  8, -- 剧毒孢子

			--奥拉基尔
			--[GetSpellInfo(93281)] =  7, -- 酸雨
			[GetSpellInfo(87873)] =  7, -- 静电震击
			[GetSpellInfo(88427)] =  7, -- 通电
			[GetSpellInfo(93294)] =  8, -- 闪电魔棒
			[GetSpellInfo(93284)] =  9, -- 狂风
		},
		
		   [824] = {-- Dragon Soul
			--Morchok
		        [GetSpellInfo(103687)] =  11, --Crush Armor
		        [GetSpellInfo(103821)] =  12, --Earthen Vortex
		        [GetSpellInfo(103785)] =  13, --Black Blood of the Earth
		        [GetSpellInfo(103534)] =  14, --Danger (Red)
		        [GetSpellInfo(103536)] =  15, --Warning (Yellow)
		        -- Don't need to show Safe people
		        [GetSpellInfo(103541)] =  16, --Safe (Blue)

		        --督军
		        [GetSpellInfo(104378)] =  21, --Black Blood of Go'rath
		        [GetSpellInfo(103434)] =  22, --干扰之影
	
		        --Yor'sahj the Unsleeping
		        [GetSpellInfo(104849)] =  31, --虚空箭
		        [GetSpellInfo(105171)] =  32, --深度腐蚀

		        --Hagara the Stormbinder
		        [GetSpellInfo(105316)] =  41, --Ice Lance
		        [GetSpellInfo(105465)] =  42, --Lightning Storm
		        [GetSpellInfo(105369)] =  43, --Lightning Conduit
		        [GetSpellInfo(105289)] =  44, --Shattered Ice (dispellable)
		        [GetSpellInfo(105285)] =  45, --Target (next Ice Lance)
		        [GetSpellInfo(104451)] =  46, --Ice Tomb
		        [GetSpellInfo(110317)] =  49, --水壕
		        [GetSpellInfo(109325)] =  48, --霜冻				

		        --Ultraxion
		        [GetSpellInfo(105925)] =  55, --黯淡之光
		        [GetSpellInfo(106108)] =  52, --Heroic Will
		        [GetSpellInfo(105984)] =  53, --Timeloop
		        [GetSpellInfo(105927)] =  54, --Faded Into Twilight

		        --Warmaster Blackhorn		        
		        [GetSpellInfo(107558)] =  62, --溃变 
		        [GetSpellInfo(108046)] =  63, --震荡波
		        [GetSpellInfo(110214)] =  64, --吞噬遮幕
		        [GetSpellInfo(107567)] =  65, --残忍打击
		        [GetSpellInfo(108043)] =  66, --破甲

		        --Spine of Deathwing
		        [GetSpellInfo(105563)] =  71, --Grasping Tendrils
		        [GetSpellInfo(105479)] =  72, --灼热血浆
		        [GetSpellInfo(105490)] =  73, --灼热之握
		        [GetSpellInfo(106200)] =  74, --血之腐蚀:大地
		        [GetSpellInfo(106199)] =  75, --血之腐蚀:死亡

		        --Madness of Deathwing
		        [GetSpellInfo(105445)] =  81, --炽热
		        [GetSpellInfo(105841)] =  82, --突变撕咬
		        [GetSpellInfo(106385)] =  83, --重碾
		        [GetSpellInfo(106730)] =  84, --破伤风
		        [GetSpellInfo(106444)] =  85, --刺穿
		        [GetSpellInfo(106794)] =  86, --碎屑
		        [GetSpellInfo(108649)] =  87, --腐蚀寄生虫
		},	
		[875] = { --Gate of the Setting Sun 残阳关
			[GetSpellInfo(107268)] = 7,
			[GetSpellInfo(106933)] = 7,
			[GetSpellInfo(115458)] = 7,
			-- Raigonn 莱公
			[GetSpellInfo(111644)] = 7, -- Screeching Swarm 111640 111643
			[GetSpellInfo(111723)] = 7, --凝视
		},

		[885] = { --Mogu'shan Palace 魔古山神殿 
			
			-- Trial of the King 国王的试炼
			[GetSpellInfo(119946)] = 7, -- Ravage
			[GetSpellInfo(120167)] = 7, --焚烧
			[GetSpellInfo(120195)] = 7, --陨石术
			[GetSpellInfo(120160)] = 7, --陨石术
			-- Xin the Weaponmaster <King of the Clans> 武器大师席恩
			[GetSpellInfo(119684)] = 7, --Ground Slam
		},
      
		[871] = { --Scarlet Halls 血色大厅

			-- Houndmaster Braun <PH Dressing>
			[GetSpellInfo(114056)] = 7, -- Bloody Mess
        
			-- Flameweaver Koegler
			[GetSpellInfo(113653)] = 7, -- Greater Dragon's Breath
			[GetSpellInfo(11366)] = 6,-- Pyroblast      
		},
      
		[874] = { --Scarlet Monastery 血色修道院 

			-- Thalnos the Soulrender
			[GetSpellInfo(115144)] = 7, -- Mind Rot
			[GetSpellInfo(115297)] = 6, -- Evict Soul
		},
      
		[763] = { --Scholomance 通灵学院 

			-- Instructor Chillheart
			[GetSpellInfo(111631)] = 7, -- Wrack Soul
			
			-- Lilian Voss
			[GetSpellInfo(111585)] = 7, -- Dark Blaze
			[GetSpellInfo(115350)] = 7,--凝视
			
			-- Darkmaster Gandling
			[GetSpellInfo(108686)] = 7, -- Immolate
		},
            
		[877] = { --Shado-Pan Monastery 影踪禅院 
			[GetSpellInfo(107140)] = 7, --磁能障壁
			-- Sha of Violence
			[GetSpellInfo(106872)] = 7, -- Disorienting Smash
			
			-- Taran Zhu <Lord of the Shado-Pan>
			[GetSpellInfo(112932)] = 7, -- Ring of Malice
		},
      
		[887] = { --Siege of Niuzao Temple 围攻砮皂寺

			-- Wing Leader Ner'onok 
			[GetSpellInfo(121447)] = 7, -- Quick-Dry Resin
		},
      
		[867] = { --Temple of the Jade Serpent 青龙寺
			
			[GetSpellInfo(114826)] = 7, --
			-- Wise Mari <Waterspeaker>
			[GetSpellInfo(106653)] = 7, -- Sha Residue
         
			-- Lorewalker Stonestep <The Keeper of Scrolls>
			[GetSpellInfo(106653)] = 7, -- Agony
         
			-- Liu Flameheart <Priestess of the Jade Serpent>
			[GetSpellInfo(106823)] = 7, -- Serpent Strike
         
			-- Sha of Doubt
			[GetSpellInfo(106113)] = 7, --Touch of Nothingness
		},
      
		[896] = { --Mogu'shan Vaults 魔古山宝库
         
			--Trash
			[GetSpellInfo(118562)] = 9, -- Petrified
			[GetSpellInfo(118552)] = 9,  
			[GetSpellInfo(116596)] = 10, -- Smoke Bomb
			[GetSpellInfo(125091)] = 9,
			[GetSpellInfo(125092)] = 9,
			[GetSpellInfo(116970)] = 9,

			-- The Stone Guard
			[GetSpellInfo(130395)] = 11, -- Jasper Chains: Stacks
			[GetSpellInfo(130404)] = 12, -- Jasper Chains
			[GetSpellInfo(130774)] = 13, -- Amethyst Pool
			[GetSpellInfo(116038)] = 14, -- Jasper Petrification: stacks
			[GetSpellInfo(115861)] = 15, -- Cobalt Petrification: stacks
			[GetSpellInfo(116060)] = 16, -- Amethyst Petrification: stacks
			[GetSpellInfo(116281)] = 17, -- Cobalt Mine Blast, Magic root
			[GetSpellInfo(125206)] = 18, -- Rend Flesh: Tank only
			[GetSpellInfo(116008)] = 19, -- Jade Petrification: stacks

			--Feng the Accursed
			[GetSpellInfo(116040)] = 22, -- Epicenter, roomwide aoe.
			[GetSpellInfo(116784)] = 24, -- Wildfire Spark, Debuff that explodes leaving fire on the ground after 5 sec.
			[GetSpellInfo(116374)] = 29, -- Lightning Charge, Stun debuff.
			[GetSpellInfo(116417)] = 27, -- Arcane Resonance, aoe-people-around-you-debuff.
			[GetSpellInfo(116942)] = 23, -- Flaming Spear, fire damage dot.
			[GetSpellInfo(131788)] = 21, -- Lightning Lash: Tank Only: Stacks
			[GetSpellInfo(131790)] = 25, -- Arcane Shock: Stack : Tank Only
			[GetSpellInfo(102464)] = 26, -- Arcane Shock: AOE
			[GetSpellInfo(116364)] = 28, -- Arcane Velocity
			[GetSpellInfo(131792)] = 30, -- Shadowburn: Tank only: Stacks: HEROIC ONLY

			-- Gara'jal the Spiritbinder
			[GetSpellInfo(122151)] = 44,   -- Voodoo Doll, shared damage with the tank.
			[GetSpellInfo(117723)] = 43,   -- Frail Soul: HEROIC ONLY --虛弱靈魂
			[GetSpellInfo(116161)] = 41,   -- Crossed Over, people in the spirit world.
			[GetSpellInfo(122181)] = 42,	 -- 通往灵魂世界的通道

			-- The Spirit Kings
			[GetSpellInfo(117708)] = 51, -- Meddening Shout, The mind control debuff.
			[GetSpellInfo(118303)] = 52, -- Fixate, the once targeted by the shadows.
			[GetSpellInfo(118048)] = 53, -- Pillaged, the healing/Armor/damage debuff.
			[GetSpellInfo(118135)] = 54, -- Pinned Down, Najentus spine 2.0
			[GetSpellInfo(118047)] = 55, -- Pillage: Target
			[GetSpellInfo(118163)] = 56, -- Robbed Blind

			--Elegon
			[GetSpellInfo(117878)] = 61, -- Overcharged, the stacking increased damage taken debuff.   
			[GetSpellInfo(117945)] = 63, -- Arcing Energy
			[GetSpellInfo(117949)] = 62, -- Closed Circuit, Magic Healing debuff.

			--Will of the Emperor
			[GetSpellInfo(116969)] = 76, -- Stomp, Stun from the bosses.
			[GetSpellInfo(116835)] = 77, -- Devestating Arc, Armor debuff from the boss.
			[GetSpellInfo(116969)] = 75, -- Focused Energy.
			[GetSpellInfo(116778)] = 72, -- Focused Defense, Fixate from the Emperors Courage.
			[GetSpellInfo(117485)] = 73, -- Impending Thrust, Stacking slow from the Emperors Courage.
			[GetSpellInfo(116525)] = 71, -- Focused Assault, Fixate from the Emperors Rage
			[GetSpellInfo(116550)] = 74, -- Energizing Smash, Knockdown from the Emperors Strength
		},
      
		[897] = { --Heart of Fear 恐惧之心 
			[GetSpellInfo(123417)] = 9,
			[GetSpellInfo(123434)] = 9,
			[GetSpellInfo(123436)] = 8, 
			[GetSpellInfo(123497)] = 8,
			[GetSpellInfo(123420)] = 8,
			[GetSpellInfo(126901)] = 8,
			[GetSpellInfo(125081)] = 8,
			[GetSpellInfo(125758)] = 8,
			[GetSpellInfo(125907)] = 8,
			[GetSpellInfo(126912)] = 7,
         
			-- Imperial Vizier Zor'lok
			[GetSpellInfo(122760)] = 11, -- Exhale, The person targeted for Exhale. 
			[GetSpellInfo(123812)] = 12, -- Pheromones of Zeal, the gas in the middle of the room.
			[GetSpellInfo(122706)] = 14, -- Noise Cancelling, The "safe zone" from the roomwide aoe.
			[GetSpellInfo(122740)] = 13, -- Convert, The mindcontrol Debuff.

			-- Blade Lord Ta'yak
			[GetSpellInfo(123180)] = 21, -- Wind Step, Bleeding Debuff from stealth.
			[GetSpellInfo(123474)] = 23, -- Overwhelming Assault, stacking tank swap debuff. 
			[GetSpellInfo(122949)] = 22, -- Unseen Strike
			[GetSpellInfo(124783)] = 24, -- Storm Unleashed
			[GetSpellInfo(123600)] = 25, -- Storm Unleashed?

			-- Garalon
			[GetSpellInfo(122774)] = 31, -- Crush, stun from the crush ability.
			[GetSpellInfo(123120)] = 34, --- Pheromone Trail
			[GetSpellInfo(122835)] = 32, -- Pheromones, The buff indicating who is carrying the pheramone.
			[GetSpellInfo(123081)] = 33, -- Punchency, The stacking debuff causing the raid damage.

			--Wind Lord Mel'jarak
			[GetSpellInfo(122055)] = 42, -- Residue, The debuff after breaking a prsion preventing further breaking.
			[GetSpellInfo(121881)] = 41, -- Amber Prison, not sure what the differance is but both were used.
			[GetSpellInfo(122064)] = 43, -- Corrosive Resin, the dot you clear by moving/jumping.
			[GetSpellInfo(121885)] = 44, -- 监牢

			-- Amber-Shaper Un'sok 
			[GetSpellInfo(122064)] = 54, -- Corrosive Resin
			[GetSpellInfo(122784)] = 53, -- Reshape Life, Both were used.
			[GetSpellInfo(122504)] = 55, -- Burning Amber.
			[GetSpellInfo(121949)] = 52, -- Parasitic Growth, the dot that scales with healing taken.
			[GetSpellInfo(122370)] = 51, -- 生命重塑
		
			--Grand Empress Shek'zeer
			[GetSpellInfo(125283)] = 60, 
			[GetSpellInfo(124097)] = 61, --Sticky Resin.
			[GetSpellInfo(125390)] = 62, --Fixate.
			[GetSpellInfo(123707)] = 63, --Eyes of the Empress.
			[GetSpellInfo(123788)] = 64, --Cry of Terror.
			[GetSpellInfo(125824)] = 65, --Trapped!.
			[GetSpellInfo(124777)] = 66, --Poison Bomb.
			[GetSpellInfo(124821)] = 67, --Poison-Drenched Armor.
			[GetSpellInfo(124827)] = 68, --Poison Fumes.
			[GetSpellInfo(124849)] = 69, --Consuming Terror.
			[GetSpellInfo(124863)] = 70, --Visions of Demise.
			[GetSpellInfo(124862)] = 71, --Visions of Demise: Target.
			[GetSpellInfo(123845)] = 72, --Heart of Fear: Chosen.
			[GetSpellInfo(123846)] = 73, --Heart of Fear: Lure.
			[GetSpellInfo(123184)] = 74,		
		},
      
		[886] = { --Terrace of Endless Spring 永春台
			
			--Trash
			[GetSpellInfo(125760)] = 10,
			[GetSpellInfo(125758)] = 10,

			--Protectors Of the Endless
			[GetSpellInfo(117519)] = 11, -- Touch of Sha, Dot that lasts untill Kaolan is defeated.
			[GetSpellInfo(111850)] = 12, -- Lightning Prison: Targeted
			[GetSpellInfo(117986)] = 15, -- Defiled Ground: Stacks
			[GetSpellInfo(118191)] = 14, -- Corrupted Essence
			[GetSpellInfo(117436)] = 13, -- Lightning Prison, Magic stun.

			--Tsulong
			[GetSpellInfo(122768)] = 21, -- Dread Shadows, Stacking raid damage debuff (ragnaros superheated style) 
			[GetSpellInfo(122789)] = 24, -- Sunbeam, standing in the sunbeam, used to clear dread shadows.
			[GetSpellInfo(122858)] = 28, -- Bathed in Light, 500% increased healing done debuff.
			[GetSpellInfo(122752)] = 23, -- Shadow Breath, increased shadow breath damage debuff.
			[GetSpellInfo(123011)] = 26, -- Terrorize: 10%, Magical dot dealing % health.
			[GetSpellInfo(123036)] = 27, -- Fright, 2 second fear.
			[GetSpellInfo(122777)] = 22, -- Nightmares, 3 second fear.
			[GetSpellInfo(123012)] = 25, -- Terrorize: 5% 
			
			--Lei Shi
			[GetSpellInfo(123121)] = 31, -- Spray, Stacking frost damage taken debuff.
			[GetSpellInfo(123705)] = 32, -- Scary Fog
			
			--Sha of Fear
			[GetSpellInfo(129147)] = 42, -- Ominous Cackle, Debuff that sends players to the outer platforms.
			[GetSpellInfo(119086)] = 49, -- Penetrating Bolt, Increased Shadow damage debuff.
			[GetSpellInfo(119775)] = 50, -- Reaching Attack, Increased Shadow damage debuff.
			[GetSpellInfo(120669)] = 44, -- Naked and Afraid.
			[GetSpellInfo(119983)] = 43, -- Dread Spray, is also used.
			[GetSpellInfo(119414)] = 41, -- Breath of Fear, Fear+Massiv damage.
			[GetSpellInfo(75683)] = 45, -- Waterspout
			[GetSpellInfo(120629)] = 46, -- Huddle in Terror
			[GetSpellInfo(120394)] = 47, --Eternal Darkness
			[GetSpellInfo(129189)] = 48, --Sha Globe
			[GetSpellInfo(125786)] = 41, --Breath of Fear
		},

		[930] = { --5.2雷霆王座

			[GetSpellInfo(138196)] = 5,
			[GetSpellInfo(138687)] = 5,
			[GetSpellInfo(139550)] = 5,
			[GetSpellInfo(139317)] = 5,
			[GetSpellInfo(140618)] = 5,
			[GetSpellInfo(140686)] = 5,
			[GetSpellInfo(140682)] = 5,
			[GetSpellInfo(140629)] = 5,
			[GetSpellInfo(122962)] = 5,
			[GetSpellInfo(139310)] = 5,
			[GetSpellInfo(140620)] = 5,
			[GetSpellInfo(140616)] = 5,
			[GetSpellInfo(140400)] = 5,
			[GetSpellInfo(139470)] = 5,
			[GetSpellInfo(139314)] = 5,

			--Jin'rokh the Breaker
			[GetSpellInfo(138006)] = 5, --Electrified Waters
			[GetSpellInfo(137399)] = 7, --Focused Lightning fixate
			[GetSpellInfo(138732)] = 6, --Ionization
			[GetSpellInfo(138349)] = 4, --Static Wound (tank only)
			[GetSpellInfo(137371)] = 4, --Thundering Throw (tank only)

			--Horridon
			[GetSpellInfo(136769)] = 6, --Charge
			[GetSpellInfo(136767)] = 6, --Triple Puncture (tanks only)
			[GetSpellInfo(136708)] = 3, --Stone Gaze
			[GetSpellInfo(136723)] = 5, --Sand Trap
			[GetSpellInfo(136587)] = 5, --Venom Bolt Volley (dispellable)
			[GetSpellInfo(136710)] = 5, --Deadly Plague (disease)
			[GetSpellInfo(136670)] = 4, --Mortal Strike
			[GetSpellInfo(136573)] = 6, --Frozen Bolt (Debuff used by frozen orb)
			[GetSpellInfo(136512)] = 5, --Hex of Confusion
			[GetSpellInfo(136719)] = 6, --Blazing Sunlight
			[GetSpellInfo(136654)] = 4, --Rending Charge
			[GetSpellInfo(140946)] = 7, --Dire Fixation (Heroic Only)

			--Council of Elders
			[GetSpellInfo(136922)] = 6, --Frostbite
			[GetSpellInfo(137084)] = 3, --Body Heat
			[GetSpellInfo(137641)] = 6, --Soul Fragment (Heroic only)
			[GetSpellInfo(136878)] = 5, --Ensnared
			[GetSpellInfo(136857)] = 6, --Entrapped (Dispell)
			[GetSpellInfo(137650)] = 5, --Shadowed Soul
			[GetSpellInfo(137359)] = 6, --Shadowed Loa Spirit fixate target
			[GetSpellInfo(137972)] = 6, --Twisted Fate (Heroic only)
			[GetSpellInfo(136860)] = 5, --Quicksand

			--Tortos
			[GetSpellInfo(134030)] = 6, --Kick Shell
			[GetSpellInfo(134920)] = 6, --Quake Stomp
			[GetSpellInfo(136751)] = 6, --Sonic Screech
			[GetSpellInfo(136753)] = 4, --Slashing Talons (tank only)
			[GetSpellInfo(137633)] = 5, --Crystal Shell (heroic only)

			--Megaera
			[GetSpellInfo(139822)] = 6, --Cinder (Dispell)
			[GetSpellInfo(134396)] = 6, --Consuming Flames (Dispell)
			[GetSpellInfo(137731)] = 5, --Ignite Flesh
			[GetSpellInfo(136892)] = 6, --Frozen Solid
			[GetSpellInfo(139909)] = 5, --Icy Ground
			[GetSpellInfo(137746)] = 6, --Consuming Magic
			[GetSpellInfo(139843)] = 4, --Artic Freeze
			[GetSpellInfo(139840)] = 4, --Rot Armor
			[GetSpellInfo(140179)] = 6, --Suppression (stun)

			--Ji-Kun
			[GetSpellInfo(138309)] = 4, --Slimed
			[GetSpellInfo(138319)] = 5, --Feed Pool
			[GetSpellInfo(140571)] = 3, --Feed Pool
			[GetSpellInfo(134372)] = 3, --Screech

			--Durumu the Forgotten
			[GetSpellInfo(133768)] = 3, --Arterial Cut (tank only)
			[GetSpellInfo(133767)] = 3, --Serious Wound (Tank only)
			[GetSpellInfo(136932)] = 7, --Force of Will
			[GetSpellInfo(134122)] = 6, --Blue Beam
			[GetSpellInfo(134123)] = 6, --Red Beam
			[GetSpellInfo(134124)] = 6, --Yellow Beam
			[GetSpellInfo(133795)] = 4, --Life Drain
			[GetSpellInfo(133597)] = 6, --Dark Parasite
			[GetSpellInfo(133732)] = 5, --Infrared Light (the stacking red debuff)
			[GetSpellInfo(133677)] = 5, --Blue Rays (the stacking blue debuff)
			[GetSpellInfo(133738)] = 5, --Bright Light (the stacking yellow debuff)
			[GetSpellInfo(133737)] = 6, --Bright Light (The one that says you are actually in a beam)
			[GetSpellInfo(133675)] = 6, --Blue Rays (The one that says you are actually in a beam)
			[GetSpellInfo(134626)] = 6, --Lingering Gaze

			--Primordius
			[GetSpellInfo(140546)] = 6, --Fully Mutated
			[GetSpellInfo(136180)] = 3, --Keen Eyesight (Helpful)
			[GetSpellInfo(136181)] = 4, --Impared Eyesight (Harmful)
			[GetSpellInfo(136182)] = 3, --Improved Synapses (Helpful)
			[GetSpellInfo(136183)] = 4, --Dulled Synapses (Harmful)
			[GetSpellInfo(136184)] = 3, --Thick Bones (Helpful)
			[GetSpellInfo(136185)] = 4, --Fragile Bones (Harmful)
			[GetSpellInfo(136186)] = 3, --Clear Mind (Helpful)
			[GetSpellInfo(136187)] = 4, --Clouded Mind (Harmful)
			[GetSpellInfo(136050)] = 2, --Malformed Blood(Tank Only)

			--Dark Animus
			[GetSpellInfo(138569)] = 3, --Explosive Slam (tank only)
			[GetSpellInfo(138659)] = 6, --Touch of the Animus
			[GetSpellInfo(138609)] = 6, --Matter Swap
			[GetSpellInfo(138691)] = 4, --Anima Font
			[GetSpellInfo(136962)] = 5, --Anima Ring
			[GetSpellInfo(138480)] = 6, --Crimson Wake Fixate

			--Iron Qon
			[GetSpellInfo(134647)] = 6, --Scorched
			[GetSpellInfo(136193)] = 3, --Arcing Lightning
			[GetSpellInfo(135147)] = 3, --Dead Zone
			[GetSpellInfo(134691)] = 3, --Impale (tank only)
			[GetSpellInfo(135145)] = 7, --Freeze
			[GetSpellInfo(136520)] = 6, --Frozen Blood
			[GetSpellInfo(137669)] = 7, --Storm Cloud
			[GetSpellInfo(137668)] = 6, --Burning Cinders
			[GetSpellInfo(137654)] = 6, --Rushing Winds 
			[GetSpellInfo(136577)] = 5, --Wind Storm
			[GetSpellInfo(136192)] = 5, --Lightning Storm

			--Twin Consorts
			[GetSpellInfo(137440)] = 6, --Icy Shadows (tank only)
			[GetSpellInfo(137417)] = 6, --Flames of Passion
			[GetSpellInfo(138306)] = 5, --Serpent's Vitality
			[GetSpellInfo(137408)] = 3, --Fan of Flames (tank only)
			[GetSpellInfo(137360)] = 6, --Corrupted Healing (tanks and healers only?)
			[GetSpellInfo(137375)] = 4, --Beast of Nightmares
			[GetSpellInfo(136722)] = 6, --Slumber Spores

			--Lei Shen
			[GetSpellInfo(135695)] = 6, --Static Shock
			[GetSpellInfo(136295)] = 6, --Overcharged
			[GetSpellInfo(135000)] = 4, --Decapitate (Tank only)
			[GetSpellInfo(394514)] = 5, --Fusion Slash
			[GetSpellInfo(136543)] = 6, --Ball Lightning
			[GetSpellInfo(134821)] = 6, --Discharged Energy
			[GetSpellInfo(136326)] = 6, --Overcharge
			[GetSpellInfo(137176)] = 6, --Overloaded Circuits
			[GetSpellInfo(136853)] = 6, --Lightning Bolt
			[GetSpellInfo(135153)] = 6, --Crashing Thunder
			[GetSpellInfo(136914)] = 4, --Electrical Shock
			[GetSpellInfo(135001)] = 4, --Maim

			--Ra-Den (Heroic only)
			[GetSpellInfo(138308)] = 4,
			[GetSpellInfo(138372)] = 5,

		},
		[953] = { --Siege of Orgrimmar

			 --Trash
			 [GetSpellInfo(149207)] = 1, --腐蚀之触 
			 [GetSpellInfo(145553)] = 1, --贿赂 
			 [GetSpellInfo(147554)] = 1, --亚煞极之血 

			 --伊墨苏斯 
			 [GetSpellInfo(143297)] = 5, --煞能喷溅 
			 [GetSpellInfo(143459)] = 4, --煞能残渣 
			 [GetSpellInfo(143524)] = 4, --净化残渣 
			 [GetSpellInfo(143286)] = 4, --渗透煞能 
			 [GetSpellInfo(143413)] = 3, --漩涡 
			 [GetSpellInfo(143411)] = 3, --增速 
			 [GetSpellInfo(143436)] = 2, --腐蚀冲击 (坦克) 
			 [GetSpellInfo(143579)] = 3, --煞能腐蚀 (仅英雄模式) 

			 --堕落的守护者 
			 [GetSpellInfo(143239)] = 4, --致命剧毒 
			 [GetSpellInfo(143198)] = 6, --锁喉 
			 [GetSpellInfo(143301)] = 2, --凿击 
			 [GetSpellInfo(143010)] = 3, --蚀骨回旋踢 
			 [GetSpellInfo(143434)] = 6, --暗言术：蛊 (驱散) 
			 [GetSpellInfo(143840)] = 6, --苦痛印记 
			 [GetSpellInfo(143959)] = 4, --亵渎大地 
			 [GetSpellInfo(143423)] = 6, --煞能灼烧 
			 [GetSpellInfo(143292)] = 5, --锁定 
			 [GetSpellInfo(147383)] = 4, --衰竭 (Heroic Only) 

			 --诺鲁什 
			 [GetSpellInfo(146124)] = 2, --自惑 (坦克) 
			 [GetSpellInfo(146324)] = 4, --妒忌 
			 [GetSpellInfo(144850)] = 5, --信赖的试炼 
			 [GetSpellInfo(145861)] = 6, --自恋 (驱散) 
			 [GetSpellInfo(144851)] = 2, --自信的试炼 (坦克) 
			 [GetSpellInfo(146703)] = 3, --无底深渊 
			 [GetSpellInfo(144514)] = 6, --纠缠腐蚀 
			 [GetSpellInfo(144849)] = 4, --冷静的试炼 

			 --傲之煞 
			 [GetSpellInfo(144358)] = 2, --受损自尊 (坦克) 
			 [GetSpellInfo(144843)] = 3, --压制 
			 [GetSpellInfo(146594)] = 4, --泰坦之赐 
			 [GetSpellInfo(144351)] = 6, --傲慢标记 
			 [GetSpellInfo(144364)] = 4, --泰坦之力 
			 [GetSpellInfo(146822)] = 6, --投影 
			 [GetSpellInfo(146817)] = 5, --傲气光环 
			 [GetSpellInfo(144774)] = 2, --伸展打击 (坦克) 
			 [GetSpellInfo(144636)] = 5, --腐化囚笼 
			 [GetSpellInfo(144574)] = 6, --腐化囚笼，随机 
			 [GetSpellInfo(145215)] = 4, --放逐 (仅英雄模式) 
			 [GetSpellInfo(147207)] = 4, --动摇的决心 (仅英雄模式) 

			 --迦拉卡斯 
			 [GetSpellInfo(146765)] = 5, --烈焰之箭 
			 [GetSpellInfo(147705)] = 5, --毒性云雾 
			 [GetSpellInfo(147029)] = 2, -- 
			 [GetSpellInfo(146902)] = 2, --剧毒利刃 

			 --钢铁战蝎 
			 [GetSpellInfo(144467)] = 2, --燃烧护甲 
			 [GetSpellInfo(144459)] = 5, --激光灼烧 
			 [GetSpellInfo(144498)] = 5, --切割激光 
			 [GetSpellInfo(144918)] = 5, --切割激光 
			 [GetSpellInfo(146325)] = 6, --切割激光瞄准(重点监控) 

			 --库卡隆黑暗萨满 
			 [GetSpellInfo(144089)] = 6, --T剧毒之雾 
			 [GetSpellInfo(144215)] = 2, --冰霜风暴打击(坦克) 
			 [GetSpellInfo(143990)] = 2, --污水喷涌(坦克) 
			 [GetSpellInfo(144304)] = 2, --撕裂 
			 [GetSpellInfo(144330)] = 6, --钢铁囚笼(仅英雄模式) 

			 --纳兹戈林将军 
			 [GetSpellInfo(143638)] = 6, --碎骨重锤 
			 [GetSpellInfo(143480)] = 5, --刺客印记 
			 [GetSpellInfo(143431)] = 6, --魔法打击(驱散) 
			 [GetSpellInfo(143494)] = 2, --碎甲重击(坦克) 
			 [GetSpellInfo(143882)] = 5, --猎人印记 

			 --马尔考罗克 
			 [GetSpellInfo(142863)] = 5, --虚弱的上古屏障 
			 [GetSpellInfo(142864)] = 5, --上古屏障 
			 [GetSpellInfo(142865)] = 5, --强大的上古屏障 
			 [GetSpellInfo(142990)] = 2, --致命打击(坦克) 
			 [GetSpellInfo(142913)] = 6, --散逸能量 (驱散) 
			 [GetSpellInfo(143919)] = 5, --受难 (仅英雄模式) 

			 --潘达利亚战利品 
			 [GetSpellInfo(144853)] = 3, --血肉撕咬 
			 [GetSpellInfo(145987)] = 5, --设置炸弹 
			 [GetSpellInfo(145218)] = 4, --硬化血肉 
			 [GetSpellInfo(145230)] = 1, --禁忌魔法 
			 [GetSpellInfo(146217)] = 4, --投掷酒桶 
			 [GetSpellInfo(146235)] = 4, --火焰之息 
			 [GetSpellInfo(145523)] = 4, --活化打击 
			 [GetSpellInfo(142983)] = 6, --折磨 (the new Wrack) 
			 [GetSpellInfo(145715)] = 3, --疾风炸弹 
			 [GetSpellInfo(145747)] = 5, --浓缩信息素 
			 [GetSpellInfo(146289)] = 4, --严重瘫痪 

			 --嗜血的索克 
			 [GetSpellInfo(143766)] = 2, --恐慌(坦克) 
			 [GetSpellInfo(143773)] = 2, --冰冻吐息(坦克) 
			 [GetSpellInfo(143452)] = 1, --鲜血淋漓 
			 [GetSpellInfo(146589)] = 5, --万能钥匙(坦克) 
			 [GetSpellInfo(143445)] = 6, --锁定 
			 [GetSpellInfo(143791)] = 5, --腐蚀之血 
			 [GetSpellInfo(143777)] = 3, --冻结(坦克) 
			 [GetSpellInfo(143780)] = 4, --酸性吐息 
			 [GetSpellInfo(143800)] = 5, --冰冻之血 
			 [GetSpellInfo(143428)] = 4, --龙尾扫击 

			 --攻城匠师黑索 
			 [GetSpellInfo(144236)] = 4, --图像识别 
			 [GetSpellInfo(143385)] = 2, --电荷冲击(坦克) 
			 [GetSpellInfo(143856)] = 6, --过热 

			 --卡拉克西英杰 
			 [GetSpellInfo(143701)] = 5, --晕头转向 (stun) 
			 [GetSpellInfo(143702)] = 5, --晕头转向 
			 [GetSpellInfo(143572)] = 6, --紫色催化热罐燃料 
			 [GetSpellInfo(142808)] = 6, --炎界 
			 [GetSpellInfo(142931)] = 2, --血脉暴露 
			 [GetSpellInfo(143735)] = 6, --腐蚀琥珀 
			 [GetSpellInfo(146452)] = 5, --共鸣琥珀 
			 [GetSpellInfo(142929)] = 2, --脆弱打击 
			 [GetSpellInfo(142797)] = 5, --剧毒蒸汽 
			 [GetSpellInfo(143939)] = 5, --凿击 
			 [GetSpellInfo(143275)] = 2, --挥砍 
			 [GetSpellInfo(143768)] = 2, --音波发射 
			 [GetSpellInfo(143279)] = 2, --基因变异 
			 [GetSpellInfo(143339)] = 6, --注射 
			 [GetSpellInfo(142803)] = 6, --橙色催化爆炸之环 
			 [GetSpellInfo(142649)] = 4, --吞噬 
			 [GetSpellInfo(146556)] = 6, --穿刺 
			 [GetSpellInfo(142671)] = 6, --催眠术 
			 [GetSpellInfo(143979)] = 2, --恶意突袭 
			 [GetSpellInfo(142547)] = 6, --毒素：橙色 
			 [GetSpellInfo(142549)] = 6, --毒素：绿色 
			 [GetSpellInfo(142550)] = 6, --毒素：白色 
			 [GetSpellInfo(142948)] = 4, --瞄准 
			 [GetSpellInfo(148589)] = 4, --变异缺陷 
			 [GetSpellInfo(143570)] = 6, --热罐燃料准备(3S) 
			 [GetSpellInfo(142945)] = 5, --绿色催化诡异之雾 
			 [GetSpellInfo(143358)] = 4, --饥饿 
			 [GetSpellInfo(142315)] = 5, --酸性血液 

			 --加尔鲁什·地狱咆哮 
			 [GetSpellInfo(144582)] = 4, --断筋 
			 [GetSpellInfo(145183)] = 2, --绝望之握(坦克) 
			 [GetSpellInfo(144762)] = 4, --亵渎 
			 [GetSpellInfo(145071)] = 5, --亚煞极之触 
			 [GetSpellInfo(148718)] = 4, --火坑 
			 [GetSpellInfo(148983)] = 4, --勇气永春台 
			 [GetSpellInfo(147235)] = 6, --恶毒冲击 
			 [GetSpellInfo(148994)] = 4, --信念青龙寺 
			 [GetSpellInfo(149004)] = 4, --希望朱鹤寺 
			 [GetSpellInfo(147324)] = 5, --毁灭之惧 
			 [GetSpellInfo(145171)] = 5, --强化亚煞极之触(H) 
			 [GetSpellInfo(145175)] = 5, --强化亚煞极之触(N) 
			 [GetSpellInfo(145195)] = 6, --强化绝望之握 
			 [GetSpellInfo(147665)] = 5, --P4钢铁之星锁定 
			 [GetSpellInfo(144817)] = 4, --H强化亵渎 
			 [GetSpellInfo(145065)] = 5, --H亚煞极之触 
						
		},
		[995] = {--"黑石塔上层" Upper Blackrock Spire 
			 [GetSpellInfo(161288)] = 4,
			 [GetSpellInfo(155031)] = 4,
			 [GetSpellInfo(153897)] = 4,
			 [GetSpellInfo(153981)] = 4,
		},
		[969] = {--"影月墓地" Shadowmoon Burial Grounds 
			 [GetSpellInfo(162652)] = 4,
		},
		[1008] = {--"永茂林地" The Everbloom 
			 [GetSpellInfo(164294)] = 4,
			 [GetSpellInfo(168187)] = 4,
			 [GetSpellInfo(169376)] = 5,
			 [GetSpellInfo(169179)] = 4,
		},
		[993] = {--"恐轨车站" Grimrail Depot 
			 [GetSpellInfo(161089)] = 4,
			 [GetSpellInfo(160681)] = 4,
			 [GetSpellInfo(162058)] = 4,
			 [GetSpellInfo(162066)] = 4,
			 [GetSpellInfo(176147)] = 4,
		},
		[989] = {--"通天峰" Skyreach 
			 [GetSpellInfo(154149)] = 4,
			 [GetSpellInfo(153794)] = 4,
			 [GetSpellInfo(153795)] = 4,
			 [GetSpellInfo(154043)] = 4,
			 [GetSpellInfo(153757)] = 4,
			 [GetSpellInfo(152982)] = 4,
		},
		[984] = {--"奥金顿" Auchindoun 
			 [GetSpellInfo(153006)] = 4,
			 [GetSpellInfo(153477)] = 4,
			 [GetSpellInfo(154018)] = 4,
			 [GetSpellInfo(153396)] = 5,
			 [GetSpellInfo(156921)] = 5,
			 [GetSpellInfo(156842)] = 4,
			 [GetSpellInfo(156964)] = 4,
		},
		[987] = {--"钢铁码头" Iron Docks 
			 [GetSpellInfo(163390)] = 4,
			 [GetSpellInfo(162418)] = 5,
			 [GetSpellInfo(173307)] = 5,		
		},
		[964] = {--"血槌炉渣矿井" Bloodmaul Slag Mines 
			 [GetSpellInfo(149997)] = 4,
			 [GetSpellInfo(149975)] = 5,
			 [GetSpellInfo(150032)] = 5,
			 [GetSpellInfo(149941)] = 4,
			 [GetSpellInfo(150023)] = 4,
			 [GetSpellInfo(150745)] = 4,
			 [GetSpellInfo(152089)] = 4,
			 [GetSpellInfo(151415)] = 4,
			 [GetSpellInfo(151638)] = 4,
			 [GetSpellInfo(152235)] = 4,
			 [GetSpellInfo(151685)] = 4,
		},
		[988] = {--"黑石铸造厂"
			-- Gruul
			 [GetSpellInfo(155326)] = 5,
			-- Oregorger
			 [GetSpellInfo(156324)] = 4,
			-- Beastlord Darmac
			 [GetSpellInfo(155365)] = 5,
			 [GetSpellInfo(155399)] = 4,
			 [GetSpellInfo(154989)] = 4,
			 [GetSpellInfo(155499)] = 4,
			-- Flamebender Ka'graz
			 [GetSpellInfo(155277)] = 5,
			-- Hans'gar and Franzok
			 [GetSpellInfo(157139)] = 4,
			-- Operator Thogar
			 [GetSpellInfo(155921)] = 4,
			-- The Blast Furnace
			 [GetSpellInfo(155240)] = 4,
			 [GetSpellInfo(155242)] = 4,
			-- Kromog
			 [GetSpellInfo(157060)] = 4,
			-- The Iron Maidens
			 [GetSpellInfo(158315)] = 4,
			-- Blackhand
			 [GetSpellInfo(156096)] = 4,
		},
		[994] = {--"悬槌堡"
			-- Trash
			 [GetSpellInfo(175601)] = 5, -- Trash TAINTED CLAWS
			 [GetSpellInfo(175599)] = 4, -- Trash DEVOUR
			 [GetSpellInfo(172069)] = 5, -- Trash RADIATING POISON
			 [GetSpellInfo(172066)] = 4, -- Trash RADIATING POISON
		 	 [GetSpellInfo(166779)] = 5, -- Trash STAGGERING BLOW
			 [GetSpellInfo(56037)] = 4, -- Trash RUNE OF DESTRUCTION
			 [GetSpellInfo(175654)] = 5, -- Trash RUNE OF DISINTEGRATION
			 [GetSpellInfo(166185)] = 5, -- Trash RENDING SLASH
			 [GetSpellInfo(166175)] = 5, -- Trash EARTHDEVASTATING SLAM
			 [GetSpellInfo(174404)] = 5, -- Trash FROZEN CORE
			 [GetSpellInfo(173763)] = 5, -- Trash WILD FLAMES
			 [GetSpellInfo(174500)] = 5, -- Trash RENDING THROW
			 [GetSpellInfo(174939)] = 4, -- Trash Time Stop
			 [GetSpellInfo(172115)] = 4, -- Trash Earthen Thrust
			 [GetSpellInfo(166200)] = 4, -- Trash ARCANEVOLATILITY
			 [GetSpellInfo(174473)] = 5, -- Trash Corrupted Blood
			-- Kargath Bladefist
			 [GetSpellInfo(159113)] = 5,
			 [GetSpellInfo(159178)] = 6,
			 [GetSpellInfo(159213)] = 7, --MONSTERS BRAWL
			 [GetSpellInfo(158986)] = 4, --BERSERKER RUSH
			 [GetSpellInfo(159410)] = 5, --MAULING BREW
			 [GetSpellInfo(160521)] = 6, --VILE BREATH
			 [GetSpellInfo(159386)] = 5, --IRON BOMB
			 [GetSpellInfo(159188)] = 5, --GRAPPLE
			 [GetSpellInfo(162497)] = 4, --ON THE HUNT
			 [GetSpellInfo(159202)] = 5, --FLAME JET
			-- The Butcher
			 [GetSpellInfo(156152)] = 5,
			 [GetSpellInfo(156143)] = 4,
			 [GetSpellInfo(156151)] = 6,	
			 [GetSpellInfo(163046)] = 4,		 
			-- Tectus
			 [GetSpellInfo(162346)] = 5, --CRYSTALLINE BARRAGE
			 [GetSpellInfo(162892)] = 5, --PETRIFICATION
			 [GetSpellInfo(162475)] = 5, --Tectonic Upheaval
			-- Brackenspore
			 [GetSpellInfo(163242)] = 5, --INFESTING SPORES
			 [GetSpellInfo(163590)] = 5, --CREEPING MOSS
			 [GetSpellInfo(163241)] = 5, --ROT
			 [GetSpellInfo(159220)] = 6, --NECROTIC BREATH
			 [GetSpellInfo(160179)] = 6, --MIND FUNGUS
			 [GetSpellInfo(159972)] = 6, --FLESHEATER
			-- Twin Ogron
			 [GetSpellInfo(158026)] = 6, --ENFEEBLING ROAR
			 [GetSpellInfo(158241)] = 5, --BLAZE
			 [GetSpellInfo(155569)] = 5, --INJURED
			 [GetSpellInfo(167200)] = 5, --ARCANE WOUND
			 [GetSpellInfo(159709)] = 6, --WEAKENED DEFENSES 159709 167179
			 [GetSpellInfo(163374)] = 4, --ARCANE VOLATILITY
			 [GetSpellInfo(158200)] = 4, --QUAKE
			-- Ko'ragh
			 [GetSpellInfo(161242)] = 4, --CAUSTIC ENERGY
			 [GetSpellInfo(161358)] = 4, --SUPPRESSION FIELD
			 [GetSpellInfo(162184)] = 6, --EXPEL MAGIC SHADOW
			 [GetSpellInfo(162186)] = 6, --EXPEL MAGIC ARCANE
			 [GetSpellInfo(161411)] = 6, --EXPEL MAGIC FROST
			 [GetSpellInfo(163472)] = 4, --DOMINATING POWER
			 [GetSpellInfo(162185)] = 7, --EXPEL MAGIC FEL
			-- Imperator Mar'gok
			 [GetSpellInfo(156238)] = 4, --BRANDED  156238 163990 163989 163988
			 [GetSpellInfo(156467)] = 5, --DESTRUCTIVE RESONANCE  156467 164075 164076 164077
			 [GetSpellInfo(158605)] = 4, --MARK OF CHAOS  158605 164176 164178 164191
			 [GetSpellInfo(164004)] = 4, --BRANDED DISPLACEMENT
			 [GetSpellInfo(164075)] = 4, --DESTRUCTIVE RESONANCE DISPLACEMENT
			 [GetSpellInfo(164176)] = 4, --MARK OF CHAOS DISPLACEMENT
			 [GetSpellInfo(164005)] = 4, --BRANDED FORTIFICATION
			 [GetSpellInfo(164076)] = 4, --DESTRUCTIVE RESONANCE FORTIFICATION
			 [GetSpellInfo(164178)] = 4, --MARK OF CHAOS FORTIFICATION
			 [GetSpellInfo(164006)] = 4, --BRANDED REPLICATION
			 [GetSpellInfo(164077)] = 4, --DESTRUCTIVE RESONANCE REPLICATION
			 [GetSpellInfo(164191)] = 4, --MARK OF CHAOS REPLICATION
			 [GetSpellInfo(157349)] = 5, --FORCE NOVA  157349 164232 164235 164240
			 [GetSpellInfo(157763)] = 4, --FIXATE
			 [GetSpellInfo(158553)] = 6, --CRUSH ARMOR
			 [GetSpellInfo(165102)] = 7, --Infinite Darkness
			 [GetSpellInfo(157801)] = 7, --Slow
		},		
		[998] = {--"黑石铸造厂"
			-- Blackrock Foundry
			-- Trash
			 [GetSpellInfo(175752)] = 5,
			 [GetSpellInfo(175765)] = 6,
			 [GetSpellInfo(175624)] = 7,
			 [GetSpellInfo(175643)] = 6,
			 [GetSpellInfo(175603)] = 6,
			 [GetSpellInfo(175668)] = 5,
			 [GetSpellInfo(175987)] = 5,
			 [GetSpellInfo(159686)] = 6,
			 [GetSpellInfo(159632)] = 7,
			 [GetSpellInfo(159520)] = 4,
			 [GetSpellInfo(159939)] = 5,
			 [GetSpellInfo(160260)] = 6,
			 [GetSpellInfo(160109)] = 4,
			 [GetSpellInfo(162516)] = 6,
			 [GetSpellInfo(162508)] = 4,
			 [GetSpellInfo(162748)] = 4,
			 [GetSpellInfo(162757)] = 4,
			 [GetSpellInfo(162663)] = 6,
			 [GetSpellInfo(162672)] = 6,
			 [GetSpellInfo(188189)] = 8,
			 [GetSpellInfo(163126)] = 8,
			 [GetSpellInfo(177855)] = 6,
			 [GetSpellInfo(177891)] = 4,
			 [GetSpellInfo(174773)] = 8,
			 [GetSpellInfo(156345)] = 8,
			 [GetSpellInfo(171537)] = 6,
			 [GetSpellInfo(175577)] = 6,
			 [GetSpellInfo(175583)] = 7,
			 [GetSpellInfo(174704)] = 4,
   			 [GetSpellInfo(163714)] = 4,
			-- Oregorger
			 [GetSpellInfo(173471)] = 5,
			 [GetSpellInfo(156297)] = 6,
			 [GetSpellInfo(156374)] = 2,
			 [GetSpellInfo(155900)] = 2,
			 [GetSpellInfo(156203)] = 5,
			-- Hans'gar and Franzok 
			 [GetSpellInfo(157853)] = 2,
			 [GetSpellInfo(156938)] = 6,
			 [GetSpellInfo(157139)] = 6,
			 [GetSpellInfo(161570)] = 5,
			 [GetSpellInfo(155818)] = 5,
			-- Beastlord Darmac 
			 [GetSpellInfo(154960)] = 6,
			 [GetSpellInfo(155061)] = 4,
			 [GetSpellInfo(154989)] = 5,
			 [GetSpellInfo(154981)] = 6,
			 [GetSpellInfo(155030)] = 4,
			 [GetSpellInfo(155236)] = 4,
			 [GetSpellInfo(155499)] = 5,
			 [GetSpellInfo(155657)] = 6,
			 [GetSpellInfo(159044)] = 2,
			 [GetSpellInfo(162276)] = 1,
			-- Gruul
			 [GetSpellInfo(155080)] = 3,
			 [GetSpellInfo(162322)] = 2,
			 [GetSpellInfo(155078)] = 4,
			 [GetSpellInfo(173192)] = 6,
			 [GetSpellInfo(155323)] = 5,
			 [GetSpellInfo(155330)] = 5,
			 [GetSpellInfo(155506)] = 5,
			 [GetSpellInfo(165298)] = 4,
			-- Flamebender Ka'graz 
			 [GetSpellInfo(155277)] = 5,
			 [GetSpellInfo(163284)] = 4,
			 [GetSpellInfo(154932)] = 6,
			 [GetSpellInfo(155314)] = 3,
			 [GetSpellInfo(154952)] = 5,
			 [GetSpellInfo(155074)] = 3,
			 [GetSpellInfo(155049)] = 4,
			-- Operator Thogar
			 [GetSpellInfo(155921)] = 3,
			 [GetSpellInfo(165195)] = 6,
			 [GetSpellInfo(164380)] = 5,
			 [GetSpellInfo(155701)] = 2,
			 [GetSpellInfo(156310)] = 4,
			 [GetSpellInfo(159481)] = 6,
			-- The Blast Furnace
			 [GetSpellInfo(155240)] = 3,
			 [GetSpellInfo(155242)] = 4,
			 [GetSpellInfo(155225)] = 5,
			 [GetSpellInfo(155192)] = 5,
			 [GetSpellInfo(156934)] = 6,
			 [GetSpellInfo(158246)] = 1,
			 [GetSpellInfo(176121)] = 4,
			 [GetSpellInfo(155196)] = 4,
			 [GetSpellInfo(155743)] = 6,
			 [GetSpellInfo(175104)] = 6,
			-- Kromog
			 [GetSpellInfo(157059)] = 2,
			 [GetSpellInfo(156766)] = 4,
			 [GetSpellInfo(161839)] = 3,
			 [GetSpellInfo(156844)] = 6,
			-- The Iron Maidens
			 [GetSpellInfo(164271)] = 6,
			 [GetSpellInfo(156631)] = 4,
			 [GetSpellInfo(158315)] = 5,
			 [GetSpellInfo(170395)] = 2,
			 [GetSpellInfo(159724)] = 6,
			 [GetSpellInfo(170405)] = 2,
			 [GetSpellInfo(158010)] = 5,
			 [GetSpellInfo(158692)] = 1,
			 [GetSpellInfo(158702)] = 5,
			 [GetSpellInfo(158686)] = 3,
			 [GetSpellInfo(158683)] = 6,
			 [GetSpellInfo(156214)] = 5,
			 [GetSpellInfo(158601)] = 3,
			 [GetSpellInfo(160436)] = 1,
			-- Blackhand
			 [GetSpellInfo(156096)] = 6,
			 [GetSpellInfo(156743)] = 4,
			 [GetSpellInfo(156047)] = 2,
			 [GetSpellInfo(156401)] = 4,
			 [GetSpellInfo(156404)] = 3,
			 [GetSpellInfo(158054)] = 5,
			 [GetSpellInfo(157354)] = 2,
			 [GetSpellInfo(156888)] = 1,
			 [GetSpellInfo(157000)] = 5,
			 [GetSpellInfo(156999)] = 5,
			 [GetSpellInfo(156653)] = 6,
			 [GetSpellInfo(162490)] = 5,
			 [GetSpellInfo(156604)] = 3,
			 [GetSpellInfo(156772)] = 3,
			 [GetSpellInfo(162498)] = 6,
		},
		[1026] = {--"地狱火堡垒"
			-- Hellfire Citadel
			-- Trash
			 [GetSpellInfo(185806)] = 5,
			 [GetSpellInfo(187459)] = 4,
			 [GetSpellInfo(190735)] = 6,
			 [GetSpellInfo(188087)] = 6,
			 [GetSpellInfo(188216)] = 5,
			 [GetSpellInfo(188148)] = 1,
			 [GetSpellInfo(188189)] = 4,
			 [GetSpellInfo(187122)] = 5,
			 [GetSpellInfo(188482)] = 3,
			 [GetSpellInfo(188484)] = 1,
			 [GetSpellInfo(188541)] = 1,
			 [GetSpellInfo(188541)] = 6,
			 [GetSpellInfo(187099)] = 5,
			 [GetSpellInfo(187110)] = 6,
			 [GetSpellInfo(188474)] = 6,
			 [GetSpellInfo(188282)] = 1,
			 [GetSpellInfo(188287)] = 2,
			 [GetSpellInfo(188283)] = 2,
			 [GetSpellInfo(188104)] = 6,
			 [GetSpellInfo(188476)] = 4,
			 [GetSpellInfo(188448)] = 2,
			 [GetSpellInfo(188510)] = 5,
			 [GetSpellInfo(182644)] = 6,
			 [GetSpellInfo(184587)] = 5,
			 [GetSpellInfo(184300)] = 2,
			 [GetSpellInfo(184102)] = 2,
			 [GetSpellInfo(186046)] = 5,
			 [GetSpellInfo(186197)] = 5,
			 [GetSpellInfo(186384)] = 2,
			 [GetSpellInfo(184388)] = 2,
			 [GetSpellInfo(190043)] = 2,
			 [GetSpellInfo(190044)] = 6,
			 [GetSpellInfo(190012)] = 1,
			 [GetSpellInfo(189556)] = 4,
			 [GetSpellInfo(189551)] = 5,
			 [GetSpellInfo(189554)] = 6,
			 [GetSpellInfo(189539)] = 1,
			 [GetSpellInfo(189596)] = 3,
			 [GetSpellInfo(189564)] = 5,
			 [GetSpellInfo(189560)] = 2,
			 [GetSpellInfo(189533)] = 4,
			 [GetSpellInfo(189532)] = 5,
			 [GetSpellInfo(189531)] = 2,
			 [GetSpellInfo(184734)] = 5,
			 [GetSpellInfo(181962)] = 1,
			 [GetSpellInfo(184725)] = 4,
			 [GetSpellInfo(184730)] = 3,
			 [GetSpellInfo(184721)] = 1,
			 [GetSpellInfo(184621)] = 1,
			 [GetSpellInfo(189470)] = 3,
			 [GetSpellInfo(189488)] = 1,
			 [GetSpellInfo(189504)] = 1,
			 [GetSpellInfo(189512)] = 4,
			 [GetSpellInfo(189538)] = 1,
			 [GetSpellInfo(189550)] = 5,
			 [GetSpellInfo(189544)] = 1,

			-- Hellfire Assault
			 [GetSpellInfo(184369)] = 6,
			 [GetSpellInfo(184243)] = 4,
			 [GetSpellInfo(184238)] = 1,
			 [GetSpellInfo(180022)] = 2,
			 [GetSpellInfo(185157)] = 6,
			 [GetSpellInfo(180079)] = 6,

			-- Iron Reaver
			 [GetSpellInfo(182280)] = 6,
			 [GetSpellInfo(185242)] = 5,
			 [GetSpellInfo(182003)] = 1,
			 [GetSpellInfo(182074)] = 3,
			 [GetSpellInfo(182001)] = 4,
			 [GetSpellInfo(185978)] = 2,

			-- Kormrok
			 [GetSpellInfo(181306)] = 6,
			 [GetSpellInfo(181321)] = 1,
			 [GetSpellInfo(188081)] = 2,
			 [GetSpellInfo(181345)] = 5,
			 [GetSpellInfo(186559)] = 6,
			 [GetSpellInfo(185519)] = 2,
			 [GetSpellInfo(181082)] = 6,
			 [GetSpellInfo(180270)] = 2,
			 [GetSpellInfo(186560)] = 6,
			 [GetSpellInfo(185521)] = 2,

			-- Hellfire High Council
			 [GetSpellInfo(184450)] = 5,
			 [GetSpellInfo(184652)] = 6,
			 [GetSpellInfo(184847)] = 4,
			 [GetSpellInfo(184358)] = 5,
			 [GetSpellInfo(184357)] = 1,
			 [GetSpellInfo(184355)] = 4,

			-- Kilrogg Deadeye
			 [GetSpellInfo(188929)] = 6,
			 [GetSpellInfo(188852)] = 5,
			 [GetSpellInfo(182159)] = 2,
			 [GetSpellInfo(180200)] = 4,
			 [GetSpellInfo(181488)] = 3,
			 [GetSpellInfo(185563)] = 1,
			 [GetSpellInfo(180718)] = 1,
			 [GetSpellInfo(187089)] = 1,
			 [GetSpellInfo(189612)] = 3,
			 [GetSpellInfo(180575)] = 5,
			 [GetSpellInfo(180033)] = 3,
			 [GetSpellInfo(184067)] = 5,

			-- Gorefiend
			 [GetSpellInfo(179864)] = 5,
			 [GetSpellInfo(181295)] = 3,
			 [GetSpellInfo(179867)] = 2,
			 [GetSpellInfo(179978)] = 6,
			 [GetSpellInfo(179995)] = 5,
			 [GetSpellInfo(179909)] = 6,
			 [GetSpellInfo(182601)] = 5,
			 [GetSpellInfo(185189)] = 5,
			 [GetSpellInfo(180148)] = 6,
			 [GetSpellInfo(180093)] = 1,
			 [GetSpellInfo(186770)] = 5,

			-- Shadow-Lord Iskar
			 [GetSpellInfo(179202)] = 5,
			 [GetSpellInfo(185239)] = 6,
			 [GetSpellInfo(181957)] = 5,
			 [GetSpellInfo(182325)] = 2,
			 [GetSpellInfo(182200)] = 3,
			 [GetSpellInfo(185747)] = 3,
			 [GetSpellInfo(182600)] = 2,
			 [GetSpellInfo(179219)] = 4,
			 [GetSpellInfo(181753)] = 7,
			 [GetSpellInfo(187990)] = 4,
			 [GetSpellInfo(187344)] = 1,
			 [GetSpellInfo(185510)] = 2,

			-- Socrethar the Eternal
			 [GetSpellInfo(182038)] = 3,
			 [GetSpellInfo(189627)] = 5,
			 [GetSpellInfo(189540)] = 2,
			 [GetSpellInfo(182218)] = 5,
			 [GetSpellInfo(180415)] = 1,
			 [GetSpellInfo(182769)] = 6,
			 [GetSpellInfo(182900)] = 4,
			 [GetSpellInfo(184124)] = 3,
			 [GetSpellInfo(184239)] = 4,
			 [GetSpellInfo(190922)] = 2,

			-- Fel Lord Zakuun
			 [GetSpellInfo(181508)] = 6,
			 [GetSpellInfo(179428)] = 5,
			 [GetSpellInfo(182008)] = 2,
			 [GetSpellInfo(189260)] = 3,
			 [GetSpellInfo(179407)] = 1,
			 [GetSpellInfo(189030)] = 6,
			 [GetSpellInfo(181653)] = 5,
			 [GetSpellInfo(188998)] = 2,

			-- Xhul'horac
			 [GetSpellInfo(186134)] = 2,
			 [GetSpellInfo(186135)] = 2,
			 [GetSpellInfo(186407)] = 7,
			 [GetSpellInfo(186333)] = 7,
			 [GetSpellInfo(185656)] = 1,
			 [GetSpellInfo(186500)] = 6,
			 [GetSpellInfo(186448)] = 4,
			 [GetSpellInfo(188208)] = 3,
			 [GetSpellInfo(186547)] = 5,
			 [GetSpellInfo(186785)] = 4,
			 [GetSpellInfo(186073)] = 3,
			 [GetSpellInfo(186063)] = 3,

			-- Tyrant Velhari
			 [GetSpellInfo(180166)] = 5,
			 [GetSpellInfo(180128)] = 6,
			 [GetSpellInfo(180526)] = 6,
			 [GetSpellInfo(180000)] = 4,
			 [GetSpellInfo(181683)] = 1,
			 [GetSpellInfo(179987)] = 1,
			 [GetSpellInfo(179993)] = 1,
			 [GetSpellInfo(180604)] = 3,

			-- Mannoroth
			 [GetSpellInfo(181099)] = 6,
			 [GetSpellInfo(181275)] = 3,
			 [GetSpellInfo(181119)] = 4,
			 [GetSpellInfo(182171)] = 2,
			 [GetSpellInfo(181359)] = 5,
			 [GetSpellInfo(184252)] = 3,
			 [GetSpellInfo(181597)] = 4,
			 [GetSpellInfo(181841)] = 6,
			 [GetSpellInfo(182113)] = 1,
			 [GetSpellInfo(182088)] = 6,
			 [GetSpellInfo(182006)] = 4,
			 [GetSpellInfo(182031)] = 3,
			 [GetSpellInfo(186362)] = 6,
			 [GetSpellInfo(190482)] = 2,

			-- Archimonde
			 [GetSpellInfo(183634)] = 6,
			 [GetSpellInfo(183828)] = 4,
			 [GetSpellInfo(183963)] = 1,
			 [GetSpellInfo(182879)] = 6,
			 [GetSpellInfo(182878)] = 2,
			 [GetSpellInfo(183864)] = 3,
			 [GetSpellInfo(184964)] = 6,
			 [GetSpellInfo(186123)] = 5,
			 [GetSpellInfo(185014)] = 5,
			 [GetSpellInfo(186961)] = 6,
			 [GetSpellInfo(189891)] = 3,
			 [GetSpellInfo(187047)] = 2,
			 [GetSpellInfo(190341)] = 2,
			 [GetSpellInfo(187255)] = 3,
			 [GetSpellInfo(189895)] = 5,
			 [GetSpellInfo(190400)] = 3,
			 [GetSpellInfo(187050)] = 6,
			 [GetSpellInfo(190706)] = 2,
		},
		[1041] = {--"英灵殿"
			-- Halls of Valor
			 [GetSpellInfo(199050)] = 4,
			 [GetSpellInfo(198944)] = 4,
			 [GetSpellInfo(215429)] = 4,
			 [GetSpellInfo(197556)] = 4,
			 [GetSpellInfo(196497)] = 4,
			 [GetSpellInfo(199818)] = 4,
			 [GetSpellInfo(193686)] = 4,
			 [GetSpellInfo(196838)] = 6,
			 [GetSpellInfo(193092)] = 4,
			 [GetSpellInfo(199652)] = 4,	 
		},
		[1042] = {--"噬魂之喉"
			-- Maw of Souls
			 [GetSpellInfo(198944)] = 4,
			 [GetSpellInfo(199185)] = 4,
			 [GetSpellInfo(194674)] = 4,
			 [GetSpellInfo(195279)] = 4,
			 [GetSpellInfo(198944)] = 4,
			 [GetSpellInfo(115804)] = 4,
			 [GetSpellInfo(194049)] = 4,
			 [GetSpellInfo(194327)] = 4,
			 [GetSpellInfo(195293)] = 4,
			 [GetSpellInfo(185539)] = 4,
			 [GetSpellInfo(197262)] = 6,
			 [GetSpellInfo(198405)] = 5,
			 [GetSpellInfo(194102)] = 4,
			 [GetSpellInfo(200208)] = 4,
		},
		[1066] = {--"紫罗兰堡"
			-- Violet Hold
			 [GetSpellInfo(205513)] = 4,
			 [GetSpellInfo(202779)] = 4,
			 [GetSpellInfo(202217)] = 4,
			 [GetSpellInfo(202300)] = 4,
			 [GetSpellInfo(224453)] = 4,
			 [GetSpellInfo(202306)] = 4,
			 [GetSpellInfo(205096)] = 4,
			 [GetSpellInfo(204895)] = 4,
			 [GetSpellInfo(201380)] = 4,
			 [GetSpellInfo(224602)] = 4,
			 [GetSpellInfo(204962)] = 4,
			 [GetSpellInfo(210879)] = 4,
		},
		[1046] = {--"艾萨拉之眼"
			-- Eye of Azshara
			 [GetSpellInfo(195105)] = 4,
			 [GetSpellInfo(195094)] = 4,
			 [GetSpellInfo(193636)] = 4,
			 [GetSpellInfo(196111)] = 4,
			 [GetSpellInfo(195561)] = 5,--盲目啄击
			 [GetSpellInfo(191855)] = 4,
			 [GetSpellInfo(195473)] = 4,
			 [GetSpellInfo(196064)] = 4,
			 [GetSpellInfo(195944)] = 4,
			 [GetSpellInfo(196515)] = 4,
			 [GetSpellInfo(197144)] = 4,
			 [GetSpellInfo(195473)] = 4,
			 [GetSpellInfo(200037)] = 4,
			 [GetSpellInfo(197105)] = 4,
			 [GetSpellInfo(192053)] = 4,
			 [GetSpellInfo(196058)] = 4,

			 [GetSpellInfo(215721)] = 4,
			 [GetSpellInfo(215712)] = 4,
			 [GetSpellInfo(196060)] = 4,
		},
		[1081] = {--"黑鸦堡垒"
			-- Black Rook Hold
			 [GetSpellInfo(200084)] = 4,
			 [GetSpellInfo(194966)] = 4,
			 [GetSpellInfo(225909)] = 4,
			 [GetSpellInfo(200261)] = 4,
			 [GetSpellInfo(221132)] = 4,
			 [GetSpellInfo(197429)] = 4,
			 [GetSpellInfo(198245)] = 4,
			 [GetSpellInfo(198635)] = 4,
			 [GetSpellInfo(214002)] = 4,
			 [GetSpellInfo(197546)] = 4,
			 [GetSpellInfo(221680)] = 4,
			 [GetSpellInfo(224188)] = 4,
		},
		[1087] = {--"群星庭院"
			-- Court of Stars
			 [GetSpellInfo(211464)] = 4,
			 [GetSpellInfo(269024)] = 4,
			 [GetSpellInfo(211473)] = 4,
			 [GetSpellInfo(211391)] = 4,
		},
		[1065] = {--"耐萨里奥的巢穴"
			-- Neltharion's Lair
			-- [GetSpellInfo(226296)] = 4,
			-- [GetSpellInfo(193585)] = 4,
		},
		[1079] = {--"魔法回廊"
			-- The Arcway
			 [GetSpellInfo(226296)] = 4,
			 [GetSpellInfo(210645)] = 4,
			 [GetSpellInfo(211000)] = 4,
			 [GetSpellInfo(211007)] = 4,
			 [GetSpellInfo(211064)] = 3,
			 [GetSpellInfo(194006)] = 3,
			 [GetSpellInfo(193938)] = 4,
			 [GetSpellInfo(202156)] = 4,
			 [GetSpellInfo(211745)] = 3,
			 [GetSpellInfo(211543)] = 4,
			 [GetSpellInfo(210750)] = 3,
		},
		[1067] = {--"黑心林地"
			-- Darkheart Thicket
			 [GetSpellInfo(198477)] = 4,
			 [GetSpellInfo(200642)] = 4,
			 [GetSpellInfo(250980)] = 4,
			 [GetSpellInfo(198408)] = 4,
			 [GetSpellInfo(198904)] = 4,
			 [GetSpellInfo(204667)] = 4,
			 [GetSpellInfo(191326)] = 4,
			 [GetSpellInfo(200289)] = 4,
			 [GetSpellInfo(200243)] = 4,
			 [GetSpellInfo(220855)] = 7,
			 [GetSpellInfo(204968)] = 4,
			 [GetSpellInfo(200631)] = 4,
			 [GetSpellInfo(200684)] = 4,
			 [GetSpellInfo(200182)] = 3,
		},
		[1045] = {--"守望者地窟"
			-- Vault of the Wardens
			 [GetSpellInfo(194588)] = 4,
			 [GetSpellInfo(193607)] = 4,
			 [GetSpellInfo(191743)] = 4,
			 [GetSpellInfo(210202)] = 4,
			 [GetSpellInfo(206603)] = 4,
			 [GetSpellInfo(196242)] = 4,
			 [GetSpellInfo(202608)] = 4,
			 [GetSpellInfo(193969)] = 4,
			 [GetSpellInfo(193956)] = 7,
			 [GetSpellInfo(193997)] = 7,
		},
		[1007] = {--"破碎群岛"
			-- Broken Isles
			-- Ana-Mouz
			 [GetSpellInfo(219045)] = 4,
			 [GetSpellInfo(218823)] = 5,

			-- Calamir
			 [GetSpellInfo(218888)] = 5,
			 [GetSpellInfo(217925)] = 5,
			 [GetSpellInfo(217966)] = 5,
			 [GetSpellInfo(218012)] = 5,

			-- Drugon the Frostblood
			 [GetSpellInfo(219602)] = 5,
			 [GetSpellInfo(219812)] = 5,
			 [GetSpellInfo(219610)] = 4,

			-- Flotsam
			 [GetSpellInfo(223373)] = 5,
			 [GetSpellInfo(223355)] = 5,

			-- Humongris
			 [GetSpellInfo(216430)] = 5,
			 [GetSpellInfo(216467)] = 5,
			 [GetSpellInfo(216822)] = 5,

			-- Levantus
			 [GetSpellInfo(170196)] = 5,
			 [GetSpellInfo(217362)] = 5,
			 [GetSpellInfo(217362)] = 5,

			-- Na'zak the Fiend
			 [GetSpellInfo(219349)] = 5,
			 [GetSpellInfo(219861)] = 5,

			-- Nithogg
			 [GetSpellInfo(212867)] = 5,
			 [GetSpellInfo(212852)] = 5,

			-- Shar'thos
			 [GetSpellInfo(215876)] = 5,
			 [GetSpellInfo(216044)] = 5,

			-- The Soultakers

			-- Reaver Jdorn
			 [GetSpellInfo(213665)] = 5,

			-- Withered J'im

		},
		[1094] = {--"翡翠梦魇"
			-- The Emerald Nightmare

			-- Nythendra
			 [GetSpellInfo(204504)] = 2,
			 [GetSpellInfo(203045)] = 5,
			 [GetSpellInfo(203096)] = 6,
			 [GetSpellInfo(204463)] = 6,
			 [GetSpellInfo(203646)] = 5,

			-- Il'gynoth, Heart of Corruption
			 [GetSpellInfo(212886)] = 4,
			 [GetSpellInfo(215845)] = 1,
			 [GetSpellInfo(210099)] = 7,
			 [GetSpellInfo(209469)] = 8,
			 [GetSpellInfo(209471)] = 1,
			 [GetSpellInfo(210984)] = 3,
			 [GetSpellInfo(208697)] = 2,
			 [GetSpellInfo(208929)] = 5,
			 [GetSpellInfo(215128)] = 5,

			-- Elerethe Renferal
			 [GetSpellInfo(215307)] = 6,
			 [GetSpellInfo(215460)] = 5,
			 [GetSpellInfo(213124)] = 4,
			 [GetSpellInfo(210850)] = 3,
			 [GetSpellInfo(215582)] = 3,
			 [GetSpellInfo(218519)] = 1,
			 [GetSpellInfo(210228)] = 2,

			-- Ursoc
			 [GetSpellInfo(197943)] = 5,
			 [GetSpellInfo(204859)] = 3,
			 [GetSpellInfo(198006)] = 7,
			 [GetSpellInfo(198108)] = 1,
			 [GetSpellInfo(197980)] = 2,
			 [GetSpellInfo(205611)] = 4,

			-- Dragons of Nightmare
			 [GetSpellInfo(203110)] = 3,
			 [GetSpellInfo(203102)] = 2,
			 [GetSpellInfo(207681)] = 4,
			 [GetSpellInfo(204731)] = 1,
			 [GetSpellInfo(203770)] = 8,
			 [GetSpellInfo(203125)] = 2,
			 [GetSpellInfo(203787)] = 5,
			 [GetSpellInfo(203086)] = 2,
			 [GetSpellInfo(204044)] = 4,
			 [GetSpellInfo(203121)] = 2,
			 [GetSpellInfo(205341)] = 6,
			 [GetSpellInfo(204078)] = 2,
			 [GetSpellInfo(214543)] = 1,

			-- Cenarius
			 [GetSpellInfo(212681)] = 1,
			 [GetSpellInfo(210279)] = 2,
			 [GetSpellInfo(210315)] = 8,
			 [GetSpellInfo(213162)] = 5,
			 [GetSpellInfo(226821)] = 4,
			 [GetSpellInfo(211507)] = 6,
			 [GetSpellInfo(211471)] = 5,
			 [GetSpellInfo(216516)] = 1,
			 [GetSpellInfo(211989)] = 5,
			 [GetSpellInfo(211990)] = 1,
			 [GetSpellInfo(214529)] = 5,

			-- Xavius
			 [GetSpellInfo(206005)] = 1,
			 [GetSpellInfo(206109)] = 2,
			 [GetSpellInfo(208431)] = 3,
			 [GetSpellInfo(207409)] = 6,
			 [GetSpellInfo(206651)] = 8,
			 [GetSpellInfo(211802)] = 7,
			 [GetSpellInfo(205771)] = 7,
			 [GetSpellInfo(209158)] = 8,
			 [GetSpellInfo(205612)] = 2,
			 [GetSpellInfo(210451)] = 6,
			 [GetSpellInfo(208385)] = 4,
			 [GetSpellInfo(211634)] = 4,
		},
		[1088] = {--"暗夜要塞"
			-- The Nighthold

			-- Skorpyron
			 [GetSpellInfo(204766)] = 5,
			 [GetSpellInfo(214657)] = 5,
			 [GetSpellInfo(214662)] = 5,
			 [GetSpellInfo(211659)] = 5,
			 [GetSpellInfo(204471)] = 5,

			-- Chronomatic Anomaly
			 [GetSpellInfo(206607)] = 5,
			 [GetSpellInfo(206609)] = 5,
			 [GetSpellInfo(212099)] = 5,

			-- Trilliax
			 [GetSpellInfo(206482)] = 5,
			 [GetSpellInfo(206788)] = 5,

			-- Spellblade Aluriel
			 [GetSpellInfo(212492)] = 5,
			 [GetSpellInfo(212587)] = 5,
			 [GetSpellInfo(213083)] = 5,

			-- Tichondrius
			 [GetSpellInfo(206480)] = 5,
			 [GetSpellInfo(213238)] = 5,
			 [GetSpellInfo(212795)] = 5,
			 [GetSpellInfo(208230)] = 5,
			 [GetSpellInfo(216024)] = 5,
			 [GetSpellInfo(216040)] = 5,

			-- Krosus
			 [GetSpellInfo(208203)] = 5,

			-- High Botanist Tel'arn
			 [GetSpellInfo(218502)] = 5,
			 [GetSpellInfo(219049)] = 5,
			 [GetSpellInfo(218424)] = 5,

			-- Star Augur Etraeus
			 [GetSpellInfo(206585)] = 5,
			 [GetSpellInfo(206936)] = 5,
			 [GetSpellInfo(206388)] = 5,
			 [GetSpellInfo(205649)] = 5,
			 [GetSpellInfo(206965)] = 5,
			 [GetSpellInfo(207143)] = 5,

			-- Grand Magistrix Elisande
			 [GetSpellInfo(211261)] = 5, --透心折磨
			 [GetSpellInfo(209598)] = 5, --聚合爆破

			-- Gul'dan
			 [GetSpellInfo(212568)] = 5,
			 [GetSpellInfo(206883)] = 5,
			 [GetSpellInfo(206222)] = 5,
			 [GetSpellInfo(206221)] = 5,
			 [GetSpellInfo(208672)] = 5,
			 [GetSpellInfo(208903)] = 5,
			 [GetSpellInfo(208802)] = 5,
		},
	},
	second = {			
		[824] = {-- "Dragon Soul"
			-- Hagara the Stormbinder
			[GetSpellInfo(110317)] =  1, --水壕
			},
		[1041] ={-- "英灵殿"
			-- Halls of Valor
			[GetSpellInfo(203963)] =  1, --风暴之眼
			[GetSpellInfo(193743)] =  1, --阿格拉玛之盾 
			},
	},	
}

