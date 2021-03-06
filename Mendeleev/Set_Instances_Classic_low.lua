	local BB = LibStub("LibBabble-Boss-3.0"):GetLookupTable()
	local BZ = LibStub("LibBabble-Zone-3.0"):GetLookupTable()
	local L = LibStub("AceLocale-3.0"):GetLocale("Mendeleev")
	
	local showDropRate = function (v)
		v = tonumber(v)
		return v and (" (%.1f%%)"):format(v / 10) or ""
	end

	table.insert(MENDELEEV_SETS, {
		name = BZ["Ragefire Chasm"],
		setindex = "InstanceLoot.Ragefire Chasm",
		colour = "|cffB0C4DE",
		header = BZ["Ragefire Chasm"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.Ragefire Chasm.Bazzalan"] = BB["Bazzalan"],
			["InstanceLoot.Ragefire Chasm.Oggleflint"] = BB["Oggleflint"],
			["InstanceLoot.Ragefire Chasm.Jergosh the Invoker"] = BB["Jergosh the Invoker"],
			["InstanceLoot.Ragefire Chasm.Taragaman the Hungerer"] = BB["Taragaman the Hungerer"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["The Deadmines"],
		setindex = "InstanceLoot.The Deadmines",
		colour = "|cffB0C4DE",
		header = BZ["The Deadmines"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.The Deadmines.Glubtok"] = BB["Glubtok"],
			["InstanceLoot.The Deadmines.Helix Gearbreaker"] = BB["Helix Gearbreaker"],
			["InstanceLoot.The Deadmines.Foe Reaper 5000"] = BB["Foe Reaper 5000"],
			["InstanceLoot.The Deadmines.Admiral Ripsnarl"] = BB["Admiral Ripsnarl"],
			["InstanceLoot.The Deadmines.\"Captain\" Cookie"] = BB["\"Captain\" Cookie"],
			["InstanceLoot.The Deadmines.Vanessa VanCleef"] = BB["Vanessa VanCleef"], -- delete once the dataminer is fixed!
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Wailing Caverns"],
		setindex = "InstanceLoot.Wailing Caverns",
		colour = "|cffB0C4DE",
		header = BZ["Wailing Caverns"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.Wailing Caverns.Boahn"] = BB["Boahn"],
			["InstanceLoot.Wailing Caverns.Deviate Faerie Dragon"] = BB["Deviate Faerie Dragon"],
			["InstanceLoot.Wailing Caverns.Kresh"] = BB["Kresh"],
			["InstanceLoot.Wailing Caverns.Lady Anacondra"] = BB["Lady Anacondra"],
			["InstanceLoot.Wailing Caverns.Lord Cobrahn"] = BB["Lord Cobrahn"],
			["InstanceLoot.Wailing Caverns.Lord Pythas"] = BB["Lord Pythas"],
			["InstanceLoot.Wailing Caverns.Lord Serpentis"] = BB["Lord Serpentis"],
			["InstanceLoot.Wailing Caverns.Mad Magglish"] = BB["Mad Magglish"],
			["InstanceLoot.Wailing Caverns.Mutanus the Devourer"] = BB["Mutanus the Devourer"],
			["InstanceLoot.Wailing Caverns.Skum"] = BB["Skum"],
			["InstanceLoot.Wailing Caverns.Trigore the Lasher"] = BB["Trigore the Lasher"],
			["InstanceLoot.Wailing Caverns.Verdan the Everliving"] = BB["Verdan the Everliving"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Shadowfang Keep"],
		setindex = "InstanceLoot.Shadowfang Keep",
		colour = "|cffB0C4DE",
		header = BZ["Shadowfang Keep"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.Shadowfang Keep.Baron Ashbury"] = BB["Baron Ashbury"],
			["InstanceLoot.Shadowfang Keep.Baron Silverlaine"] = BB["Baron Silverlaine"],
			["InstanceLoot.Shadowfang Keep.Commander Springvale"] = BB["Commander Springvale"],
			["InstanceLoot.Shadowfang Keep.Lord Walden"] = BB["Lord Walden"],
			["InstanceLoot.Shadowfang Keep.Lord Godfrey"] = BB["Lord Godfrey"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["The Stockade"],
		setindex = "InstanceLoot.The Stockade",
		colour = "|cffB0C4DE",
		header = BZ["The Stockade"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.The Stockade.Randolph Moloch"] = BB["Randolph Moloch"],
			["InstanceLoot.The Stockade.Lord Overheat"] = BB["Lord Overheat"],
			["InstanceLoot.The Stockade.Hogger"] = BB["Hogger"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Blackfathom Deeps"],
		setindex = "InstanceLoot.Blackfathom Deeps",
		colour = "|cffB0C4DE",
		header = BZ["Blackfathom Deeps"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.Blackfathom Deeps.Aku'mai"] = BB["Aku'mai"],
			["InstanceLoot.Blackfathom Deeps.Baron Aquanis"] = BB["Baron Aquanis"],
			["InstanceLoot.Blackfathom Deeps.Gelihast"] = BB["Gelihast"],
			["InstanceLoot.Blackfathom Deeps.Ghamoo-ra"] = BB["Ghamoo-ra"],
			["InstanceLoot.Blackfathom Deeps.Lady Sarevess"] = BB["Lady Sarevess"],
			["InstanceLoot.Blackfathom Deeps.Twilight Lord Kelris"] = BB["Twilight Lord Kelris"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Gnomeregan"],
		setindex = "InstanceLoot.Gnomeregan",
		colour = "|cffB0C4DE",
		header = BZ["Gnomeregan"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.Gnomeregan.Crowd Pummeler 9-60"] = BB["Crowd Pummeler 9-60"],
			["InstanceLoot.Gnomeregan.Dark Iron Ambassador"] = BB["Dark Iron Ambassador"],
			["InstanceLoot.Gnomeregan.Electrocutioner 6000"] = BB["Electrocutioner 6000"],
			["InstanceLoot.Gnomeregan.Grubbis"] = BB["Grubbis"],
			["InstanceLoot.Gnomeregan.Mekgineer Thermaplugg"] = BB["Mekgineer Thermaplugg"],
			["InstanceLoot.Gnomeregan.Techbot"] = BB["Techbot"],
			["InstanceLoot.Gnomeregan.Viscous Fallout"] = BB["Viscous Fallout"]
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Razorfen Kraul"],
		setindex = "InstanceLoot.Razorfen Kraul",
		colour = "|cffB0C4DE",
		header = BZ["Razorfen Kraul"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.Razorfen Kraul.Agathelos the Raging"] = BB["Agathelos the Raging"],
			["InstanceLoot.Razorfen Kraul.Blind Hunter"] = BB["Blind Hunter"],
			["InstanceLoot.Razorfen Kraul.Charlga Razorflank"] = BB["Charlga Razorflank"],
			["InstanceLoot.Razorfen Kraul.Death Speaker Jargba"] = BB["Death Speaker Jargba"],
			["InstanceLoot.Razorfen Kraul.Earthcaller Halmgar"] = BB["Earthcaller Halmgar"],
			["InstanceLoot.Razorfen Kraul.Overlord Ramtusk"] = BB["Overlord Ramtusk"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Razorfen Downs"],
		setindex = "InstanceLoot.Razorfen Downs",
		colour = "|cffB0C4DE",
		header = BZ["Razorfen Downs"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.Razorfen Downs.Amnennar the Coldbringer"] = BB["Amnennar the Coldbringer"],
			["InstanceLoot.Razorfen Downs.Glutton"] = BB["Glutton"],
			["InstanceLoot.Razorfen Downs.Mordresh Fire Eye"] = BB["Mordresh Fire Eye"],
			["InstanceLoot.Razorfen Downs.Plaguemaw the Rotting"] = BB["Plaguemaw the Rotting"],
			["InstanceLoot.Razorfen Downs.Ragglesnout"] = BB["Ragglesnout"],
			["InstanceLoot.Razorfen Downs.Tuten'kash"] = BB["Tuten'kash"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Scarlet Monastery"],
		setindex = "InstanceLoot.Scarlet Monastery",
		colour = "|cffB0C4DE",
		header = BZ["Scarlet Monastery"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.Scarlet Monastery.Arcanist Doan"] = BB["Arcanist Doan"],
			["InstanceLoot.Scarlet Monastery.Azshir the Sleepless"] = BB["Azshir the Sleepless"],
			["InstanceLoot.Scarlet Monastery.Bloodmage Thalnos"] = BB["Bloodmage Thalnos"],
			["InstanceLoot.Scarlet Monastery.Fallen Champion"] = BB["Fallen Champion"],
			["InstanceLoot.Scarlet Monastery.Herod"] = BB["Herod"],
			["InstanceLoot.Scarlet Monastery.High Inquisitor Fairbanks"] = BB["High Inquisitor Fairbanks"],
			["InstanceLoot.Scarlet Monastery.High Inquisitor Whitemane"] = BB["High Inquisitor Whitemane"],
			["InstanceLoot.Scarlet Monastery.Houndmaster Loksey"] = BB["Houndmaster Loksey"],
			["InstanceLoot.Scarlet Monastery.Interrogator Vishas"] = BB["Interrogator Vishas"],
			["InstanceLoot.Scarlet Monastery.Ironspine"] = BB["Ironspine"],
			["InstanceLoot.Scarlet Monastery.Headless Horseman"] = BB["Headless Horseman"],
			["InstanceLoot.Scarlet Monastery.Scarlet Commander Mograine"] = BB["Scarlet Commander Mograine"],
		},
	})
