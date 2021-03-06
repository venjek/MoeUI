if GetLocale() ~= "ptBR" then return end

local o = mOnWardrobe
local c = {}
o.categorization = c
o.EXPS = {'Clássico', 'Burning Crusade', 'WotLK', 'Cataclysm', 'Mists of Pandaria', 'Draenor', 'Legion'}
o.PARTY = {'Dungeon', 'Raid'}

c["Ahn'kahet: O Velho Reino"] = {3, 1, "Ahn'kahet: The Old Kingdom"}
c["Ataque ao Castelo Violeta"] = {7, 1, "Assault on Violet Hold"}
c["Catacumbas Auchenai"] = {2, 1, "Auchenai Crypts"}
c["Auchindoun"] = {6, 1, "Auchindoun"}
c["Azjol-Nerub"] = {3, 1, "Azjol-Nerub"}
c["Guarnição Baradin"] = {4, 2, "Baradin Hold"}
c["Castelo Corvo Negro"] = {7, 1, "Black Rook Hold"}
c["Templo Negro"] = {2, 2, "Black Temple"}
c["Profundezas Negras"] = {1, 1, "Blackfathom Deeps"}
c["Caverna Rocha Negra"] = {4, 1, "Blackrock Caverns"}
c["Abismo Rocha Negra"] = {1, 1, "Blackrock Depths"}
c["Fundição Rocha Negra"] = {6, 2, "Blackrock Foundry"}
c["Descenso do Asa Negra"] = {4, 2, "Blackwing Descent"}
c["Covil Asa Negra"] = {1, 2, "Blackwing Lair"}
c["Minas de Escória do Malho Sangrento"] = {6, 1, "Bloodmaul Slag Mines"}
c["Ilhas Partidas"] = {7, 2, "Broken Isles"}
c["Pátio das Estrelas"] = {7, 1, "Court of Stars"}
c["Bosque Corenegro"] = {7, 1, "Darkheart Thicket"}
c["Minas Mortas"] = {1, 1, "Deadmines"}
c["Martelo do Gládio Cruel"] = {1, 1, "Dire Maul"}
c["Draenor"] = {6, 2, "Draenor"}
c["Alma Dragônica"] = {4, 2, "Dragon Soul"}
c["Bastilha Drak'Tharon"] = {3, 1, "Drak'Tharon Keep"}
c["Fim dos tempos"] = {4, 1, "End Time"}
c["Olho de Azshara"] = {7, 1, "Eye of Azshara"}
c["Terras do Fogo"] = {4, 2, "Firelands"}
c["Portal do Sol Poente"] = {5, 1, "Gate of the Setting Sun"}
c["Gnomeregan"] = {1, 1, "Gnomeregan"}
c["Grim Batol"] = {4, 1, "Grim Batol"}
c["Central do Carrilcruel"] = {6, 1, "Grimrail Depot"}
c["Covil de Gruul"] = {2, 2, "Gruul's Lair"}
c["Gundrak"] = {3, 1, "Gundrak"}
c["Salões Relampejantes"] = {3, 1, "Halls of Lightning"}
c["Salões Primordiais"] = {4, 1, "Halls of Origination"}
c["Salões da Reflexão"] = {3, 1, "Halls of Reflection"}
c["Salões Rochosos"] = {3, 1, "Halls of Stone"}
c["Salões da Bravura"] = {7, 1, "Halls of Valor"}
c["Coração do Medo"] = {5, 2, "Heart of Fear"}
c["Cidadela Fogo do Inferno"] = {6, 2, "Hellfire Citadel"}
c["Muralha Fogo do Inferno"] = {2, 1, "Hellfire Ramparts"}
c["Malho Imponente"] = {6, 2, "Highmaul"}
c["Hora do crepúsculo"] = {4, 1, "Hour of Twilight"}
c["Cidadela da Coroa de Gelo"] = {3, 2, "Icecrown Citadel"}
c["Docas de Ferro"] = {6, 1, "Iron Docks"}
c["Karazhan"] = {2, 2, "Karazhan"}
c["Cidade Perdida dos Tol'vir"] = {4, 1, "Lost City of the Tol'vir"}
c["Pico da Rocha Negra Inferior"] = {1, 1, "Lower Blackrock Spire"}
c["Terraço dos Magísteres"] = {2, 1, "Magisters' Terrace"}
c["Covil de Magtheridon"] = {2, 2, "Magtheridon's Lair"}
c["Tumbas de Mana"] = {2, 1, "Mana-Tombs"}
c["Maraudon"] = {1, 1, "Maraudon"}
c["Gorja das Almas"] = {7, 1, "Maw of Souls"}
c["Palácio Mogu'shan"] = {5, 1, "Mogu'shan Palace"}
c["Galerias Mogu'shan"] = {5, 2, "Mogu'shan Vaults"}
c["Núcleo Derretido"] = {1, 2, "Molten Core"}
c["Naxxramas"] = {3, 2, "Naxxramas"}
c["Covil de Neltharion"] = {7, 1, "Neltharion's Lair"}
c["Antigo Contraforte de Eira dos Montes"] = {2, 1, "Old Hillsbrad Foothills"}
c["Covil de Onyxia"] = {3, 2, "Onyxia's Lair"}
c["Pandária"] = {5, 2, "Pandaria"}
c["Fosso de Saron"] = {3, 1, "Pit of Saron"}
c["Cavernas Ígneas"] = {1, 1, "Ragefire Chasm"}
c["Urzal dos Mortos"] = {1, 1, "Razorfen Downs"}
c["Urzal dos Tuscos"] = {1, 1, "Razorfen Kraul"}
c["Ruínas de Ahn'Qiraj"] = {1, 2, "Ruins of Ahn'Qiraj"}
c["Salões Escarlates"] = {1, 1, "Scarlet Halls"}
c["Monastério Escarlate"] = {1, 1, "Scarlet Monastery"}
c["Scolomântia"] = {1, 1, "Scholomance"}
c["Caverna do Serpentário"] = {2, 2, "Serpentshrine Cavern"}
c["Salões dos Sethekk"] = {2, 1, "Sethekk Halls"}
c["Monastério Shado-pan"] = {5, 1, "Shado-Pan Monastery"}
c["Labirinto Soturno"] = {2, 1, "Shadow Labyrinth"}
c["Bastilha da Presa Negra"] = {1, 1, "Shadowfang Keep"}
c["Sepulcrário da Lua Negra"] = {6, 1, "Shadowmoon Burial Grounds"}
c["Cerco ao Templo Niuzao"] = {5, 1, "Siege of Niuzao Temple"}
c["Cerco a Orgrimmar"] = {5, 2, "Siege of Orgrimmar"}
c["Beira-céu"] = {6, 1, "Skyreach"}
c["Cervejaria Malte do Trovão"] = {5, 1, "Stormstout Brewery"}
c["Stratholme"] = {1, 1, "Stratholme"}
c["Platô da Nascente do Sol"] = {2, 2, "Sunwell Plateau"}
c["Templo de Ahn'Qiraj"] = {1, 2, "Temple of Ahn'Qiraj"}
c["Templo da Serpente de Jade"] = {5, 1, "Temple of the Jade Serpent"}
c["Terraço da Primavera Eterna"] = {5, 2, "Terrace of Endless Spring"}
c["Arcatraz"] = {2, 1, "The Arcatraz"}
c["O Arcâneo"] = {7, 1, "The Arcway"}
c["Bastião do Crepúsculo"] = {4, 2, "The Bastion of Twilight"}
c["A Batalha pelo Monte Hyjal"] = {2, 2, "The Battle for Mount Hyjal"}
c["Lamaçal Negro"] = {2, 1, "The Black Morass"}
c["A Fornalha de Sangue"] = {2, 1, "The Blood Furnace"}
c["Jardim Botânico"] = {2, 1, "The Botanica"}
c["O Expurgo de Stratholme"] = {3, 1, "The Culling of Stratholme"}
c["O Pesadelo Esmeralda"] = {7, 2, "The Emerald Nightmare"}
c["Floretérnia"] = {6, 1, "The Everbloom"}
c["O Olho"] = {2, 2, "The Eye"}
c["Olho da Eternidade"] = {3, 2, "The Eye of Eternity"}
c["A Forja das Almas"] = {3, 1, "The Forge of Souls"}
c["O Mecanar"] = {2, 1, "The Mechanar"}
c["O Nexus"] = {3, 1, "The Nexus"}
c["O Baluarte da Noite"] = {7, 2, "The Nighthold"}
c["O Santuário Obsidiano"] = {3, 2, "The Obsidian Sanctum"}
c["O Óculus"] = {3, 1, "The Oculus"}
c["O Santuário Rubi"] = {3, 2, "The Ruby Sanctum"}
c["Os Salões Despedaçados"] = {2, 1, "The Shattered Halls"}
c["O Pátio dos Escravos"] = {2, 1, "The Slave Pens"}
c["A Câmara dos Vapores"] = {2, 1, "The Steamvault"}
c["O Cárcere"] = {1, 1, "The Stockade"}
c["Litocerne"] = {4, 1, "The Stonecore"}
c["O Templo de Atal'hakkar"] = {1, 1, "The Temple of Atal'hakkar"}
c["O Brejo Oculto"] = {2, 1, "The Underbog"}
c["O Castelo Violeta"] = {3, 1, "The Violet Hold"}
c["Pináculo do Vórtice"] = {4, 1, "The Vortex Pinnacle"}
c["Trono do Trovão"] = {5, 2, "Throne of Thunder"}
c["Trono dos Quatro Ventos"] = {4, 2, "Throne of the Four Winds"}
c["Trono das Marés"] = {4, 1, "Throne of the Tides"}
c["Prova do Campeão"] = {3, 1, "Trial of the Champion"}
c["Prova do Cruzado"] = {3, 2, "Trial of the Crusader"}
c["Uldaman"] = {1, 1, "Uldaman"}
c["Ulduar"] = {3, 2, "Ulduar"}
c["Pico da Rocha Negra Superior"] = {6, 1, "Upper Blackrock Spire"}
c["Bastilha Utgarde"] = {3, 1, "Utgarde Keep"}
c["Pináculo Utgarde"] = {3, 1, "Utgarde Pinnacle"}
c["Abóbada de Arcavon"] = {3, 2, "Vault of Archavon"}
c["Câmara das Guardiãs"] = {7, 1, "Vault of the Wardens"}
c["Caverna Ululante"] = {1, 1, "Wailing Caverns"}
c["Nascente da eternidade"] = {4, 1, "Well of Eternity"}
c["Zul'Aman"] = {4, 1, "Zul'Aman"}
c["Zul'Farrak"] = {1, 1, "Zul'Farrak"}
c["Zul'Gurub"] = {4, 1, "Zul'Gurub"}
