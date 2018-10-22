--Aktuální verze k 16.4.2018
--**********************skript lokomotivy 460**************************--
	-- SysCall("ScenarioManager:ShowInfoMessageExt", "CD460 addon", "Baterie zapnute.",5,16,0,0)
--os.execute('Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460080\\ActualizationAutoRun\\runactualization.exe')
INFO = 0
ALERT = 1

gAbsolutniMax_kN = 1300
gAbsolutniMax_kN_EDB = 1300
gMax_kN = {17.5,30,40,55,69,90,105,145,215,286.5,420,500,710,800,2000,2000,2350,2740,3350,2025} 
gKoeficient = {-0.097,-0.071,-0.077,-0.087,-0.094,-0.091,-0.0896,-0.112,-0.13,-0.14,-0.16,-0.162,-0.173,-0.173,-0.23,-0.25,-0.25,-0.25,-0.25,-0.22} 
gOffsetX = {0,0,0,0,0,0,0,0,0,0,0.26,0,0,0,0000,-2,-2,-2,-2,-3}
gOffsetY = {0,0,0,0,0,0,0,0,0,0,4.00,2,1,1,5.75,07,09,11,14,15}
gZvetseni ={0,0,0,0,0,0,0,0,0,0,0.00,0,0,0,0.00,00,00,00,00,00}

gProbihaA = false
gHODNOTA_LASTa = 0
gHraniceA = 0
gGradientLastA = 0
gCurvatureLastA = 0

gProbihaV = false
gHODNOTA_LASTv = 0
gHraniceV = 0
gGradientLastV = 0
gCurvatureLastV = 0

stavVystraha = 0
stavStuj = 0
stavVolno = 0
stavMezikruzi = 0
stavVybaveni = 0

vystraha = false
stuj = false
volno = false
mezikruzi = false
vybaveni = false

casNekodovani = 0
nekodujCas = nil
sumPoPrujezdu = false
pocetSumuPoPrujezdu = 0
sumPoPrujezduKod = 0
sumPoPrujezduDelka = 0
sumPoPrujezduDelkaUbehle = 0
zmenaParametru = 0
zmenaParametruLast = 0
casChybyUbehly = 0
casZhasleUbehly = 0
casZmenyUbehly = 0
signalCode = 0
lastSignalCode = 0

blokEDB = false

vnitrniSit220V = 0
vnitrniSit220Vnouzova = 0
napetiVS220 = 0
napetiVS220nouz = 0

blokKrokNU = false

blokOchran = false

shunty = false
stupenKontroleruOld = 0
stupenKontroleru = 0
pocitejCasShuntu = false
casShuntu = 0

ojDiag = 0

nastaveneValce = 0
doplnujBrzdu = false
-- doplnujBrzdu_opozdene = false
gProbihaPipe = false
gHranicePipe = 0
gHODNOTA_LAST_Pipe = 0
gProbihaValce = false
gHraniceValce = 0
gHODNOTA_LAST_Valce = 0
BS2 = 0
-- BS2_opozdene = 0

snizenyVykonTady = false

JOB = 0

stavDalkoveLeve = 0
stavDalkovePrave = 0
stavDalkoveHorni = 0

ridiciKontrolerOknoOCVC = 1

ventilatory_tm_otacky = 0
ventilatory_strecha_otacky = 0

instanceGroupNabeh = false
instanceGroupDobeh = false

blokuj_nabeh_TM = false
blokuj_dobeh_TM = false

casMinuly = 0
casProcesor = os.clock()

vystupBrzdic = 0
beginZpozdeniBrzdic = nil

plynuleValce = 0
plynuleValce_bezBP = 0
tlak_HP = 0
navoleny_tlak = 0
tlak_ridiciho_ustroji = 0
prah_hystereze_ridiciho_ustroji = 0.3
hystereze_ridiciho_ustroji = false
-- tlak_ridiciho_ustroji_opozdene = tlak_ridiciho_ustroji
VirtualMainReservoirPressureBAR = math.random(0,10)
-- tlak_HP_opozdene = 0
plynulyVzduchojem = 0
-- vysokotlakysvih_opozdene = false
pribrzdiSvih = false
vychoziTlakSystemu = 5
vychoziTlakBrzdice = 5
-- vychoziTlakSystemu_opozdene = 5
PipeOld = 0

ZPRAVA_FAST_START = SysCall("ScenarioManager:GetLocalisedString","d628e082-95e2-4d62-84bd-be5186025d2c")
ZPRAVA_HLAVICKA = SysCall("ScenarioManager:GetLocalisedString","297fd3ee-8b43-11e7-bb31-be2e44b06b34")
ZPRAVA_BATERIE_POSKOZENE = SysCall("ScenarioManager:GetLocalisedString","1d415004-5d9b-4562-8d2f-06815b4e34b0")
ZPRAVA_NEUSPESNY_FAST_START = SysCall("ScenarioManager:GetLocalisedString","86bd9176-0722-4bda-bcea-9111b16b6bfc")
ZPRAVA_BATERIE_ZAP = SysCall("ScenarioManager:GetLocalisedString","5cc482bf-9e41-48fc-a377-c51338dc5b90")
ZPRAVA_UROVEN_HELP = SysCall("ScenarioManager:GetLocalisedString","2a28ea97-e512-4303-a839-a8d6cb89c262")
ZPRAVA_HLAVICKA_NAPOVEDA = SysCall("ScenarioManager:GetLocalisedString","5719ee78-b404-447a-a756-f48064caa3c2")

levelNapovedy = 0

otocDvere = false
dvereLeveZeSoupravy = false
dvereLeveZeSoupravyPridrznyStav = false
dvereLevePridrznyStav = false
dverePraveZeSoupravy = false
dverePraveZeSoupravyPridrznyStav = false
dverePravePridrznyStav = false
dvereStavLast = ""
dvereLPskutecne = 0
dvereLZskutecne = 0
dverePPskutecne = 0
dverePZskutecne = 0
rychlostZaviraniDveriLP = math.random(100, 130)/100
rychlostZaviraniDveriPP = math.random(100, 130)/100
rychlostZaviraniDveriLZ = math.random(100, 130)/100
rychlostZaviraniDveriPZ = math.random(100, 130)/100
rychlostOteviraniDveriLP = math.random(20, 36)/100
rychlostOteviraniDveriPP = math.random(20, 36)/100
rychlostOteviraniDveriLZ = math.random(20, 36)/100
rychlostOteviraniDveriPZ = math.random(20, 36)/100
RizenaRidiciLast_dvere = ""

gProbihaPrasatkoL = false
gHranicePrasatkoL = 0
gHODNOTA_LAST_PrasatkoL = 0
gProbihaPrasatkoP = false
gHranicePrasatkoP = 0
gHODNOTA_LAST_PrasatkoP = 0

dvereVypisLast = ""
prujezdKolemNavestidla = false

RizenaRidiciLast = ""

MSVsipkaLevaLast = false
MSVsipkaPravaLast = false
MSVsipkaDoluLast = false
MSVsipkaNahoruLast = false
MSVokLast = false
MSVsipkaLeva = false
MSVsipkaPrava = false
MSVsipkaDolu = false
MSVsipkaNahoru = false
MSVok = false

zavedSnizenyVykon = false

pojezdNeschopna = false

prvnizprava = false

byloZhaveni = false
nadbytecnaObsluha = false

steracLevyOut = 0
steracPravyOut = 0
steracLevy = 0
steracPravy = 0
steracePrep = false

ojThrottleAndBrakeLast = 0

rychlostEDB = math.random(20, 25)

predMasinouTornado = nil
zaMasinouTornado = nil
predMasinouTornadoCas = nil
zaMasinouTornadoCas = nil
maxVzdalenost = 25000
poleKOdeslani = {}
prijateZpravy = {}

delkaVlakuLast = 0
delkaVlaku = 0

pocetMG = 0

dolniMezKompresoru = 8.2
horniMezKompresoru = 9.7

mgUnitValueLast = 0

dvereTlak = 0
prepinaceTlak = 0

ujeteMetryAI = 0
casPlayerReflektor = 0
vzdalenostAI = 0
vzdalenostAIlast = 0

provedPrijetiVUpdate = false

ksOK = false
casKS = 0

vevnitr = true
vOddile = false

pocetHaslerUpdate = 0
casHasler = 0
sumHasler = 0

function genChckSum(fileObject)
	fileObject = assert(fileObject, "Soubor nebyl nalezeny!")
	chckSum = 0
	char = fileObject:read(1)
	while char do
		chckSum = chckSum + string.byte(char)
    	char = fileObject:read(1)
	end
	chckSum = math.mod(chckSum, 256)
	chckSum = 256 - chckSum
	fileObject:close()
	return chckSum
end

function overKS()
	Call("SetControlValue", "ScriptVersion", 0, 460999)
	local scriptVersion = Call("GetControlValue", "ScriptVersion", 0)
	if scriptVersion == 460021 then
		extModel = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460021\\460_modra.GeoPcDx", "rb")
		local ks = genChckSum(extModel)
		if ks ~= 256 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet modelu 460 021 je "..ks.." a neshoduje se s originalnim modelem!")
			Print("Kontrolni soucet modelu 460 021 je "..ks.." a neshoduje se s originalnim modelem!")
			--return false
		end

		BPmain021 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460021\\460021.bin", "rb")
		local ks = genChckSum(BPmain021)
		if ks ~= 255 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet blueprintu 460 021 je "..ks.." a neshoduje se s originalnim blueprintem!")
			Print("Kontrolni soucet blueprintu 460 021 je "..ks.." a neshoduje se s originalnim blueprintem!")
			--return false
		end

		tex021_1 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460021\\Textures\\460-1.TgPcDx", "rb")
		local ks = genChckSum(tex021_1)
		if ks ~= 192 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 021 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 021 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end

		tex021_2 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460021\\Textures\\460-2.TgPcDx", "rb")
		local ks = genChckSum(tex021_2)
		if ks ~= 40 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 021 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 021 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end

		tex021_4 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460021\\Textures\\460-4.TgPcDx", "rb")
		local ks = genChckSum(tex021_4)
		if ks ~= 128 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 021 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 021 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end

		tex021_6 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460021\\Textures\\460-6.TgPcDx", "rb")
		local ks = genChckSum(tex021_6)
		if ks ~= 128 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 021 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 021 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end
	elseif scriptVersion == 460063 then
		extModel = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460063\\460_063.GeoPcDx", "rb")
		local ks = genChckSum(extModel)
		if ks ~= 128 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet modelu 460 063 je "..ks.." a neshoduje se s originalnim modelem!")
			Print("Kontrolni soucet modelu 460 063 je "..ks.." a neshoduje se s originalnim modelem!")
			--return false
		end

		BPmain021 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460063\\460063.bin", "rb")
		local ks = genChckSum(BPmain021)
		if ks ~= 86 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet blueprintu 460 063 je "..ks.." a neshoduje se s originalnim blueprintem!")
			Print("Kontrolni soucet blueprintu 460 063 je "..ks.." a neshoduje se s originalnim blueprintem!")
			--return false
		end

		tex021_1 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460063\\Textures\\460-1.TgPcDx", "rb")
		local ks = genChckSum(tex021_1)
		if ks ~= 128 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 063 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 063 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end

		tex021_2 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460063\\Textures\\460-2.TgPcDx", "rb")
		local ks = genChckSum(tex021_2)
		if ks ~= 104 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 063 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 063 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end

		tex021_4 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460063\\Textures\\460-4.TgPcDx", "rb")
		local ks = genChckSum(tex021_4)
		if ks ~= 128 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 063 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 063 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end

		tex021_6 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460063\\Textures\\460-6.TgPcDx", "rb")
		local ks = genChckSum(tex021_6)
		if ks ~= 128 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 063 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 063 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end
	elseif scriptVersion == 460064 then
		extModel = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460064\\460_064.GeoPcDx", "rb")
		local ks = genChckSum(extModel)
		if ks ~= 128 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet modelu 460 064 je "..ks.." a neshoduje se s originalnim modelem!")
			Print("Kontrolni soucet modelu 460 064 je "..ks.." a neshoduje se s originalnim modelem!")
			--return false
		end

		BPmain021 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460064\\460064.bin", "rb")
		local ks = genChckSum(BPmain021)
		if ks ~= 190 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet blueprintu 460 064 je "..ks.." a neshoduje se s originalnim blueprintem!")
			Print("Kontrolni soucet blueprintu 460 064 je "..ks.." a neshoduje se s originalnim blueprintem!")
			--return false
		end

		tex021_1 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460064\\Textures\\460-1.TgPcDx", "rb")
		local ks = genChckSum(tex021_1)
		if ks ~= 192 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 064 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 064 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end

		tex021_2 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460064\\Textures\\460-2.TgPcDx", "rb")
		local ks = genChckSum(tex021_2)
		if ks ~= 184 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 064 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 064 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end

		tex021_4 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460064\\Textures\\460-4.TgPcDx", "rb")
		local ks = genChckSum(tex021_4)
		if ks ~= 128 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 064 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 064 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end

		tex021_6 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460064\\Textures\\460-6.TgPcDx", "rb")
		local ks = genChckSum(tex021_6)
		if ks ~= 128 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 064 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 064 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end
	elseif scriptVersion == 460080 then
		extModel = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460080\\460_muz.GeoPcDx", "rb")
		local ks = genChckSum(extModel)
		if ks ~= 64 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet modelu 460 080 je "..ks.." a neshoduje se s originalnim modelem!")
			Print("Kontrolni soucet modelu 460 080 je "..ks.." a neshoduje se s originalnim modelem!")
			--return false
		end

		BPmain021 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460080\\460080.bin", "rb")
		local ks = genChckSum(BPmain021)
		if ks ~= 76 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet blueprintu 460 080 je "..ks.." a neshoduje se s originalnim blueprintem!")
			Print("Kontrolni soucet blueprintu 460 080 je "..ks.." a neshoduje se s originalnim blueprintem!")
			--return false
		end

		tex021_1 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460080\\Textures\\460079a.TgPcDx", "rb")
		local ks = genChckSum(tex021_1)
		if ks ~= 256 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 080 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 080 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end

		tex021_2 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460080\\Textures\\460079b.TgPcDx", "rb")
		local ks = genChckSum(tex021_2)
		if ks ~= 256 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 080 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 080 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end

		tex021_4 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460080\\Textures\\460079c.TgPcDx", "rb")
		local ks = genChckSum(tex021_4)
		if ks ~= 224 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 080 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 080 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end

		tex021_6 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460080\\Textures\\460079c1.TgPcDx", "rb")
		local ks = genChckSum(tex021_6)
		if ks ~= 96 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 080 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 080 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end
	end
	return true
end

function ZpravaDebug(zprava)
	if gDebug then
		printID = ID
		if printID == nil then
			printID = Call("GetRVNumber")
		end
		Print("CD460 - ID"..printID)
		Print("Rizena: "..tostring(ToBolAndBack(Call("GetIsEngineWithKey"))))
		Print("Zprava: "..zprava.."\n")
		f = assert(io.open("460.log", "a"))
		f:write("CD460 - ID: "..printID.." :: Rizena: "..tostring(ToBolAndBack(Call("GetIsEngineWithKey"))).." :: Zprava: "..zprava.."\n")
		f:close()
	end
end

function divMod(x,y)
    return math.floor(x / y), x - math.floor(x/y)*y
end

function split(s, delimiter)
	local result = { }
	local from  = 1
	local delim_from, delim_to = string.find( s, delimiter, from  )
	while delim_from do
		table.insert( result, string.sub( s, from , delim_from-1 ) )
		from  = delim_to + 1
		delim_from, delim_to = string.find( s, delimiter, from  )
	end
	table.insert( result, string.sub( s, from  ) )
	return result
end

function modulo(x,y)
    return x - math.floor(x/y)*y
end

char = string.char
pairs = pairs
floor = math.floor
table_insert = table.insert
table_concat = table.concat
unpack = table.unpack or unpack

local function unicode_to_utf8(code)
   -- converts numeric UTF code (U+code) to UTF-8 string
   local t, h = {}, 128
   while code >= h do
      t[table.getn(t)+1] = 128 + modulo(code,64)
      code = floor(code/64)
      h = h > 32 and 32 or h/2
   end
   t[table.getn(t)+1] = 256 - 2*h + code
   return char(unpack(t)):reverse()
end

local function utf8_to_unicode(utf8str, pos)
   -- pos = starting byte position inside input string (default 1)
   pos = pos or 1
   local code, size = string.byte(utf8str, pos), 1
   if code >= 192 and code < 254 then
      local mask = 64
      code = code - 128
      repeat
         local next_byte = string.byte(utf8str, pos + size) or 0
         if next_byte >= 128 and next_byte < 192 then
            code, size = (code - mask - 2) * 64 + next_byte, size + 1
         else
            code, size = string.byte(utf8str, pos), 1
         end
         mask = mask * 32
      until code < mask
   end
   -- returns code, number of bytes in this utf8 char
   return code, size
end
--------------------------------TABULKA ZNAKU---------------
	--á(225) = °(176)
	--Á(193) = 1(49)
	--č(269) = 2(50)
	--Č(268) = 3(51)
	--ď(271) = 4(52)
	--Ď(270) = 5(53)
	--é(233) = 6(54)
	--ě(283) = 7(55)
	--É(201) = 8(56)
	--Ě(282) = 9(57)
	--í(237) = 0(48)
	--Í(205) = %(37)
	--ň(328) = +(43)
	--Ň(327) = `(96)
	--ó(243) = !(33)
	--Ó(211) = @(64)
	--ř(345) = #(35)
	--Ř(344) = $(36)
	--š(353) = ^(94)
	--Š(352) = &(38)
	--ť(357) = *(42)
	--Ť(356) = =(61)
	--ú(250) = {(123)
	--ů(367) = }(125)
	--Ú(218) = [(91)
	--Ů(366) = ](93)
	--ý(253) = ;(59)
	--Ý(221) = ¤(164)
	--ž(382) = /(47)
	--Ž(381) = \(92)
local map_unicode_to_1252 = {
   [8364] = 128,
   [129] = 129,
   [8218] = 130,
   [402] = 131,
   [8222] = 132,
   [8230] = 133,
   [8224] = 134,
   [8225] = 135,
   [710] = 136,
   [8240] = 137,
   [352] = 38,
   [8249] = 139,
   [338] = 140,
   [141] = 141,
   [381] = 92,
   [143] = 143,
   [144] = 144,
   [8216] = 145,
   [8217] = 146,
   [8220] = 147,
   [8221] = 148,
   [8226] = 149,
   [8211] = 150,
   [8212] = 151,
   [732] = 152,
   [8482] = 153,
   [353] = 94,
   [8250] = 155,
   [339] = 156,
   [157] = 157,
   [382] = 47,
   [376] = 159,
   [160] = 160,
   [161] = 161,
   [162] = 162,
   [163] = 163,
   [164] = 164,
   [165] = 161,
   [166] = 166,
   [167] = 167,
   [168] = 168,
   [196] = 48,
   [170] = 170,
   [356] = 61,
   [172] = 172,
   [173] = 173,
   [1125] = 174,
   [175] = 175,
   [176] = 176,
   [177] = 177,
   [178] = 178,
   [179] = 179,
   [180] = 180,
   [162] = 181,
   [182] = 182,
   [183] = 183,
   [184] = 184,
   [197] = 48,
   [186] = 186,
   [357] = 42,
   [188] = 188,
   [189] = 189,
   [1126] = 190,
   [191] = 191,
   [184] = 95,
   [193] = 49,
   [194] = 194,
   [195] = 195,
   [196] = 196,
   [157] = 197,
   [198] = 198,
   [199] = 199,
   [268] = 51,
   [201] = 56,
   [202] = 202,
   [203] = 203,
   [282] = 57,
   [205] = 37,
   [206] = 206,
   [270] = 53,
   [208] = 208,
   [209] = 209,
   [327] = 96,
   [211] = 64,
   [212] = 212,
   [213] = 213,
   [214] = 214,
   [215] = 215,
   [344] = 36,
   [366] = 93,
   [218] = 91,
   [219] = 219,
   [220] = 220,
   [221] = 164,
   [222] = 222,
   [223] = 52,
   [185] = 224,
   [225] = 176,
   [226] = 226,
   [227] = 227,
   [228] = 228,
   [158] = 54,
   [230] = 230,
   [231] = 231,
   [269] = 50,
   [233] = 54,
   [234] = 234,
   [235] = 235,
   [283] = 55,
   [237] = 48,
   [238] = 238,
   [271] = 52,
   [240] = 240,
   [241] = 241,
   [328] = 43,
   [243] = 33,
   [244] = 244,
   [245] = 245,
   [246] = 246,
   [247] = 247,
   [345] = 35,
   [367] = 125,
   [250] = 123,
   [251] = 251,
   [252] = 252,
   [253] = 59,
   [254] = 254,
   [255] = 255,
}

function string.fromutf8(utf8str)
	local pos, result_1252 = 1, {}
	while pos <= string.len(utf8str) do
		local code, size = utf8_to_unicode(utf8str, pos)
		pos = pos + size
		local kodPred = code
		code = code < 128 and code or map_unicode_to_1252[code] or string.byte('?')
		local kodPo = code
		local znakPo = char(code)
		table_insert(result_1252, char(code))
	end
	return table_concat(result_1252)
end

IS = {
	maxDelky = {
		MSVlinkaOUT = 2,
		MSVlinkaIN = 16,
		MSVcil1OUT = 16,
		MSVcil1IN = 16,
		MSVcil2OUT = 16,
		MSVcil2IN = 16,
		MSVcilCelaPlochaOUT = 16,
		MSVcilCelaPlochaIN = 16,
		MSVid = 2,
	},
	cile1IN = {},
	cile1OUT = {},
	cileIsWhole = {},
	cile2IN = {},
	cile2OUT = {},
	linkyOUT = {},
	linkyIN = {},
	stav = "start",
	cil1ID = 1,
	cil2ID = 1,
	linkaID = 1,
	casStart = 0,
	casMenu = 0,
	Zapis = function(self, kam, co, zleva, center)
		local maxDelka = IS.maxDelky[kam]
		if maxDelka then
			if string.len(co) > maxDelka then
				co = string.sub(co,1,maxDelka)
			end
			if not center then
				while string.len(co) < maxDelka do
					if not zleva then
						co = co.." "
					else
						co = " "..co
					end
				end
			else
				local pocetMezerLeva = math.floor((maxDelka - string.len(co))/2)
				local i = 0
				while i < pocetMezerLeva do
					co = " "..co
					i = i + 1
				end
				while string.len(co) < maxDelka do
					co = co.." "
				end
			end
			if kam ~= "MSVcil1IN" and kam ~= "MSVcil2IN" and kam ~= "MSVlinkaIN" and kam ~= "MSVid" then
				Call(kam..":SetText",co,0)
				Call(kam.."2:SetText",co,0)
			else
				Call(kam.."2:SetText",co,0)
			end
		end
	end,
	NastavLinku = function(self, ID, venku)
		if venku then
			IS:Zapis("MSVlinkaOUT",IS.linkyOUT[ID],false,false)
		end
		IS:Zapis("MSVlinkaIN",IS.linkyIN[ID],false,false)
	end,
	NastavCil1 = function(self, ID, venku)
		if venku and IS.cileIsWhole[ID] == "false" then
			IS:Zapis("MSVcil1OUT",IS.cile1OUT[ID],false,false)
			IS:Zapis("MSVcilCelaPlochaOUT","",false,false)
		elseif venku then
			IS:Zapis("MSVcil1OUT","",false,false)
			IS:Zapis("MSVcilCelaPlochaOUT",IS.cile1OUT[ID],false,true)
		end
		if IS.cileIsWhole[ID] == "true" and venku then
			IS:Zapis("MSVlinkaOUT","",false,false)
			IS:Zapis("MSVlinkaIN","",false,false)
			IS:Zapis("MSVcil2OUT","",false,false)
			IS:Zapis("MSVcil2IN","",false,false)
		end
		IS:Zapis("MSVcil1IN",IS.cile1IN[ID],false,false)
	end,
	NastavCil2 = function(self, ID, venku)
		if venku then
			IS:Zapis("MSVcil2OUT",IS.cile2OUT[ID],true,false)
		end
		IS:Zapis("MSVcil2IN",IS.cile2IN[ID],true,false)
	end,
	NastavCislo = function(self, ID)
		ZpravaDebug("Nastavuji ID "..ID)
		IS:Zapis("MSVid",tostring(ID-1),false,false)
	end,
	SipkaNahoru = function(self)
		IS.casMenu = 0
		if IS.stav == "sleep" then
			IS.stav = "cil1"
		elseif IS.stav == "cil1" then
			IS.cil1ID = IS.cil1ID + 1
			if IS.cil1ID > table.getn(IS.cile1IN) then
				IS.cil1ID = 1
			end
			IS:NastavCil1(IS.cil1ID,false)
			IS:NastavCislo(IS.cil1ID)
			SysCall("ScenarioManager:ShowAlertMessageExt", "MSV IS nastaveni cile 1:", "ID: "..IS.cil1ID.." CIL: "..IS.cile1IN[IS.cil1ID],0.2)
		elseif IS.stav == "cil2" then
			IS.cil2ID = IS.cil2ID + 1
			if IS.cil2ID > table.getn(IS.cile2IN) then
				IS.cil2ID = 1
			end
			IS:NastavCil2(IS.cil2ID,false)
			IS:NastavCislo(IS.cil2ID)
			SysCall("ScenarioManager:ShowAlertMessageExt", "MSV IS nastaveni cile 2:", "ID: "..IS.cil2ID.." CIL: "..IS.cile2IN[IS.cil2ID],0.2)
		elseif IS.stav == "linka" then
			IS.linkaID = IS.linkaID + 1
			if IS.linkaID > table.getn(IS.linkyIN) then
				IS.linkaID = 1
			end
			IS:NastavLinku(IS.linkaID,false)
			IS:NastavCislo(IS.linkaID)
			SysCall("ScenarioManager:ShowAlertMessageExt", "MSV IS nastaveni linky:", "ID: "..IS.linkaID.." LINKA: "..IS.linkyIN[IS.linkaID],0.2)
		end
	end,
	SipkaDolu = function(self)
		IS.casMenu = 0
		if IS.stav == "sleep" then
			IS.stav = "cil1"
		elseif IS.stav == "cil1" then
			IS.cil1ID = IS.cil1ID - 1
			if IS.cil1ID <= 0 then
				IS.cil1ID = table.getn(IS.cile1IN)
			end
			IS:NastavCil1(IS.cil1ID,true)
			IS:NastavCislo(IS.cil1ID)
			SysCall("ScenarioManager:ShowAlertMessageExt", "MSV IS nastaveni cile 1:", "ID: "..IS.cil1ID.." CIL: "..IS.cile1IN[IS.cil1ID],0.2)
		elseif IS.stav == "cil2" then
			IS.cil2ID = IS.cil2ID - 1
			if IS.cil2ID <= 0 then
				IS.cil2ID = table.getn(IS.cile2IN)
			end
			IS:NastavCil2(IS.cil2ID,true)
			IS:NastavCislo(IS.cil2ID)
			SysCall("ScenarioManager:ShowAlertMessageExt", "MSV IS nastaveni cile 2:", "ID: "..IS.cil2ID.." CIL: "..IS.cile2IN[IS.cil2ID],0.2)
		elseif IS.stav == "linka" then
			IS.linkaID = IS.linkaID - 1
			if IS.linkaID <= 0 then
				IS.linkaID = table.getn(IS.IS.linkyIN)
			end
			IS:NastavLinku(IS.linkaID,true)
			IS:NastavCislo(IS.linkaID)
			SysCall("ScenarioManager:ShowAlertMessageExt", "MSV IS nastaveni linky:", "ID: "..IS.linkaID.." LINKA: "..IS.linkyIN[IS.linkaID],0.2)
		end
	end,
	Potvrzeni = function(self)
		IS.casMenu = 0
		if IS.stav == "sleep" then
			IS.stav = "cil1"
		elseif IS.stav == "cil1" then
			IS:NastavCislo(IS.cil2ID)
			if IS.cileIsWhole[IS.cil1ID] == "false" then
				IS.stav = "cil2"
			end
			SysCall("ScenarioManager:ShowAlertMessageExt", "MSV IS nastaveni cile 2:", "Zapisuji ID: "..IS.cil1ID.." CIL: "..IS.cile1IN[IS.cil1ID],0.2)
		elseif IS.stav == "cil2" then
			IS:NastavCislo(IS.linkaID)
			IS.stav = "linka"
			SysCall("ScenarioManager:ShowAlertMessageExt", "MSV IS nastaveni linky:", "Zapisuji ID: "..IS.cil2ID.." CIL: "..IS.cile2IN[IS.cil2ID],0.2)
		elseif IS.stav == "linka" then
			IS:NastavCislo(IS.cil1ID)
			IS.stav = "cil1"
			SysCall("ScenarioManager:ShowAlertMessageExt", "MSV IS nastaveni cile 1:", "Zapisuji ID: "..IS.linkaID.." LINKA: "..IS.linkyIN[IS.linkaID],0.2)
		end
	end,
	SipkaBok = function(self)
		IS.casMenu = 0
		if IS.stav == "sleep" then
			IS.stav = "cil1"
		elseif (IS.stav == "cil1" or IS.stav == "cil2") and IS.cileIsWhole[IS.cil1ID] == "false" then
			local cil1 = IS.cil1ID
			local cil2 = IS.cil2ID
			IS.cil1ID = cil2
			IS.cil2ID = cil1
			IS:NastavCil1(IS.cil1ID)
			IS:NastavCil2(IS.cil2ID)
			if IS.stav == "cil1" then
				IS:NastavCislo(IS.cil1ID)
			elseif IS.stav == "cil2" then
				IS:NastavCislo(IS.cil2ID)
			end
		end
	end,
	VymazVse = function(self)
		IS:Zapis("MSVlinkaOUT","",false,false)
		IS:Zapis("MSVlinkaIN","",false,false)
		IS:Zapis("MSVcil1OUT","",false,false)
		IS:Zapis("MSVcil1IN","",false,false)
		IS:Zapis("MSVcil2OUT","",false,false)
		IS:Zapis("MSVcil2IN","",false,false)
		IS:Zapis("MSVcilCelaPlochaOUT","",false,false)
		IS:Zapis("MSVid","",false,false)
	end
}

function NactiIS()
	local souborCile = io.open("Assets/Smejki/CD460pack01/RailVehicles/Electric/Common/MSV/cile.ci4", "rb")
	local souborLinky = io.open("Assets/Smejki/CD460pack01/RailVehicles/Electric/Common/MSV/linky.lin", "rb")
	
	if souborCile then
		souborCile:close()
		for radek in io.lines("Assets/Smejki/CD460pack01/RailVehicles/Electric/Common/MSV/cile.ci4") do
			if not string.find(radek,"#") then
				radek = string.fromutf8(radek)
				local splitted = split(radek,"|")
				local cilIN = splitted[1]
				local cilOUT = splitted[2]
				local cilIS = splitted[3]
				IS.cile1IN[table.getn(IS.cile1IN)+1] = cilIN
				IS.cile1OUT[table.getn(IS.cile1OUT)+1] = cilOUT
				IS.cileIsWhole[table.getn(IS.cileIsWhole)+1] = cilIS
				if IS.cileIsWhole[table.getn(IS.cileIsWhole)] == "false" then
					IS.cile2IN[table.getn(IS.cile2IN)+1] = cilIN
					IS.cile2OUT[table.getn(IS.cile2OUT)+1] = cilOUT
				end
			end
			if table.getn(IS.cile1IN) == 99 then
				break
			end
		end
	else
		IS.cile1IN[1] = "PRÁZDNÝ DISPLEJ"
		IS.cile1OUT[1] = " "
		IS.cileIsWhole[1] = "false"
		IS.cile2IN[1] = "PRÁZDNÝ DISPLEJ"
		IS.cile2OUT[1] = " "
	end
	if souborLinky then
		souborLinky:close()
		for radek in io.lines("Assets/Smejki/CD460pack01/RailVehicles/Electric/Common/MSV/linky.lin") do
			if not string.find(radek,"#") then
				radek = string.fromutf8(radek)
				local splitted = split(radek,"|")
				local linkaIN = string.upper(splitted[1])
				local linkaOUT = string.upper(splitted[2])
				IS.linkyIN[table.getn(IS.linkyIN)+1] = linkaIN
				IS.linkyOUT[table.getn(IS.linkyOUT)+1] = linkaOUT
			end
			if table.getn(IS.linkyIN) == 99 then
				break
			end
		end
	else
		IS.linkyIN[1] = "NENÍ LINKA"
		IS.linkyOUT[1] = " "
	end
	ZpravaDebug("Nacteno "..table.getn(IS.cile1IN).." cilu a "..table.getn(IS.linkyIN).." linek do IS!")
end

NactiIS()

caskroku = (math.random(8,12)/20)
caszkroku = (math.random(3,7)/20)


rp_270A = math.random(220,320)
rp_350A = math.random(300,400)
rp_420A = math.random(370,470)
rp_480A = math.random(430,530)
rp_570A = math.random(520,620)


-- srv = net.createConnection(net.TCP, 0)
-- srv:on("receive", function(sck, c) Print(c) end)
-- srv:on("connection", function(sck, c)
--   -- 'Connection: close' rather than 'Connection: keep-alive' to have server 
--   -- initiate a close of the connection after final response (frees memory 
--   -- earlier here), https://tools.ietf.org/html/rfc7230#section-6.6 
--   sck:send("GET /get HTTP/1.1\r\nHost: overuziv.jachyhm.cz\r\nConnection: close\r\nAccept: */*\r\n\r\n")
-- end)
-- srv:connect(80,"overuziv.jachyhm.cz")


function DefinujPromene()
	pozadavekNaFastStart = false
	PolohaKlice = 0
	klic = 0
	OsvetleniVozu = 0
	DalkovaSv = 0
	KabinaPrist = 0
	Picka = 0
	HlavniVypinac = 0
	levaPozBil = false
	levaPozBilVPKC = false
	levaPozCer = false
	levaPozCerVPKC = false
	pravaPozBil = false
	pravaPozBilVPKC = false
	pravaPozCer = false
	pravaPozCerVPKC = false
	horniPozBilVKPC = false
	soupatkoVZ = 0
	JeZivak1 = 0
	CasZivak = 0
	ZivakStary = 0
	ZivakReset = 1
	KlicNaDruheKabine = 0
	RizenaRidici = "rizena"
	gPredniSberacControl = 0
	gPredniSberacOld = 0
	gCommonTimer = 0
	gPredniSmetak = 0
	gZadniSmetak = 0 
	gZadniSberacControl = 0
	gZadniSberacOld = 0
	casstupnu = 0
	gNejblizsiNavestidlo = -1			-- vzdalenost k nejblizsimu navestidlu s prenosem kodu (max 1250m)
	Smer = 0
	JeNouzovyRadic = 0
	ventilatoryTM = 0
	ventilatoryStrecha = 0
	zvukhasler = 0
	casproud = 0
	proud = 0
	MaPredniPantograf = "haha"
	UzJsiZjistovalPanto = false
	PrvniEDBorVzduch = "nichts"
	ZamekHLvyp = 0
	hh = 0
	necojakomm = 0
	mm = 0
	ss = 0
	dennicas = 0
	cislovlaku="xxxxxx"
	vysilackaObrazovka = 0
	vysilackaObrazovkaStara = 1
	vysilackaboot = 0
	vysilackablikani = 0
	vysilackaprihlasena = 0
	cislovzhasnute = 0
	tlacitko8 = 0
	menupozice=1
	tlacitko1 = 0
	tlacitkoEnter = 0
	cislovlakubuff = 0
	tlacitkoDelete = 0
	tlacitko0 = 0
	tlacitko2 = 0
	tlacitko3 = 0
	tlacitko4 = 0
	tlacitko5 = 0
	tlacitko6 = 0
	tlacitko7 = 0
	tlacitko9 = 0
	pomkomp = 0
	hlkomp = 0
	bylpojistovak = 0
	SvetlaAI = 1
	SmerAI = 0
	PantoJimkaZKom = 0
	PantoJimkaZHJ = 0
	KompresorPrep = 0
	mgp = 0
	mgs = 0
	mg = 0
	mgdocasny = 0
	failvykon = 0
	failmg = 0
	skluzmg = 0
	skluzWheelSlip = 0
	P01 = 0
	SnizenyVykonVozu = false
	-- TlakovyBlokJizdy = false
	VyberJiskry = 0
	deltaSpeedMinula = 0
	baterie = 0
	deltaSpeed = 0
	predMasinou = 0
	zaMasinou = 0
	nezobrazujValce = false
	matrosov = false
	gDebug = true
	gTimeVentilatory = 0
	gKlicTady = false
	casSkluz = 0
	diagNU = 0
	diagPU = 0
	diagHV = 0
	skluzDiag = 0
	niDiag = 0
	blokKrokSkluz = false
	PP = 0
	ZP = 0
	pozadavekNaZapisKlice = false
	return(true)
end

function PoleFCE (list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end

function Initialise ()
	Napoveda("Inicializace",1)
	Call ("KourP1L:SetEmitterActive",0 ) 
	Call ("KourP2L:SetEmitterActive",0 ) 
	Call ("KourP1P:SetEmitterActive",0 ) 
	Call ("KourP2P:SetEmitterActive",0 ) 
	Call ( "Zarovka1:Activate", 0 )
	Call ( "Zarovka2:Activate", 0 )
	Call ( "Zarivka1:Activate", 0 )
	Call ( "Zarivka2:Activate", 0 )
	Call ( "Zarivka3:Activate", 0 )
	Call ( "CabLight1:Activate", 0 )
	Call ( "CabLight2:Activate", 0 )
	Call ( "SvetloRychlomer:Activate", 0 )
	Call ( "SvetloBudik1:Activate", 0 )
	Call ( "SvetloBudik2:Activate", 0 )
	Call ( "SvetloBudik3:Activate", 0 )
	Call ( "SvetloBudik4:Activate", 0 )
	Call ( "DalkovePrave:Activate", 0 )
	Call ( "DalkoveLeve:Activate", 0 )
	Call ( "ActivateNode","dalkaclevy",0)
	Call ( "ActivateNode","dalkacpravy",0)
	Call ( "ActivateNode","reflektor_rozsviceny",0) 
	Call ( "PozickaHorniBi:Activate", 0 )
	Call ( "PozickaLevaBi:Activate", 0 )
	Call ( "PozickaLevaCr:Activate", 0 )
	Call ( "PozickaPravaBi:Activate", 0 )
	Call ( "PozickaPravaCr:Activate", 0 )
	Call ( "ActivateNode", "pozickalevaBi", 0 ) 
	Call ( "ActivateNode", "pozickalevaCr", 0 ) 
	Call ( "ActivateNode", "pozickapravaBi", 0 ) 
	Call ( "ActivateNode", "pozickapravaCr", 0 ) 
	Call("ZimniJiskra:Activate",0)
	Call("ZimniJiskra1:Activate",0)
	Call("ZimniJiskra2:Activate",0)
	Call("ZimniJiskra3:Activate",0)
	Call("ZimniJiskra4:Activate",0)
	Call ("SetControlValue","JeNouzovyRadic",0,0)
	RocniObdobi = SysCall("ScenarioManager:GetSeason")
	DefinujPromene()
	Call("PozickaHorniBi:SetRange",12)
	Call("PozickaLevaCr:SetRange",12)
	Call("PozickaLevaBi:SetRange",12)
	Call("PozickaPravaCr:SetRange",12)
	Call("PozickaPravaBi:SetRange",12)
	Call("DalkovePrave:SetRange",35)
	Call("DalkoveLeve:SetRange",35)
	Call("Zarovka1:SetRange",5)
	Call("Zarovka2:SetRange",5)
	Call("Zarivka1:SetRange",8)
	Call("Zarivka2:SetRange",8)
	Call("Zarivka3:SetRange",8)
	Call("CabLight1:SetRange",8)
	Call("SvetloBudik1:SetRange",0.07)
	Call("SvetloBudik2:SetRange",0.1)
	Call("SvetloBudik3:SetRange",0.07)
	Call("SvetloBudik4:SetRange",0.07)
	Call("SvetloRychlomer:SetRange",0.07)
	Call("CabLight2:SetRange",0.5)
	Call("ZimniJiskra:SetRange",200)
	Call("ZimniJiskra2:SetRange",200)
	Call("ZimniJiskra3:SetRange",200)
	Call("ZimniJiskra4:SetRange",200)
	Call ("BeginUpdate")
	Call("SetControlValue","VirtualBrake",0,0)
	Call("SetControlValue","UserVirtualReverser",0,1)
	Call("SetControlValue","VirtualThrottleAndBrake",0,1)
	Call("SetControlValue","VirtualBrake",0,0.86)
	Call("SetControlValue","UserVirtualReverser",0,2)
	Call("SetControlValue","VirtualThrottleAndBrake",0,0)
	MaPredniPantograf = Call("ControlExists","PantoPredni",0)
	predMasinou = Call("SendConsistMessage",460999,"DUMMY",0)
	zaMasinou = Call("SendConsistMessage",460999,"DUMMY",1)
	Call("SetControlValue","PantographControl",0,0)
	NastavHodnotuSID("pocetJimek", 1, 460993)
	if not bylKS then
		bylKS = true
		if overKS() then
			ksOK = true
		end
	end
end

function GetIDs(numberToDecode)
    local tableOfIDs,i,D={},1
    while numberToDecode > 0 do
        numberToDecode,D=math.floor(numberToDecode/2),math.mod(numberToDecode,2)
        if D == 1 then
          tableOfIDs[i] = true
        end
        i = i + 1
    end
    return tableOfIDs
end

function GetFreeID(tableOfUsedIDs)
	lastID = table.getn(tableOfUsedIDs)
	return lastID + 1
end

function tableContains(tableName, value)
	for k,v in pairs(tableName) do
		if v == value then
			return true
		end
	end
	return false
end

function ZpracujZpravuSID(zprava,argument,smer,nazevCV)
	if Call("GetIsEngineWithKey") == 1 then
		ZpravaDebug("Zpracovavam zpravu ID: "..zprava)
		TF = string.sub( argument,0,string.find( argument,":")-1)
		IDzpravy = tonumber(string.sub(argument,string.find(argument,":")+1))
		hodnotaZpravy = 2^(IDzpravy-1)
		hodnotaCV = Call("GetControlValue",nazevCV,0)
		IDmasinAktiv = GetIDs(hodnotaCV)
		if TF == "1" and IDmasinAktiv[IDzpravy] == nil then
			Call("SetControlValue",nazevCV,0,tonumber(hodnotaCV+hodnotaZpravy))
		elseif TF == "0" then
			-- vrat = 0
			-- for k,v in pairs(IDmasinAktiv) do
			-- 	if k ~= IDzpravy then
			-- 		vrat = vrat + v
			-- 	end
			-- end
			--TEST ALTERNATIVY
			hodnotaCV = hodnotaCV - 2^(IDzpravy-1)
			Call("SetControlValue",nazevCV,0,hodnotaCV)--vrat misto hodnotaCV
		end
	else
		Call("SendConsistMessage",zprava,argument,smer)
	end
end

function NastavHodnotuSID(nazevCV,hodnota,cisloZpravy)
	if hodnota == 1 then
		hodnotaCV = Call("GetControlValue",nazevCV,0)
		IDmasinAktiv = GetIDs(hodnotaCV)
		if IDmasinAktiv[ID] == nil then
			if Call("GetIsEngineWithKey") == 1 then
				Call("SetControlValue",nazevCV,0,tonumber(hodnotaCV+2^(ID-1)))
			else
				Call("SendConsistMessage",cisloZpravy,"1:"..ID,1)
				Call("SendConsistMessage",cisloZpravy,"1:"..ID,0)
			end
		end
	elseif hodnota == 0 then
		hodnotaCV = Call("GetControlValue",nazevCV,0)
		IDmasinAktiv = GetIDs(hodnotaCV)
		if IDmasinAktiv[ID] ~= nil then
			if Call("GetIsEngineWithKey") == 1 then
				-- vrat = 0
				-- for k,v in pairs(IDmasinAktiv) do
				-- 	if k ~= ID then
				-- 		vrat = vrat + v
				-- 	end
				-- end
				--TEST ALTERNATIVY
				hodnotaCV = hodnotaCV - 2^(ID-1)
				Call("SetControlValue",nazevCV,0,hodnotaCV)--vrat misto hodnotaCV
			else
				Call("SendConsistMessage",cisloZpravy,"0:"..ID,1)
				Call("SendConsistMessage",cisloZpravy,"0:"..ID,0)
			end
		end
	end
end

--zpravy
	-- 460101 - kl?? na druh? kabin?
	-- 460102 - vypnutí HV při nadproudu při nesprávném směru
	-- 460105 - dvereP
	-- 460106 - osv?tlen? vozu
	-- 460108 - zadost o otevreni dveri z nerizene HV
	-- 460109 - dvereL
	-- 460110 - jizda na odporech ve vlaku
	-- 460111 - FastStart
	-- 460114 - Ovladani DveriL
	-- 460115 - Ovladani DveriP
	-- 460116 - MGen priprava
	-- 460117 - startujici MGen v souprave
	-- 460118 - bezici MGEn v souprave
	-- 460119 - inverze dveri Leve/Prave na motorovych vozech - bohuzel predpoklada vzdy cela od sebe
	-- 460120 - porucha ve vlaku
	-- 460121 - ex. baterie ve vlaku
	-- 460122 - pomkomp ve vlaku
	-- 460991 - dira do potrubi
	-- 460992 - synchronizacni rele
	-- 460993 - pocet jimek na vlaku
	-- 460994 - X poloha sousedniho tornada
	-- 460995 - Y poloha sousedniho tornada
	-- 460997 - ID nabalovani
	-- 460998 - zadost o ID
	-- 460999 - DUMMY
function OnConsistMessage(zprava,argument,smer)
	if zprava ~= 460995 and zprava ~= 460994 and zprava ~= 460993 and zprava ~= 460992 and zprava ~= 460991 and zprava ~= 460997 and zprava ~= 460105 and zprava ~= 460109 and zprava ~= 460108 and zprava ~= 460114 and zprava ~= 460115 and zprava ~= 460116 and zprava ~= 460117 and zprava ~= 460118 and zprava ~= 460119 then
		if smer == 1 and zaMasinouTornado then
			stavPoslane = Call("SendConsistMessage",zprava,argument,1)
		elseif smer == 0 and predMasinouTornado then
			stavPoslane = Call("SendConsistMessage",zprava,argument,0)
		elseif predMasinouTornado == nil or zaMasinouTornado == nil then
			table.insert(poleKOdeslani, {zprava, argument, smer})
		end
	end
	ZpravaDebug("Prijata message: "..zprava.." s argumentem: "..argument.." ve smeru: "..smer)
	if zprava == 460101 then
		if argument == "1" then
			KlicNaDruheKabine = 1
		end
		if argument == "0" then
			KlicNaDruheKabine = 0
		end
	end
	if zprava == 460102 then
		if vykon ~= 0 then
			Call ("SetControlValue", "HlavniVypinac", 0, 0)
			ZamekHLvyp = 1
		end
	end
	if zprava == 460105 then
		if argument == "00" then
			dvereLeveZeSoupravy = false
			dvereLevePridrznyStav = false
		elseif argument == "01" then
			dvereLeveZeSoupravy = false
			dvereLevePridrznyStav = true
		elseif argument == "11" then
			dvereLeveZeSoupravy = true
			dvereLevePridrznyStav = true
		end
		Call("SendConsistMessage",460109,argument,smer)
	end
	if zprava == 460106 then
		if argument == "1" then
			OsvetleniVozu = 1
		end
		if argument == "2" then
			OsvetleniVozu = 2
		end
		if argument == "0" then
			OsvetleniVozu = 0
		end
	end
	if zprava == 460108 then
		if argument == "leve" then
			argument = "prave"
			if RizenaRidici == "ridici" then
				Call("SetControlValue","DverePrepPravy",0,2)
				Napoveda("Nemuzes nechat nastupovat cestujici zavrenymi dvermi! Prestavuji pravou klicku do polohy otevreno-prave!",1)
			else
				Call("SendConsistMessage",460108,argument,smer)
			end
		elseif argument == "prave" then
			argument = "leve"
			if RizenaRidici == "ridici" then
				Call("SetControlValue","DverePrepLevy",0,1)
				Napoveda("Nemuzes nechat nastupovat cestujici zavrenymi dvermi! Prestavuji levou klicku do polohy otevreno!",1)
			else
				Call("SendConsistMessage",460108,argument,smer)
			end
		end
	end
	if zprava == 460109 then
		if argument == "00" then
			dverePraveZeSoupravy = false
			dverePravePridrznyStav = false
		elseif argument == "01" then
			dverePraveZeSoupravy = false
			dverePravePridrznyStav = true
		elseif argument == "11" then
			dverePraveZeSoupravy = true
			dverePravePridrznyStav = true
		end
		Call("SendConsistMessage",460105,argument,smer)
	end
	if zprava == 460110 then
		ZpracujZpravuSID(zprava,argument,smer,"jizdaNaOdporechVeVlaku")
	end
	if zprava == 460111 then
		pozadavekNaFastStart = 2
	end
	if zprava == 460114 then
		ZpracujZpravuSID(zprava,argument,smer,"DvereLeveVSouprave")
	end
	if zprava == 460115 then
		ZpracujZpravuSID(zprava,argument,smer,"DverePraveVSouprave")
	end
	if zprava == 460116 then
		ZpracujZpravuSID(zprava,argument,smer,"mgPriprava")
	end
	if zprava == 460117 then
		ZpracujZpravuSID(zprava,argument,smer,"mgVS")
	end
	if zprava == 460118 then
		ZpracujZpravuSID(zprava,argument,smer,"mg")
	end
	if zprava == 460119 then
		if argument == "obrat" then
			otocDvere = true
			Call("SendConsistMessage",460119,"nech",smer)
		else
			Call("SendConsistMessage",460119,"obrat",smer)
		end
	end
	if zprava == 460120 then
		ZpracujZpravuSID(zprava,argument,smer,"poruchaVeVlaku")
	end
	if zprava == 460122 then
		ZpracujZpravuSID(zprava,argument,smer,"pomkompVS")
	end
	if zprava == 460991 then
		ZpracujZpravuSID(zprava,argument,smer,"diraDoPotrubi")
	end
	if zprava == 460992 then
		ZpracujZpravuSID(zprava,argument,smer,"synchronizacniRele")
	end
	if zprava == 460993 then
		ZpracujZpravuSID(zprava,argument,smer,"pocetJimek")
	end
	if zprava == 460994 then
		prijateZpravy[smer+1] = {}
		prijateZpravy[smer+1]["x"] = argument
		xZS = argument
	end
	if zprava == 460995 then
		if prijateZpravy[smer+1]["x"] ~= nil then
			local yZS = argument
			x, _, y = Call("*:getNearPosition")
			ZpravaDebug("yZS: "..yZS)
			ZpravaDebug("xZS: "..xZS)
			ZpravaDebug("y: "..y)
			ZpravaDebug("x: "..x)
			local vzdalenost = math.sqrt((xZS-x)^2 + (yZS-y)^2)
			if vzdalenost < maxVzdalenost then
				if smer == 1 then
					predMasinouTornado = true
					predMasinouTornadoCas = nil
				else
					zaMasinouTornado = true
					zaMasinouTornadoCas = nil
				end
			else
				if smer == 1 then
					predMasinouTornado = false
					predMasinouTornadoCas = nil
				else
					zaMasinouTornado = false
					zaMasinouTornadoCas = nil
				end
			end
		else
			prijateZpravy[smer+1] = {}
			prijateZpravy[smer+1]["y"] = argument
		end
	end
	if zprava == 460997 then
		ID = GetFreeID(GetIDs(tonumber(argument)))
		i = 2^(ID-1)
		if (smer == 0 and predMasinouTornado) or (smer == 1 and zaMasinouTornado) then
			Call("SendConsistMessage",460997,tostring(tonumber(argument)+i),smer)
		end
		Call("SetControlValue","ID",0,ID)
		ZpravaDebug("Posilam zpravu 460997! ve smeru "..smer)
	end
	if zprava == 460998 then
		if (smer == 0 and not predMasinouTornado) or (smer == 1 and not zaMasinouTornado) then
			Call("SendConsistMessage",460997,"1",ObratSmer(smer))
			Call("SendConsistMessage",460119,"obrat",ObratSmer(smer))
			otocDvere = false
			ID = 1
			Call("SetControlValue","ID",0,ID)
			ZpravaDebug("Prisla 460998 a jsem koncovy vuz! Posilam 460997 ve smeru "..ObratSmer(smer))
		end
	end
end

function ObratSmer(smer)
	if smer == 0 then
		return(1)
	elseif smer == 1 then
		return(0)
	end
end

function OnCustomSignalMessage ( Parameter )
	local NO
	local vzdalenost
	lastSignalCode = Call("GetControlValue", "SkutecnyKod", 0)
	NO = tonumber(string.sub(Parameter, 1, 2))
	vzdalenost = tonumber(string.sub(Parameter, 3))
	if NO == -1 then
		gNejblizsiNavestidlo = -1
		Call("SetControlValue","SkutecnyKod",0,0)
	end
	if vzdalenost > 0 then
		if (vzdalenost < gNejblizsiNavestidlo) or (math.abs(gNejblizsiNavestidlo - vzdalenost) < 2) or (gNejblizsiNavestidlo < 0) then
			gNejblizsiNavestidlo = vzdalenost
		end
	end
	if gNejblizsiNavestidlo == vzdalenost then
		if NO == 15 or NO == 30 then					-- Stuj
			Call("SetControlValue","SkutecnyKod",0,3)
		elseif NO == 17 then							-- Vystraha
			Call("SetControlValue","SkutecnyKod",0,4)
		elseif NO == 16 then							-- Volno
			Call("SetControlValue","SkutecnyKod",0,2)
		elseif NO >= 19 and NO <= 24 then				-- omezene rychlosti
			Call("SetControlValue","SkutecnyKod",0,1)
		else											-- nekodovane navesti
			Call("SetControlValue","SkutecnyKod",0,0)
		end
	end
	if gNejblizsiNavestidlo < 1 and not zablokujDalsiZmenyLVZ then
		prujezdKolemNavestidla = true
		zablokujDalsiZmenyLVZ = true
	elseif gNejblizsiNavestidlo > 1 then
		zablokujDalsiZmenyLVZ = nil
	end
end

function VypniVse()
	Call ( "Zarovka1:Activate", 0 )
	Call ( "Zarovka2:Activate", 0 )
	Call ( "Zarivka1:Activate", 0 )
	Call ( "Zarivka2:Activate", 0 )
	Call ( "Zarivka3:Activate", 0 )
	Call ( "DalkovePrave:Activate", 0 )
	Call ( "DalkoveLeve:Activate", 0 )
	Call ( "ActivateNode","dalkaclevy",0)
	Call ( "ActivateNode","dalkacpravy",0)
	Call ( "ActivateNode","reflektor_rozsviceny",0) 
	Call ( "PozickaHorniBi:Activate", 0 )
	Call ( "CabLight1:Activate", 0 )
	Call ( "CabLight2:Activate", 0 )
	Call ( "SvetloRychlomer:Activate", 0 )
	Call ( "SvetloBudik1:Activate", 0 )
	Call ( "SvetloBudik2:Activate", 0 )
	Call ( "SvetloBudik3:Activate", 0 )
	Call ( "SvetloBudik4:Activate", 0 )
	Call ( "PozickaLevaBi:Activate", 0 )
	Call ( "PozickaLevaCr:Activate", 0 )
	Call ( "PozickaPravaBi:Activate", 0 )
	Call ( "PozickaPravaCr:Activate", 0 )
	Call ( "ActivateNode", "pozickalevaBi", 0 ) 
	Call ( "ActivateNode", "pozickalevaCr", 0 ) 
	Call ( "ActivateNode", "pozickapravaBi", 0 ) 
	Call ( "ActivateNode", "pozickapravaCr", 0 ) 
end

function RozsvitSvetlo(corozsvit,plati)
	Call (corozsvit..":Activate",plati)
end

function AktivujNode(ktery,plati)
	Call("ActivateNode",ktery,plati)
end

function OsvetleniVozuF(stupen)
	if stupen == 0 then
		RozsvitSvetlo("Zarovka1",0)
		RozsvitSvetlo("Zarovka2",0)
		RozsvitSvetlo("Zarivka1",0)
		RozsvitSvetlo("Zarivka2",0)
		RozsvitSvetlo("Zarivka3",0)
	end
	if stupen == 1 then
		RozsvitSvetlo("Zarovka1",1)
		RozsvitSvetlo("Zarovka2",1)
		RozsvitSvetlo("Zarivka1",0)
		RozsvitSvetlo("Zarivka2",0)
		RozsvitSvetlo("Zarivka3",0)
	end
	if stupen == 2 then
		RozsvitSvetlo("Zarivka1",1)
		RozsvitSvetlo("Zarivka2",1)
		RozsvitSvetlo("Zarivka3",1)
	end
end	

function DalkovaSvF(stupen,delkaUpd,baterie)
	local pribytek = delkaUpd * 7
	local dalkoveLeve = false
	local dalkovePrave = false

	local barvaDalkovaDolni = {0.7385892,1,1}
	local barvaDalkovaHorni = {1,1,0.7}

	local barvaDalkovaDolniZ = {1,1,0.1576764}
	local barvaDalkovaHorniZ = {1,0.6597511,0}
	
	if stupen == 0 or baterie ~= 1 then
		AktivujNode("dalkaclevy",0)
		AktivujNode("dalkacpravy",0)
	elseif stupen == 1 then
		dalkoveLeve = true
		dalkovePrave = true
	end

	if dalkoveLeve and stavDalkoveLeve < 5 then
		stavDalkoveLeve = stavDalkoveLeve + (math.sqrt(5-stavDalkoveLeve)*pribytek/5)
	elseif not dalkoveLeve and stavDalkoveLeve > 0 then
		stavDalkoveLeve = stavDalkoveLeve - (math.sqrt(stavDalkoveLeve)*pribytek/5)
	end

	if dalkovePrave and stavDalkovePrave < 5 then
		stavDalkovePrave = stavDalkovePrave + (math.sqrt(5-stavDalkovePrave)*pribytek/5)
	elseif not dalkovePrave and stavDalkovePrave > 0 then
		stavDalkovePrave = stavDalkovePrave - (math.sqrt(stavDalkovePrave)*pribytek/5)
	end

	if stavDalkoveLeve >= 5 then
		AktivujNode("dalkaclevy",1)
	else
		AktivujNode("dalkaclevy",0)
	end

	if stavDalkovePrave >= 5 then
		AktivujNode("dalkacpravy",1)
	else
		AktivujNode("dalkacpravy",0)
	end

	stavDalkoveLeveZapis = stavDalkoveLeve/3
	stavDalkovePraveZapis = stavDalkovePrave/3

	if MaPredniPantograf == 1 then
		Call("DalkoveLeve:SetColour",barvaDalkovaDolniZ[1]*stavDalkoveLeveZapis,barvaDalkovaDolniZ[2]*stavDalkoveLeveZapis,barvaDalkovaDolniZ[3]*stavDalkoveLeveZapis)
		if stavDalkoveLeveZapis > 0 then
			Call("DalkoveLeve:Activate",1)
		else 
			Call("DalkoveLeve:Activate",0)
		end

		Call("DalkovePrave:SetColour",barvaDalkovaDolniZ[1]*stavDalkovePraveZapis,barvaDalkovaDolniZ[2]*stavDalkovePraveZapis,barvaDalkovaDolniZ[3]*stavDalkovePraveZapis)
		Call("DalkovePrave:Activate",1)
		if stavDalkovePraveZapis > 0 then
			Call("DalkovePrave:Activate",1)
		else 
			Call("DalkovePrave:Activate",0)
		end
	else
		Call("DalkoveLeve:SetColour",barvaDalkovaDolni[1]*stavDalkoveLeveZapis,barvaDalkovaDolni[2]*stavDalkoveLeveZapis,barvaDalkovaDolni[3]*stavDalkoveLeveZapis)
		Call("DalkoveLeve:Activate",1)
		if stavDalkoveLeveZapis > 0 then
			Call("DalkoveLeve:Activate",1)
		else 
			Call("DalkoveLeve:Activate",0)
		end

		Call("DalkovePrave:SetColour",barvaDalkovaDolni[1]*stavDalkovePraveZapis,barvaDalkovaDolni[2]*stavDalkovePraveZapis,barvaDalkovaDolni[3]*stavDalkovePraveZapis)
		Call("DalkovePrave:Activate",1)
		if stavDalkovePraveZapis > 0 then
			Call("DalkovePrave:Activate",1)
		else 
			Call("DalkovePrave:Activate",0)
		end
	end
end

function KabinaPristF(stupen)
	if stupen == 1 then
		RozsvitSvetlo("CabLight1",1)
		RozsvitSvetlo("SvetloBudik1",0)
		RozsvitSvetlo("SvetloBudik2",0)
		RozsvitSvetlo("SvetloBudik3",0)
		RozsvitSvetlo("SvetloBudik4",0)
		RozsvitSvetlo("SvetloRychlomer",0)
	end
	if stupen == 2 then
		RozsvitSvetlo("SvetloBudik1",1)
		RozsvitSvetlo("SvetloBudik2",1)
		RozsvitSvetlo("SvetloBudik3",1)
		RozsvitSvetlo("SvetloBudik4",1)
		RozsvitSvetlo("SvetloRychlomer",1)
		RozsvitSvetlo("CabLight1",0)
	end
	if stupen == 0 then
		RozsvitSvetlo("SvetloBudik1",0)
		RozsvitSvetlo("SvetloBudik2",0)
		RozsvitSvetlo("SvetloBudik3",0)
		RozsvitSvetlo("SvetloBudik4",0)
		RozsvitSvetlo("SvetloRychlomer",0)
		RozsvitSvetlo("CabLight1",0)
	end
end

function Pozicka(ktera,barva,plati)
	pozickastav = ktera..barva..plati
	RozsvitSvetlo("Pozicka"..ktera..barva,plati)
	AktivujNode("pozicka"..ktera..barva, plati)
end

-- function rozloz(cislo,misto)
-- 	misto = misto - 1
-- 	misto = 10^misto
-- 	cislo = cislo / misto
-- 	cislo = math.floor(cislo)
-- 	cislo = cislo / 10
-- 	_,cislo = math.modf(cislo)
-- 	cislo = cislo * 10
-- 	vysledek = math.floor(cislo)
-- end

function decToBitsCount(cislo)
	-- local vysledek = ""
	local pocet = 0
	while cislo > 0 do
		_, zbytek = divMod(cislo, 2)
		if zbytek == 1 then
			pocet = pocet + 1
		end
		-- vysledek = zbytek..vysledek
		cislo = (cislo - zbytek) / 2
	end
	return pocet --, vysledek
end

function VypniHVaVynutRestart()
	Call ("SetControlValue", "HlavniVypinac", 0, 0)
	ZamekHLvyp = 1
	Call ("SetControlValue", "povel_HlavniVypinac", 0, 0)
end

function VratRadic(radicMain,radicOkno)
	if radicMain >= 0 then
		if math.min(radicOkno,radicMain*2) < 1 then
			return(0)
		elseif math.max(radicOkno,radicMain*2) > 1 then
			return(1)
		else
			return(0.5)
		end
	else
		return(radicMain)
	end
end

function ToBolAndBack (hodnota,hranice)
	if hodnota == true then return(1) elseif hodnota == false then return(0) else
		if hranice ~= nil then
			if hodnota > hranice then
				return(true) 
			else
				return(false)
			end
		else
			if hodnota > 0.5 then
				return(true)
			else
				return(false)
			end
		end
	end
end

function VratTCh(gRegulatorTrCh)
	local stupenTrCh = 0
	local cele = ""
	local zbytek = ""
	local vratRegulator = 0
	local vypoctenaTrCh = 0
	if gRegulatorTrCh > 0 then
		stupenTrCh = gRegulatorTrCh/0.05
		cele, zbytek = divMod(stupenTrCh,1) 
		if zbytek ~= 0 then
			if zbytek > 0.5 then
				stupenTrCh = cele + 1
			else 
				stupenTrCh = cele
			end
		end
	end
	if gRegulatorTrCh < 0 then
		stupenTrCh = gRegulatorTrCh/0.25
		cele, zbytek = divMod(stupenTrCh,1)
		if zbytek ~= 0 then
			if zbytek < -0.5 then
				stupenTrCh = cele - 1
			else
				stupenTrCh = cele
			end
		end
	end
	local speed = math.abs(Call("GetSpeed"))
	if stupenTrCh > 0 and not pojezdVDepu then
		vypoctenaTrCh = ((gMax_kN[stupenTrCh]*((math.exp(gKoeficient[stupenTrCh]*(speed+gOffsetX[stupenTrCh])))+gZvetseni[stupenTrCh]))+gOffsetY[stupenTrCh])
		vratRegulator = vypoctenaTrCh/gAbsolutniMax_kN
		if vratRegulator > 1 then
			vratRegulator = 1
		end
	elseif stupenTrCh < 0 and not pojezdVDepu then
		speed = speed * 3.6
		if stupenTrCh == -1 then
			vypoctenaTrCh = ((-250-speed)/(speed+2))+27
			--vypoctenaTrCh = -0.5
		elseif stupenTrCh == -2 then
			vypoctenaTrCh = ((-1000-speed)/((2*speed)+2))+60
			--vypoctenaTrCh = -1
		elseif stupenTrCh == -3 then
			vypoctenaTrCh = ((-1000-speed)/((2*speed)+2))+80
		elseif stupenTrCh <= -4 then
			vypoctenaTrCh = ((-1000-speed)/((2*speed)+2))+100
		end
		vratRegulator = -(vypoctenaTrCh/gAbsolutniMax_kN_EDB)*pocetMG
		if pojezdNeschopna then
			vratRegulator = vratRegulator / 2
		end
		--vratRegulator = vypoctenaTrCh
		if vratRegulator > 0 then vratRegulator = 0 end
	elseif pojezdVDepu then
		vratRegulator = (1 / (20+math.exp(speed)))
	end
	return(vratRegulator)
end

function VratProud(gTaznaSila,gZarazenyStupen)
	local shunt = (gZarazenyStupen - 0.8) *20
	local speed = Call("GetSpeed")
	local smer = Call("GetControlValue","Reverser",0)
	local kN = math.abs(gTaznaSila*1300)
	--local kN = (2000*(math.exp(-0.25*(speed-2))))+7
	local k = 1.3
	local a = 106
	local b = 25
	local vratProud = (a*k)*(math.sqrt((((kN+(b*k))^2)/((b*k)^2))-1))
	if gZarazenyStupen < 0 then
		-- kN = (kN/pocetMG)*gAbsolutniMax_kN_EDB
		vratProud = -math.log(1000*math.abs(speed)*3.6)^2*2.69
		if gZarazenyStupen < -0.25 then
			vratProud = vratProud * 1.03
			if gZarazenyStupen < -0.5 then
				vratProud = vratProud * 1.05
				if gZarazenyStupen < -0.75 then
					vratProud = vratProud * 1.05
				end
			end
		end
		-- vratProud = -math.sqrt(kN*10)*math.log(10*speed*3.6)
		-- vratProud = -kN*speed*3.6/math.sqrt(kN)*0.7
	end
	if shunt > 0 and shunt < 1.5 then
		vratProud = 1.18 * vratProud
	elseif shunt > 1.5 and shunt < 2.5 then
		vratProud = 1.29 * vratProud
	elseif shunt > 2.5 and shunt < 3.5 then
		vratProud = 1.39 * vratProud
	elseif shunt > 3.5 then
		vratProud = 1.48 * vratProud
	end
	if smer > 0 and speed < 0 and Call("GetIsEngineWithKey") == 1 then
		vratProud = vratProud * math.max((math.abs(speed)/1.5),1)
		if vratProud > 800 or (math.abs(speed) > 5.55 and vratProud ~= 0) then
			Call ("SetControlValue", "HlavniVypinac", 0, 0)
			ZamekHLvyp = 1
			Call("SendConsistMessage",460102,"",0)
			Call("SendConsistMessage",460102,"",1)
			niDiag = 1
		end
	elseif smer < 0 and speed > 0 and Call("GetIsEngineWithKey") == 1 then
		vratProud = vratProud * math.max((math.abs(speed)/1.5),1)
		if vratProud > 800 or (math.abs(speed) > 5.55 and vratProud ~= 0) then
			Call ("SetControlValue", "HlavniVypinac", 0, 0)
			ZamekHLvyp = 1
			Call("SendConsistMessage",460102,"",0)
			Call("SendConsistMessage",460102,"",1)
			niDiag = 1
		end
	end
	return (vratProud)
end

function PIDcntrlAmp(gHodnotaA,gRucickaA)
	local curvature = Call("GetCurvature")
	local gradient = Call("GetGradient")
	local rozdilGrad = gradient - gGradientLastA
	local rozdilCurv = curvature - gCurvatureLastA
	if rozdilGrad ~= 0 then
		gHodnotaA = gHodnotaA + (rozdilGrad * 10)
	end
	if math.abs(rozdilCurv) > 5 then
		gHodnotaA = gHodnotaA + (math.random(-rozdilCurv,rozdilCurv)*5)
	end
	if math.abs(gHodnotaA-gRucickaA) > 10 and not gProbihaA then
		gHraniceA = ((gHodnotaA-gRucickaA)/math.random(3,10))+gHodnotaA
		if gHraniceA > 1000 then
			gHraniceA = 1000
		elseif gHraniceA < -1000 then
			gHraniceA = -1000
		end
		gProbihaA = true
	elseif math.abs(gHodnotaA-gHraniceA) < 10 and not gProbihaA then
		gHraniceA = gHodnotaA
	elseif math.abs(gHraniceA-gRucickaA) < 2 then
		gProbihaA = false
	elseif math.abs(gHodnotaA-gHODNOTA_LASTa) > 10 then
		gProbihaA = false
	end
	local pribytek = gHraniceA-gRucickaA
	if pribytek >= 0 then pribytek = (pribytek^2)/math.random(80,120) else pribytek = -((pribytek^2)/math.random(80,120)) end
	if pribytek > 70 then pribytek = 70 elseif pribytek < -70 then pribytek = -70 end --Asi není potřeba, mělo jít o "omezení" toho výkyvu. Zbytegné
	local vratHodnotu = gRucickaA + pribytek
	if math.abs(pribytek) < 2 then
		vratHodnotu = gHraniceA
		gProbihaA = false
	end
	gHODNOTA_LASTa = gHodnotaA
	gGradientLastA = gradient
	gCurvatureLastA = curvature
	return(vratHodnotu)
end

function PIDcntrlVolt(gHodnotaV,gRucickaV)
	local curvature = Call("GetCurvature")
	local gradient = Call("GetGradient")
	local rozdilGrad = gradient - gGradientLastV
	local rozdilCurv = curvature - gCurvatureLastV
	if rozdilGrad ~= 0 then
		gHodnotaV = gHodnotaV + (rozdilGrad * 10)
	end
	if math.abs(rozdilCurv) > 5 then
		gHodnotaV = gHodnotaV + (math.random(-rozdilCurv,rozdilCurv)*5)
	end
	if math.abs(gHodnotaV-gRucickaV) > 10 and not gProbihaV then
		gHraniceV = ((gHodnotaV-gRucickaV)/math.random(3,10))+gHodnotaV
		if gHraniceV > 1000 then
			gHraniceV = 1000
		elseif gHraniceV < 0 then
			gHraniceV = 0
		end
		gProbihaV = true
	elseif math.abs(gHodnotaV-gHraniceV) < 10 and not gProbihaV then
		gHraniceV = gHodnotaV
	elseif math.abs(gHraniceV-gRucickaV) < 2 then
		gProbihaV = false
	elseif math.abs(gHodnotaV-gHODNOTA_LASTv) > 10 then
		gProbihaV = false
	end
	local pribytek = gHraniceV-gRucickaV
	if pribytek >= 0 then pribytek = (pribytek^2)/math.random(80,120) else pribytek = -((pribytek^2)/math.random(80,120)) end
	if pribytek > 70 then pribytek = 70 elseif pribytek < -70 then pribytek = -70 end --Asi není potřeba, mělo jít o "omezení" toho výkyvu. Zbytegné
	local vratHodnotu = gRucickaV + pribytek
	if math.abs(pribytek) < 2 then
		vratHodnotu = gHraniceV
		gProbihaV = false
	end
	gHODNOTA_LASTv = gHodnotaV
	gGradientLastV = gradient
	gCurvatureLastV = curvature
	return(vratHodnotu)
end

function PIDcntrlCommon(gHodnota,gRucicka,gProbiha,gHranice,gHODNOTA_LAST,limitBudiku)
	if math.abs(gHodnota-gRucicka) > 10 and not gProbiha then
		gHranice = ((gHodnota-gRucicka)/math.random(3,10))+gHodnota
		if gHranice > limitBudiku then
			gHranice = limitBudiku
		elseif gHranice < 0 then
			gHranice = 0
		end
		gProbiha = true
	elseif math.abs(gHodnota-gHranice) < 10 and not gProbiha then
		gHranice = gHodnota
	elseif math.abs(gHranice-gRucicka) < 2 then
		gProbiha = false
	elseif math.abs(gHodnota-gHODNOTA_LAST) > 10 then
		gProbiha = false
	end
	local pribytek = gHranice-gRucicka
	if pribytek >= 0 then pribytek = (pribytek^2)/math.random(60,100) else pribytek = -((pribytek^2)/math.random(60,100)) end
	if pribytek > limitBudiku / 10 then pribytek = limitBudiku / 10 elseif pribytek < -limitBudiku / 10 then pribytek = -limitBudiku / 10 end --Asi není potřeba, mělo jít o "omezení" toho výkyvu. Zbytegné
	local vratHodnotu = ( gRucicka + pribytek ) / 1000
	if math.abs(pribytek) < 2 then
		vratHodnotu = gHranice / 1000
		gProbiha = false
	end
	return vratHodnotu, gProbiha, gHranice, gHodnota
end

function SvetloDimm(dimValue)
	Call("SvetloBudik1:SetColour",10 - dimValue*10,3.443983 - (dimValue*3.443983),0)
	Call("SvetloBudik2:SetColour",10 - dimValue*10,6.26556 - (dimValue*6.26556),0)
	Call("SvetloRychlomer:SetColour",0,3.48548 - (dimValue*3.48548),0.580913 - (dimValue*0.580913))
	Call("SvetloBudik3:SetColour",0,3.48548 - (dimValue*3.48548),0.580913 - (dimValue*0.580913))
	Call("SvetloBudik4:SetColour",0,3.48548 - (dimValue*3.48548),0.580913 - (dimValue*0.580913))
end

function LVZ(LVZznak,vybaveni,delkaUpd,jeZivak)
	local pribytek = delkaUpd * 30
	local signalCode = 0

	if jeZivak == 1 then
		signalCode = LVZznak
		if prujezdKolemNavestidla and signalCode > 0 then
			prujezdKolemNavestidla = false
			casNekodovani = 0
			if lastSignalCode == 1 then
				nekodujCas = math.random(0,14) + math.random()
				pocetSumuPoPrujezdu = math.random(1,20)
			else
				nekodujCas = math.random(0,2) + math.random()
				pocetSumuPoPrujezdu = math.random(0,1)
			end
		else
			prujezdKolemNavestidla = false
		end

		casNekodovani = casNekodovani + delkaUpd

		if nekodujCas ~= nil then
			if casNekodovani > nekodujCas then
				nekodujCas = nil
				sumPoPrujezduKod = math.random(1,4)
				sumPoPrujezduDelka = math.random(5,10)/10
				sumPoPrujezduDelkaUbehle = 0
			else
				signalCode = 0
			end
		end

		sumPoPrujezduDelkaUbehle = sumPoPrujezduDelkaUbehle + delkaUpd

		if sumPoPrujezduDelka > sumPoPrujezduDelkaUbehle then
			signalCode = sumPoPrujezduKod
		elseif pocetSumuPoPrujezdu > 0 then
			pocetSumuPoPrujezdu = pocetSumuPoPrujezdu - 1
			sumPoPrujezduKod = math.random(1,4)
			sumPoPrujezduDelka = math.random(5,10)/10
			sumPoPrujezduDelkaUbehle = 0
		end

		-- zmenaParametruLast = zmenaParametru
		-- if zmenaParametruLast == nil then
		-- 	zmenaParametruLast = Call("GetCurvature")*Call("GetGradient")
		-- end
		-- zmenaParametru = Call("GetCurvature")*Call("GetGradient")
		-- local chybaLVZ = false
		-- if math.abs(zmenaParametru - zmenaParametruLast) > 0.1 and math.random(0,1) > 0.5 then
		-- 	chybaLVZ = true
		-- end

		-- if chybaLVZ == true and casChyby == nil then
		-- 	casChyby = math.random(1,3)
		-- 	LVZchyba = math.floor(math.random(1,4.9))
		-- end
		-- if casChyby ~= nil then
		-- 	if casChyby > casChybyUbehly then
		-- 		signalCode = LVZchyba
		-- 		casChybyUbehly = casChybyUbehly + delkaUpd
		-- 	else
		-- 		casChyby = nil
		-- 	end
		-- else
		-- 	casChybyUbehly = 0
		-- end

		local zhasleLVZ = false
		if math.random(0,10000) > 9990 and Call("GetSpeed") > 1 then
			zhasleLVZ = true
		end

		if zhasleLVZ and casZhasle == nil then
			casZhasle = math.random(0,2) + math.random()
		end

		if casZhasle ~= nil then
			if casZhasle > casZhasleUbehly then
				signalCode = 0
				casZhasleUbehly = casZhasleUbehly + delkaUpd
			else
				casZhasle = nil
			end
		else
			casZhasleUbehly = 0
		end
	end

	vystraha = false
	stuj = false
	volno = false
	mezikruzi = false
	if signalCode == 1 then
		mezikruzi = true
	elseif signalCode == 2 then
		volno = true
	elseif signalCode == 3 then
		stuj = true
	elseif signalCode == 4 then
		vystraha = true
	end
	
	if not vystraha and stavVystraha > 0 then
		stavVystraha = stavVystraha - pribytek
		if stavVystraha < 0 then stavVystraha = 0 end
	end
	if vystraha and stavVystraha < 10 then
		stavVystraha = stavVystraha + pribytek
		if stavVystraha > 10 then stavVystraha = 10 end
	end

	if not stuj and stavStuj > 0 then
		stavStuj = stavStuj - pribytek
		if stavStuj < 0 then stavStuj = 0 end
	end
	if stuj and stavStuj < 10 then
		stavStuj = stavStuj + pribytek
		if stavStuj > 10 then stavStuj = 10 end
	end

	if not volno and stavVolno > 0 then
		stavVolno = stavVolno - pribytek
		if stavVolno < 0 then stavVolno = 0 end
	end
	if volno and stavVolno < 10 then
		stavVolno = stavVolno + pribytek
		if stavVolno > 10 then stavVolno = 10 end
	end
	
	if not mezikruzi and stavMezikruzi > 0 then
		stavMezikruzi = stavMezikruzi - pribytek
		if stavMezikruzi < 0 then stavMezikruzi = 0 end
	end
	if mezikruzi and stavMezikruzi < 10 then
		stavMezikruzi = stavMezikruzi + pribytek
		if stavMezikruzi > 10 then stavMezikruzi = 10 end
	end
	
	if vybaveni == 0 and stavVybaveni > 0 then
		stavVybaveni = stavVybaveni - pribytek
		if stavVybaveni < 0 then stavVybaveni = 0 end
	end
	if vybaveni == 1 and stavVybaveni < 10 then
		stavVybaveni = stavVybaveni + pribytek
		if stavVybaveni > 10 then stavVybaveni = 10 end
	end

	Call("LVZvystraha:SetColour",1*stavVystraha,0.531*stavVystraha,0)
	Call("LVZvystraha:Activate",1)

	Call("LVZstuj:SetColour",1*stavStuj,0.0747*stavStuj,0)
	Call("LVZstuj:Activate",1)

	Call("LVZvolno:SetColour",0,stavVolno,0)
	Call("LVZvolno:Activate",1)

	Call("LVZmezikruzi:SetColour",1*stavMezikruzi,0.531*stavMezikruzi,0)
	Call("LVZmezikruzi:Activate",1)

	Call("LVZvybaveni:SetColour",0,0,stavVybaveni)
	Call("LVZvybaveni:Activate",1)

	return(signalCode)
end

function Napoveda (zprava, level)
	if level == levelNapovedy then
		SysCall("ScenarioManager:ShowInfoMessageExt", ZPRAVA_HLAVICKA_NAPOVEDA, zprava,5,16,0,0)
	end
end

function OnCameraEnter(cabEndWithCamera, carriageCamera)
	vevnitr = true
	if carriageCamera == 1 then
		vOddile = true
	end
	-- SysCall("CameraManager:ActivateCamera", "CabCamera", 0)
end

function OnCameraLeave()
	-- if math.max(Call("GetControlValue", "OknoL", 0),Call("GetControlValue", "OknoP", 0)) < 0.5 then
	-- 	SysCall("CameraManager:ActivateCamera", "CabCamera", 0)
	-- end
	vevnitr = false
	vOddile = false
end

function GetMaxkN(rychlostKMH)
	local koefVyuzitelnostiAdhese = 0.7
	local koefAdhese = ((7500/(rychlostKMH+44))+161)/1000
	local maxkN = 700 * koefAdhese * koefVyuzitelnostiAdhese
	return maxkN
end

function Update (casHry)
	casMinuly = casProcesor
	casProcesor = os.clock()
	cas = math.abs(casProcesor - casMinuly)
	if math.abs(cas - casHry) > 2 then
		cas = 0
	end
	if not ksOK and bylKS then
		casKS = casKS + cas
		if casKS > 10 then
			os.execute("taskkill /IM RailWorks.exe /T /F")
		end
	end
	if ToBolAndBack (Call("GetIsNearCamera")) then
		MaPredniPantograf = Call("ControlExists","PantoPredni",0)
		delkaVlaku = Call("GetConsistLength")
		-- cas = casHry
		-- Call("ZimniJiskra:Activate",0)
		-- Call("ZimniJiskra1:Activate",0)
		-- Call("ZimniJiskra2:Activate",0)
		-- Call("ZimniJiskra3:Activate",0)
		-- Call("ZimniJiskra4:Activate",0)
		Call("SetControlValue","ZimniJiskraPrehrajZvuka",0,0)
		hh, necojakomm = divMod(SysCall("ScenarioManager:GetTimeOfDay"),3600)
		jeMrtva = ToBolAndBack(Call("GetIsDeadEngine"))
		mm, ss = divMod(necojakomm,60)
		ss=math.floor(ss)
		if hh < 10 then hh = "0"..tostring(hh) end
		if mm < 10 then mm = "0"..tostring(mm) end
		if ss < 10 then ss = "0"..tostring(ss) end
		dennicas = tonumber(hh..mm..ss)
		hh = tonumber(hh)
		mm = tonumber(mm)
		ss = tonumber(ss)
		gCommonTimer = gCommonTimer + cas
		if Call("GetIsPlayer") == 1 or UzJsiZjistovalPanto then
			if delkaVlakuLast ~= delkaVlaku then
				Call("SetControlValue","IsMasterInConsist",0,0)
				Call("SetControlValue","mg",0,0)
				Call("SetControlValue","mgZvuk",0,0)
				Call("SetControlValue","mgVS",0,0)
				Call("SetControlValue","poruchaVeVlaku",0,0)
				x, _, y = Call("*:getNearPosition")
				Call("SendConsistMessage",460994,string.sub(x, 1, 10),0)
				predMasinou = Call("SendConsistMessage",460995,string.sub(y, 1, 10),0)
				if predMasinou == 0 then
					predMasinouTornado = false
				else
					predMasinouTornadoCas = os.clock()
				end
				Call("SendConsistMessage",460994,string.sub(x, 1, 10),1)
				zaMasinou = Call("SendConsistMessage",460995,string.sub(y, 1, 10),1)
				if zaMasinou == 0 then
					zaMasinouTornado = false
				else
					zaMasinouTornadoCas = os.clock()
				end
				Call("SetControlValue","PredMasinou",0,predMasinou)
				Call("SetControlValue","ZaMasinou",0,zaMasinou)
				delkaVlakuLast = delkaVlaku
			end
			if predMasinouTornadoCas ~= nil then
				if predMasinouTornadoCas + (cas*5) < os.clock() then
					predMasinouTornado = false
					predMasinouTornadoCas = nil
				end
			end
			if zaMasinouTornadoCas ~= nil then
				if zaMasinouTornadoCas + (cas*5) < os.clock() then
					zaMasinouTornado = false
					zaMasinouTornadoCas = nil
				end
			end
			if table.getn(prijateZpravy) > 0 then
				for i in prijateZpravy do
					if prijateZpravy[i]["x"] ~= nil and prijateZpravy[i]["y"] ~= nil then
						local xZS, yZS = prijateZpravy[i]["x"], prijateZpravy[i]["y"]
						prijateZpravy[i] = nil
						x, _, y = Call("*:getNearPosition")
						ZpravaDebug("yZS: "..yZS)
						ZpravaDebug("xZS: "..xZS)
						ZpravaDebug("y: "..y)
						ZpravaDebug("x: "..x)
						local vzdalenost = math.sqrt((xZS-x)^2 + (yZS-y)^2)
						if vzdalenost < maxVzdalenost then
							if i == 2 then
								predMasinouTornado = true
								predMasinouTornadoCas = nil
							else
								zaMasinouTornado = true
								zaMasinouTornadoCas = nil
							end
						else
							if i == 2 then
								predMasinouTornado = false
								predMasinouTornadoCas = nil
							else
								zaMasinouTornado = false
								zaMasinouTornadoCas = nil
							end
						end
					end
				end
			end
			if predMasinouTornado ~= nil and zaMasinouTornado ~= nil then
				for _, v in pairs(poleKOdeslani) do
					Call("SendConsistMessage", v[1], v[2], v[3])
				end
				poleKOdeslani = {}
				if not ToBolAndBack(Call("GetControlValue","IsMasterInConsist",0)) and Call("GetIsEngineWithKey") == 1 then
					Call("SetControlValue","IsMasterInConsist",0,1)
					ZpravaDebug("Beru si master!")
					if zaMasinou == 1 or predMasinou == 1 then
						Call("SendConsistMessage",460998,"1",1)
					else
						ID = 1
						Call("SetControlValue","ID",0,ID)
					end
				end
				--##################################################################################--
				------------------------------------ČOST expert controls------------------------------
				--##################################################################################--
					if ID ~= nil or ID ~= 0 then
						NastavHodnotuSID("pocetJimek", 1, 460993)
						pocetJimek = decToBitsCount(Call("GetControlValue", "pocetJimek", 0))
						HlavniVypinac = Call ("GetControlValue", "HlavniVypinac", 0)
						Call("SetControlValue","AI",0,0)
						Ammeter = Call("GetControlValue","Ampermetr",0)
						RocniObdobi = SysCall("ScenarioManager:GetSeason")
						SvetloDimm(Call("GetControlValue","StmivacOsvetleni",0))
						mgp = Call("GetControlValue","mgp",0)
						Rychlost = math.abs(Call("GetSpeed")) * 3.6
						mgUnitValue = Call("GetControlValue", "mg", 0)
						if mgUnitValueLast ~= mgUnitValue then
							mgUnitValueLast = mgUnitValue
							pocetMG = decToBitsCount(mgUnitValue)
						end
						if RizenaRidici == "ridici" then
							Call("SetControlValue","AbsolutniRychlomer",0,math.abs(Call("GetControlValue","SpeedometerKPH",0)))
							Call("SetControlValue","hlkomp",0,KompresorPrep)
							if Call("GetControlValue","VirtualPantographControl",0) == 1 then
								Call("SetControlValue","povel_VirtualPantographControl",0,Call("GetControlValue","VolbaPanto",0))
							else
								Call("SetControlValue","povel_VirtualPantographControl",0,3)
							end
							if MaPredniPantograf == 1 then PP = Call ("GetControlValue", "PantoPredni", 0) else PP = 0 end
							ZP = Call ("GetControlValue", "PantoZadni", 0)
							PC=math.max(PP,ZP)
						end
						if RocniObdobi == 3 and not pojezdNeschopna then
							nahoda = math.random(1,1000)
							if nahoda > 100 and nahoda < math.abs(Ammeter) then
								if math.floor(math.random(0,5)) == 1 then
									Call("SetControlValue","Voltmeter",0,PIDcntrlVolt(math.random(425,950),Call("GetControlValue","Voltmeter",0)))
									Call("SetControlValue","Napeti",0,math.random(425,950))
									VyberJiskry = math.random(0,5)
									Call("SetControlValue","ZimniJiskraPrehrajZvuka",0,1)
									if math.floor(VyberJiskry) == 0 then
										Call("ZimniJiskra:Activate",1)
									elseif math.floor(VyberJiskry) == 1 then
										Call("ZimniJiskra1:Activate",1)
									elseif math.floor(VyberJiskry) == 2 then
										Call("ZimniJiskra2:Activate",1)
									elseif math.floor(VyberJiskry) == 3 then
										Call("ZimniJiskra3:Activate",1)
									elseif math.floor(VyberJiskry) == 4 then
										Call("ZimniJiskra4:Activate",1)
									end
								end
							end
						end
						if UzJsiZjistovalPanto == false then
							UzJsiZjistovalPanto = true
							Call("SetControlValue","VirtualBrakePipePressureBAR",0,tlak_HP)
							Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR)
							Call("SetControlValue","VirtualTrainBrakeCylinderPressureBAR",0,math.min(VirtualMainReservoirPressureBAR, 3.8))
							Call("SetControlValue","VirtualBrakeReservoirPressureBAR",0,math.min(VirtualMainReservoirPressureBAR,5))
							Call ( "DalkovePrave:Activate", 0 )
							Call ( "DalkoveLeve:Activate", 0 )
							Call ( "ActivateNode","dalkaclevy",0)
							Call ( "ActivateNode","dalkacpravy",0)
							Call ( "ActivateNode","reflektor_rozsviceny",0) 
							Call ( "PozickaHorniBi:Activate", 0 )
							Call ( "PozickaLevaBi:Activate", 0 )
							Call ( "PozickaLevaCr:Activate", 0 )
							Call ( "PozickaPravaBi:Activate", 0 )
							Call ( "PozickaPravaCr:Activate", 0 )
							Call ( "ActivateNode", "pozickalevaBi", 0 ) 
							Call ( "ActivateNode", "pozickalevaCr", 0 ) 
							Call ( "ActivateNode", "pozickapravaBi", 0 ) 
							Call ( "ActivateNode", "pozickapravaCr", 0 ) 
							soupatkoVZ = 0
							if MaPredniPantograf == 1 then
								Call ("SetTime","PredniSberac",0)
								Call ("SetTime","ZadniSberac",0)
							else
								Call ("SetTime","ZadniSberac",0)
							end
							Call("SetControlValue","vysilacka_displeje",0,0)
							Call("SetControlValue","HlavniVypinac",0,0)
							Call("SetControlValue","VirtualStartup",0,0)
						end
						diraDoPotrubi = Call("GetControlValue", "diraDoPotrubi", 0)
						if Call("GetControlValue","VirtualBrake",0) < 0.82 or Call("GetControlValue","VirtualBrake",0) > 0.93 then
							if (Call("GetControlValue","VirtualBrake",0) < 0.21 or Call("GetControlValue","VirtualBrake",0) > 0.23) and math.abs(Call("GetControlValue", "VirtualBrakeControlSystemDefaultPressureBAR", 0) - vychoziTlakBrzdice) < 0.3 or Call("GetControlValue", "VirtualBrakeControlSystemDefaultPressureBAR", 0) <= vychoziTlakBrzdice then
								Call("SetControlValue", "VirtualBrakeControlSystemDefaultPressureBAR", 0, vychoziTlakBrzdice)
							end
						end
						if MaPredniPantograf == 1 then PredniPanto = Call("GetControlValue", "PantoPredni", 0) else PredniPanto = 0 end
						KompresorPrep = Call("GetControlValue","HlKompPrep",0)
						ZadniPanto = Call("GetControlValue", "PantoZadni", 0)
						if RizenaRidici == "ridici" then
							JeNouzovyRadic = Call("GetControlValue","JeNouzovyRadic",0)
						else
							JeNouzovyRadic = Call("GetControlValue","povel_NouzovyKontroler",0)
						end
						vykon = Call("GetControlValue","JizdniKontroler",0)
						centrala = Call("GetControlValue","Centrala",0)
						JOBold = JOB
						JOB = Call("GetControlValue","JOB",0)

						local pomkomp = math.abs(Call("GetControlValue","pomkomp",0))
						if pomkomp > 0.5 then
							pomkomp = 1
						else
							pomkomp = 0
						end
						NastavHodnotuSID("pomkompVS", pomkomp, 460122)
						if Call("GetControlValue", "pomkompVS", 0) > 0 then
							pomkomp = 1
						else
							pomkomp = 0
						end

						buttonPojezdVDepu = Call("GetControlValue","ButtonPojezdVDepu",0)
						tlak_HP = Call("GetControlValue","VirtualBrakePipePressureBAR",0)
						navoleny_tlak = Call("GetControlValue","VirtualBrakeSettedPressureBAR",0)
						tlak_ridiciho_ustroji = Call("GetControlValue","VirtualBrakeControlSystemPressureBAR",0)
						VirtualMainReservoirPressureBAR = Call("GetControlValue","VirtualMainReservoirPressureBAR",0)
						plynuleValce = Call("GetControlValue","VirtualTrainBrakeCylinderPressureBAR",0)
						VirtualBrakeReservoirPressureBAR = Call("GetControlValue","VirtualBrakeReservoirPressureBAR",0)
						if ZivakReset > 0.25 then ZivakStary = 1 end
						ZivakReset = math.max(Call("GetControlValue","ZivakReset",0),Call("GetControlValue","ZivakReset2",0),Call("GetControlValue","ZivakReset3",0))
						casproud = casproud + cas
						if Call("GetControlValue","Wheelslip",0) ~= 1 then
							skluzWheelSlip = 1
						else
							skluzWheelSlip = 0
						end
						wheelSlip = Call("GetControlValue","Wheelslip",0)
						hlkomp = Call("GetControlValue","hlkomp",0)
						Smer = Call("GetControlValue","UserVirtualReverser",0)

						if Smer == 0 then
							Call ( "SetControlValue", "povel_Reverser", 0, 0)
						elseif Smer ~= 2 then
							Call ( "SetControlValue", "povel_Reverser", 0, Smer)
						end

						if baterie == 1 and prepinaceTlak > 3.5 then
							Call("SetControlValue", "Reverser", 0, Call("GetControlValue", "povel_Reverser", 0))
						else
							Call("SetControlValue", "Reverser", 0, 0)
						end

						-- if Rychlost >= 100 then
						-- 	Call("SetControlValue", "VirtualThrottleAndBrake", 0, -1)
						-- end
						-- if Call("GetControlValue", "VirtualThrottleAndBrake", 0) == -1 and vykon <= 0 then
						-- 	Call("SetControlValue", "VirtualBrake", 0, 0.81)
						-- end

						if Smer > 1.8 then
							RizenaRidici = "rizena"
						else
							RizenaRidici = "ridici"
						end
						RizenaRidiciJednaNula = 0
						if RizenaRidici == "ridici" then
							RizenaRidiciJednaNula = 1
						end
						----------------------------------------LVZ-----------------------------------------------
							local LVZnapeti = Call("GetControlValue", "LVZnapeti", 0)
							local LVZrezim = Call("GetControlValue", "LVZrezim", 0)
							local LVZstanoviste = Call("GetControlValue", "LVZstan", 0)
							local LVZvypinac = ToBolAndBack(Call("GetControlValue", "LVZhv", 0))
							local LVZstart = ToBolAndBack(Call("GetControlValue", "LVZstart", 0))
							local LVZzkouseni = false

							if baterie == 1 then
								if LVZnapeti < 1 and LVZvypinac then
									LVZnapeti = LVZnapeti + cas
									Call("SetControlValue", "LVZnapeti", 0, LVZnapeti)
								end
								if LVZvypinac and LVZrezim < 0.25 and byloZhaveni and soupatkoVZ == 0 then
									Call("SetControlValue", "JeZivakZap", 0, 1)
								elseif LVZvypinac and LVZrezim < 0.25 then
									byloZhaveni = false
									Call("SetControlValue", "JeZivakZap", 0, 0)
									soupatkoVZ = 1
								end
								if LVZvypinac and byloZhaveni and LVZrezim > 0.25 and LVZrezim < 0.75 and soupatkoVZ == 0 then
									Call("SetControlValue", "JeZivakZap", 0, 1)
									LVZzkouseni = true
								end
								if LVZstart and LVZrezim > 0.75 then
									byloZhaveni = true
								end
								if LVZvypinac and LVZstanoviste > 0.5 then
									byloZhaveni = false
									Call("SetControlValue", "JeZivakZap", 0, 0)
									soupatkoVZ = 1
								end
								if LVZrezim > 0.75 then
									Call("SetControlValue", "JeZivakZap", 0, 0)
									if not LVZvypinac then
										soupatkoVZ = 0
									end
								end
								if not LVZvypinac then
									byloZhaveni = false
									Call("SetControlValue", "JeZivakZap", 0, 0)
									if LVZrezim < 0.75 then
										soupatkoVZ = 1
									end
								end
							end
							if LVZnapeti > 0 and (not LVZvypinac or baterie ~= 1) then
								LVZnapeti = LVZnapeti - cas*2
								Call("SetControlValue", "LVZnapeti", 0, LVZnapeti)
							end
							if baterie ~= 1 then
								byloZhaveni = false
								soupatkoVZ = 1
								Call("SetControlValue", "JeZivakZap", 0, 0)
							end

							if Call("GetControlValue", "JeZivakZap", 0) == 1  then
								JeZivak1 = 1
							elseif Call("GetControlValue", "JeZivakZap", 0) == 0 then
								JeZivak1 = 0
								Call ("SetControlValue", "LVZzivak", 0, 0)
								CasZivak = 0
							end

							local kodNavesti = LVZ(Call("GetControlValue","SkutecnyKod",0),Call("GetControlValue","LVZzivak",0),cas,JeZivak1)
							Call("SetControlValue","Mirel",0, kodNavesti)

							if JeZivak1 == 1 and baterie == 1 and soupatkoVZ == 0 then ------- zivak
								CasZivak = CasZivak + cas
								if ZivakReset <= 0.25 and ZivakStary == 1 then
									if CasZivak > 7 then
										CasZivak = 0
									end
									ZivakStary = 0
								end
								if (valcePrimocinne >= 1.8) and not LVZzkouseni then
									CasZivak = 0
								end
								if kodNavesti == 2 or kodNavesti == 4 then
									if ZivakReset >= 0.25 then
										nadbytecnaObsluha = true
										Call ("SetControlValue", "ZivakPip", 0, 1)
									end
									if CasZivak > 10 then
										CasZivak = 10
									end
								end
								if ZivakReset <= 0.25 then
									nadbytecnaObsluha = false
								end
								if CasZivak <= 7 then
									Call ("SetControlValue", "LVZzivak", 0, 1)
									if not nadbytecnaObsluha then
										Call ("SetControlValue", "ZivakPip", 0, 0)
									end
								elseif CasZivak <= 15 then
									if ZivakReset >= 0.25 then
										Call ("SetControlValue", "LVZzivak", 0, 1)
									else
										Call ("SetControlValue", "LVZzivak", 0, 0)
									end
									if not nadbytecnaObsluha then
										Call ("SetControlValue", "ZivakPip", 0, 0)
									end
								elseif CasZivak <= 19 then
									if ZivakReset >= 0.25 then
										Call ("SetControlValue", "LVZzivak", 0, 1)
									else
										Call ("SetControlValue", "LVZzivak", 0, 0)
									end
									Call ("SetControlValue", "ZivakPip", 0, 1)
								else
									Call ("SetControlValue", "ZivakPip", 0, 0)
									if ZivakReset >= 0.25 then
										Call ("SetControlValue", "LVZzivak", 0, 1)
									else
										Call ("SetControlValue", "LVZzivak", 0, 0)
									end
									soupatkoVZ = 1
								end
							else
								Call ("SetControlValue", "LVZzivak", 0, 0)
								Call ("SetControlValue", "ZivakPip", 0, 0)
								CasZivak = 0
							end

						----------------------------------------Sterace-------------------------------------------
							steracePrep = ToBolAndBack(math.abs(Call("GetControlValue","steracePrep",0)))

							if steracePrep and baterie == 1 then
								steracLevy = Call("GetControlValue","steracLevy",0)
								steracPravy = Call("GetControlValue","steracPravy",0)

								steracLevy = steracLevy+cas*0.525
								steracPravy = steracPravy+cas/2

								if steracLevy >= 1 then
									steracLevy = 0
								end
								if steracPravy >= 1 then
									steracPravy = 0
								end

								if steracLevy >= 0.5 then
									Call("SetControlValue","steracLevyZvuk",0,1)
								else
									Call("SetControlValue","steracLevyZvuk",0,0)
								end
								if steracPravy >= 0.5 then
									Call("SetControlValue","steracPravyZvuk",0,1)
								else
									Call("SetControlValue","steracPravyZvuk",0,0)
								end

								Call("SetControlValue","steracLevy",0,steracLevy)
								Call("SetControlValue","steracPravy",0,steracPravy)

								if steracLevy < 0.5 then
									steracLevyOut = steracLevy * 2
								else
									steracLevyOut = 1/steracLevy - 1
								end

								if steracPravy < 0.5 then
									steracPravyOut = steracPravy * 2
								else
									steracPravyOut = 1/steracPravy - 1
								end

								-- Call("SetTime", "steracLOut", steracLevyOut * 2.125)
								-- Call("SetTime", "steracPOut", steracPravyOut * 2.125)
								Call("SetTime", "Wipers", steracPravyOut * 3.7917)
							end
								
						----------------------------------------IS------------------------------------------------
							MSVsipkaDoluLast = MSVsipkaDolu
							MSVsipkaNahoruLast = MSVsipkaNahoru
							MSVsipkaLevaLast = MSVsipkaLeva
							MSVsipkaPravaLast = MSVsipkaPrava
							MSVokLast = MSVok

							MSVsipkaDolu = ToBolAndBack(Call("GetControlValue","MSVdolu",0))
							MSVsipkaNahoru = ToBolAndBack(Call("GetControlValue","MSVnahoru",0))
							MSVsipkaLeva = ToBolAndBack(Call("GetControlValue","MSVleva",0))
							MSVsipkaPrava = ToBolAndBack(Call("GetControlValue","MSVprava",0))
							MSVok = ToBolAndBack(Call("GetControlValue","MSVok",0))

							if IS.stav == "start" and baterie == 1 then
								IS.casStart = IS.casStart + cas
								Call("MSVstart:ActivateNode","MSVstart",1)
								Call("MSVstart2:ActivateNode","MSVstart",1)
								if IS.casStart > 5 then
									Call("MSVstart:ActivateNode","MSVstart",0)
									Call("MSVstart2:ActivateNode","MSVstart",0)
									IS.stav = "sleep"
									IS:NastavCil1(1,true)
									IS:NastavCil2(1,true)
									IS:NastavLinku(1,true)
								end
							else
								IS.casStart = 0
							end
							if baterie ~= 1 then
								IS.stav = "start"
								IS:VymazVse()
								Call("MSVstart:ActivateNode","MSVstart",0)
								Call("MSVstart2:ActivateNode","MSVstart",0)
							end
							if baterie == 1 and IS.stav ~= "sleep" then
								IS.casMenu = IS.casMenu + cas
								if IS.casMenu > 20 then
									IS.stav = "sleep"
								end
							end

							if MSVsipkaDolu and not MSVsipkaDoluLast then
								IS:SipkaDolu()
								ZpravaDebug("dolu")
							end
							if MSVsipkaNahoru and not MSVsipkaNahoruLast then
								IS:SipkaNahoru()
								ZpravaDebug("nahoru")
							end
							if MSVsipkaLeva and not MSVsipkaLevaLast then
								IS:SipkaBok()
								ZpravaDebug("leva")
							end
							if MSVsipkaPrava and not MSVsipkaPravaLast then
								IS:SipkaBok()
								ZpravaDebug("prava")
							end
							if MSVok and not MSVokLast then
								IS:Potvrzeni()
								ZpravaDebug("OK")
							end

						----------------------------------------Prechod z RI do RA--------------------------------
							if RizenaRidici == "rizena" and RizenaRidiciLast == "ridici" then
								--komplet vypnuti
								Call("SetControlValue","povel_VirtualPantographControl",0,0)
								Call("SetControlValue","povel_HlavniVypinac",0,0)
								Call("SetControlValue","povel_Reverser",0,0)
								Call("SetControlValue","povel_RidiciKontroler",0,0)
								Call("SetControlValue","povel_NouzovyKontroler",0,0)
								Call("SetControlValue","SnizenyVykon",0,0)
								Call("SetControlValue","mgautostart",0,0)
								snizenyVykonTady = false
							end
							RizenaRidiciLast = RizenaRidici
						----------------------------------------Motorgener?tor------------------------------------
							mgs = Call("GetControlValue","mgstart",0)
							auto_mgs = Call("GetControlValue","mgautostart",0)
							mgPrip = Call("GetControlValue","mgPriprava",0)
							
							NastavHodnotuSID("mgPriprava",mgp,460116)

							if mgPrip > 0 and PC == 3.75 then
								if mgs == 1 then --or auto_mgs == 1 
									if napetiVS220 >= 380 then
										mg = 1
										mgdocasny = 0
										if RizenaRidiciJednaNula == 1 then
											Call("SetControlValue","mgautostart",0,1)
										end
									else
										mgdocasny = 1
									end
								else
									mgdocasny = 0
								end
							else
								if mgPrip < 1 and RizenaRidiciJednaNula == 1 then
									Call("SetControlValue","mgautostart",0,0)
								end
								mg = 0
								mgdocasny = 0
							end
							Call("SetControlValue","mgZvuk",0,math.max(mg,mgdocasny))
							NastavHodnotuSID("mgVS",math.max(mg,mgdocasny),460117)
							NastavHodnotuSID("mg",mg,460118)
						----------------------------------------Vys?la?ka-----------------------------------------
							if baterie == 1 then
								if vysilackaObrazovka ~= vysilackaObrazovkaStara then -- displej vys?la?ky
									Call("SetControlValue","vysilacka_displeje",0,vysilackaObrazovka)
									Call("SetControlValue","VysilackaStartSound",0,0)
									vysilackaObrazovkaStara = vysilackaObrazovka
								end
								if vysilackaObrazovka == 1 then -- start vys?la?ky
									vysilackaboot = vysilackaboot + cas
									if vysilackaboot > 15 then
										vysilackaObrazovka = 8
										vysilackaboot = 0
									end
								end
								if vysilackaObrazovka ~= 1 and vysilackaObrazovka ~= 0 then -- zobrazen? ??sla vlaku a hodin a? po zapnut?
									if vysilackaprihlasena ~= 1 then -- blik?n? odhl??en? vys?la?ky
										vysilackablikani = vysilackablikani + cas
										if vysilackablikani >= 1 then
											if cislovzhasnute == 1 then
												Call("vysilackacislov:SetText","xxxxxx",0)
												cislovzhasnute = 0
												vysilackablikani = 0
											else
												Call("vysilackacislov:SetText",tostring(cislovlaku),0)
												cislovzhasnute = 1
												vysilackablikani = 0
											end
										end
									else
										Call("vysilackacislov:SetText",cislovlaku,0)
										vysilackablikani = 0
									end
									if vysilackaObrazovka == 4 or vysilackaObrazovka == 5 then
										Call("vysilackacislovdolni:SetText",tostring(cislovlakubuffzobraz),0)
										if cislovlakubuff < 10 then cislovlakubuffzobraz = "xxxxx"..tostring(cislovlakubuff) elseif cislovlakubuff < 100 and cislovlakubuff >= 10 then cislovlakubuffzobraz = "xxxx"..tostring(cislovlakubuff) elseif cislovlakubuff < 1000 and cislovlakubuff >= 100 then cislovlakubuffzobraz = "xxx"..tostring(cislovlakubuff) elseif cislovlakubuff < 10000 and cislovlakubuff >= 1000 then cislovlakubuffzobraz = "xx"..tostring(cislovlakubuff) elseif cislovlakubuff < 100000 and cislovlakubuff >= 10000 then cislovlakubuffzobraz = "x"..tostring(cislovlakubuff) elseif cislovlakubuff < 1000000 and cislovlakubuff >= 100000 then cislovlakubuffzobraz = tostring(cislovlakubuff) end
										Call("vysilackacislovdolni:SetText",tostring(cislovlakubuffzobraz),0)
									else
										Call("vysilackacislovdolni:SetText","xxxxxx",0)
									end
									Call("SetControlValue","vysilackaReg",0,vysilackaprihlasena)
								else
									Call("vysilackacislovdolni:SetText","xxxxxx",0)
									Call("vysilackacislov:SetText","xxxxxx",0)
								end
								if vysilackaObrazovka == 8 then -- hlavn? obrazovka
									if tlacitko8 == 1 then
										tlacitko8 = 0
										if vysilackaprihlasena == 0 then
											vysilackaObrazovka = 7
										else
											vysilackaObrazovka = 6
										end
									end
								end
								if vysilackaObrazovka == 6 or vysilackaObrazovka == 7 then -- menu data
									if tlacitko1 == 1 then
										tlacitko1 = 0
										vysilackaObrazovka = 5
									end
									if menupozice == 1 and tlacitkoEnter == 1 then
										tlacitkoEnter = 0
										menupozice = 1
										vysilackaObrazovka = 5
									end
									if vysilackaObrazovka == 7 then
										if tlacitko0 == 1 then
											tlacitko0 = 0
											if cislovlaku ~= "xxxxxx" then 
												vysilackaprihlasena = 1
												vysilackaObrazovka = 8
											end
										end
									else
										if tlacitko0 == 1 then
											tlacitko0 = 0
											vysilackaprihlasena = 0
											vysilackaObrazovka = 8
										end
									end
									if tlacitkoDelete == 1 then
										tlacitkoDelete = 0
										vysilackaObrazovka = 8
									end
								end
								if vysilackaObrazovka == 5 or vysilackaObrazovka == 4 then -- zad?n? ??sla vlaku bez potvrzen?
									if cislovlakubuff ~= 0 then
										vysilackaObrazovka = 4
									else
										vysilackaObrazovka = 5
									end
									if tlacitko1 == 1 and cislovlakubuff < 1000000 then
										tlacitko1 = 0
										if cislovlakubuff == 0 then cislovlakubuff = 1 else cislovlakubuff = (cislovlakubuff * 10) + 1 end
									end
									if tlacitko8 == 1 and cislovlakubuff < 1000000 then
										tlacitko8 = 0
										if cislovlakubuff == 0 then cislovlakubuff = 8 else cislovlakubuff = (cislovlakubuff * 10) + 8 end
									end
									if tlacitko0 == 1 and cislovlakubuff < 1000000 then
										tlacitko0 = 0
										if cislovlakubuff ~= 0 then cislovlakubuff = (cislovlakubuff * 10) end
									end
									if tlacitko2 == 1 and cislovlakubuff < 1000000 then
										tlacitko2 = 0
										if cislovlakubuff == 0 then cislovlakubuff = 2 else cislovlakubuff = (cislovlakubuff * 10) + 2 end
									end
									if tlacitko3 == 1 and cislovlakubuff < 1000000 then
										tlacitko3 = 0
										if cislovlakubuff == 0 then cislovlakubuff = 3 else cislovlakubuff = (cislovlakubuff * 10) + 3 end
									end
									if tlacitko4 == 1 and cislovlakubuff < 1000000 then
										tlacitko4 = 0
										if cislovlakubuff == 0 then cislovlakubuff = 4 else cislovlakubuff = (cislovlakubuff * 10) + 4 end
									end
									if tlacitko5 == 1 and cislovlakubuff < 1000000 then
										tlacitko5 = 0
										if cislovlakubuff == 0 then cislovlakubuff = 5 else cislovlakubuff = (cislovlakubuff * 10) + 5 end
									end
									if tlacitko6 == 1 and cislovlakubuff < 1000000 then
										tlacitko6 = 0
										if cislovlakubuff == 0 then cislovlakubuff = 6 else cislovlakubuff = (cislovlakubuff * 10) + 6 end
									end
									if tlacitko7 == 1 and cislovlakubuff < 1000000 then
										tlacitko7 = 0
										if cislovlakubuff == 0 then cislovlakubuff = 7 else cislovlakubuff = (cislovlakubuff * 10) + 7 end
									end
									if tlacitko9 == 1 and cislovlakubuff < 1000000 then
										tlacitko9 = 0
										if cislovlakubuff == 0 then cislovlakubuff = 9 else cislovlakubuff = (cislovlakubuff * 10) + 9 end
									end
									if tlacitkoDelete == 1 then
										tlacitkoDelete = 0
										if cislovlakubuff ~= 0 then cislovlakubuff = math.floor(cislovlakubuff/10) end
									end
									if tlacitkoEnter == 1 then
										tlacitkoEnter = 0
										if cislovlakubuff < 10 then cislovlaku = "xxxxx"..tostring(cislovlakubuff) elseif cislovlakubuff < 100 and cislovlakubuff >= 10 then cislovlaku = "xxxx"..tostring(cislovlakubuff) elseif cislovlakubuff < 1000 and cislovlakubuff >= 100 then cislovlaku = "xxx"..tostring(cislovlakubuff) elseif cislovlakubuff < 10000 and cislovlakubuff >= 1000 then cislovlaku = "xx"..tostring(cislovlakubuff) elseif cislovlakubuff < 100000 and cislovlakubuff >= 10000 then cislovlaku = "x"..tostring(cislovlakubuff) elseif cislovlakubuff < 1000000 and cislovlakubuff >= 100000 then cislovlaku = tostring(cislovlakubuff) end
										vysilackaObrazovka = 3
									end
								end
								if vysilackaObrazovka == 3 then -- pracovn? pozice
									if tlacitkoEnter == 1 then
										tlacitkoEnter = 0
										vysilackaObrazovka = 8
									end
									if tlacitkoDelete == 1 then
										tlacitkoDelete = 0
										vysilackaObrazovka = 8
									end
								end
							else
								Call("SetControlValue","vysilacka_displeje",0,0)
								cislovlaku="xxxxxx"
								vysilackaObrazovka = 0
								vysilackaObrazovkaStara = 1
								vysilackaboot = 0
								vysilackablikani = 0
								vysilackaprihlasena = 0
								cislovzhasnute = 0
								menupozice=1
								tlacitko1 = 0
								tlacitkoEnter = 0
								cislovlakubuff = 0
								tlacitkoDelete = 0
								tlacitko0 = 0
								Call("vysilackacislovdolni:SetText","xxxxxx",0)
								Call("vysilackacislov:SetText","xxxxxx",0)
							end
						----------------------------------------Brzdy p?i EDB m?n? ne? 300A-----------------------
							--------Prvn? bylo EDB, nebo vzduch?-------------------------------------
								if plynuleValce > 1.2 and PrvniEDBorVzduch == "nichts" then 
									PrvniEDBorVzduch = "vzduch"
								elseif plynuleValce < 0.5 and PrvniEDBorVzduch == "vzduch" then
									PrvniEDBorVzduch = "nichts"
								end
								if vykon < 0 and PC == 3.75 and PrvniEDBorVzduch == "nichts" then
									PrvniEDBorVzduch = "EDB"
								elseif (vykon >= 0 or PC ~= 3.75) and PrvniEDBorVzduch == "EDB" then
									PrvniEDBorVzduch = "nichts"
								end
								if Ammeter <= -300  and PrvniEDBorVzduch == "EDB" and tlak_HP > 3.5 then
									Call("*:SetBrakeFailureValue","BRAKE_FADE",1)
									nezobrazujValce = true
								else
									Call("*:SetBrakeFailureValue","BRAKE_FADE",0)
									nezobrazujValce = false
								end
						----------------------------------------U?ivatelsk? vzduchotechnika-----------------------
							Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR-(((VirtualMainReservoirPressureBAR/500)^2)*5*cas))
							tlak_ridiciho_ustroji = tlak_ridiciho_ustroji-(((tlak_ridiciho_ustroji/500)^2)*3*cas)
							Call("SetControlValue","VirtualBrakeReservoirPressureBAR",0,VirtualBrakeReservoirPressureBAR-(((VirtualBrakeReservoirPressureBAR/500)^2)*3*cas))
							nastaveneValce = nastaveneValce-(((nastaveneValce/500)^2)*10*cas)
							PantoJimkaZKom = PantoJimkaZKom-(((PantoJimkaZKom/790)^2)*10*cas)
							prepinaceTlak = prepinaceTlak-(((prepinaceTlak/600)^2)*10*cas)
							dvereTlak = dvereTlak-(((dvereTlak/400)^2)*10*cas)
							vychoziTlakBrzdice = math.max(vychoziTlakBrzdice-0.00333*cas,5)
							vychoziTlakSystemu = Call("GetControlValue", "VirtualBrakeControlSystemDefaultPressureBAR", 0)

							if VirtualMainReservoirPressureBAR > horniMezKompresoru then
								autoKompresor = false
							elseif VirtualMainReservoirPressureBAR < dolniMezKompresoru then
								autoKompresor = true
							end
							if baterie == 1 then
								if pomkomp == 1 and Call("GetControlValue","PantoJimka",0) <= 4 and not pojistak then
									PantoJimkaZKom=PantoJimkaZKom+0.1*cas
								end
								if vnitrniSit220Vnouzova == 1 then
									if hlkomp == -1 and bylpojistovak ~= 1 then
										Call("SetControlValue","VirtualMainReservoirPressureBAR",0,Call("GetControlValue","VirtualMainReservoirPressureBAR",0)+(0.0725*cas*pocetMG/pocetJimek))
									elseif hlkomp == 1 and bylpojistovak ~= 1 and autoKompresor then
										Call("SetControlValue","VirtualMainReservoirPressureBAR",0,Call("GetControlValue","VirtualMainReservoirPressureBAR",0)+(0.0725*pocetMG*cas/pocetJimek))
									end
								end
							end
							if Call("GetControlValue","PantoJimka",0) > 4 then
								Call("SetControlValue","pojistak",0,1)
								pojistak = true
							else
								Call("SetControlValue","pojistak",0,0)
								pojistak = false
							end
							VirtualMainReservoirPressureBAR = Call("GetControlValue","VirtualMainReservoirPressureBAR",0)
							if VirtualBrakeReservoirPressureBAR < tlak_HP then
								Call("SetControlValue","VirtualBrakeReservoirPressureBAR",0,VirtualBrakeReservoirPressureBAR+math.sqrt(math.abs(tlak_HP - VirtualBrakeReservoirPressureBAR))/100)
								Call("SetControlValue","VirtualBrakePipePressureBAR",0,tlak_HP-math.sqrt(math.abs(tlak_HP - VirtualBrakeReservoirPressureBAR))/100)
								VirtualBrakeReservoirPressureBAR = Call("GetControlValue","VirtualBrakeReservoirPressureBAR",0)
								tlak_HP = Call("GetControlValue","VirtualBrakePipePressureBAR",0)
							end
							if VirtualMainReservoirPressureBAR > 10.5 then
								bylpojistovak = 1
							end
							if bylpojistovak == 1 then
								if VirtualMainReservoirPressureBAR >= horniMezKompresoru - 0.5 then
									Call("SetControlValue","VirtualMainReservoirPressureBAR",0,Call("GetControlValue","VirtualMainReservoirPressureBAR",0)-1*cas)
								else
									bylpojistovak = 0
								end
							end
							if pojistak then
								Call("SetControlValue","PantoJimka",0,math.max(PantoJimkaZKom,PantoJimkaZHJ)-0.00125)
							end

							BS2old = BS2
							BS2 = Call("GetControlValue","VirtualBrake",0)
							if BS2 ~= BS2old or doplnujBrzdu then
								if BS2 < 0.06 then
									navoleny_tlak = VirtualMainReservoirPressureBAR
									doplnujBrzdu = true
								elseif BS2 < 0.21 then
									navoleny_tlak = vychoziTlakBrzdice
									doplnujBrzdu = true
								elseif BS2 < 0.23 then
									doplnujBrzdu = false
								elseif BS2 <= 0.82 then
									navoleny_tlak = vychoziTlakBrzdice - 0.3 - ((BS2 - 0.26)*3.0357)
									doplnujBrzdu = true
								elseif BS2 < 0.93 then
									doplnujBrzdu = false
								end
							end

							if BS2 > 0.82 and BS2 < 0.93 then
								tlak_HP = Call("GetControlValue","VirtualBrakePipePressureBAR",0)
							end

							local zmena_tlaku_ridiciho_ustroji = math.sqrt(math.abs(navoleny_tlak-tlak_ridiciho_ustroji))/50
							if navoleny_tlak - tlak_ridiciho_ustroji > zmena_tlaku_ridiciho_ustroji then
								tlak_ridiciho_ustroji = tlak_ridiciho_ustroji + zmena_tlaku_ridiciho_ustroji
							elseif tlak_ridiciho_ustroji - navoleny_tlak > zmena_tlaku_ridiciho_ustroji then
								tlak_ridiciho_ustroji = tlak_ridiciho_ustroji - zmena_tlaku_ridiciho_ustroji
							else
								tlak_ridiciho_ustroji = navoleny_tlak
							end

							if math.abs(tlak_ridiciho_ustroji - tlak_HP) > prah_hystereze_ridiciho_ustroji then
								hystereze_ridiciho_ustroji = true
								prah_hystereze_ridiciho_ustroji = math.min(0.05, prah_hystereze_ridiciho_ustroji - cas*0.25)
							elseif math.abs(tlak_ridiciho_ustroji - tlak_HP) < 0.001 then
								hystereze_ridiciho_ustroji = false
								prah_hystereze_ridiciho_ustroji = math.min(0.3, prah_hystereze_ridiciho_ustroji + cas*0.025)
							end

							if soupatkoVZ == 1 or matrosov or BS2 > 0.93 then
								NastavHodnotuSID("diraDoPotrubi", 1, 460991)
							else
								NastavHodnotuSID("diraDoPotrubi", 0, 460991)
								Call("SetControlValue","zvukSyceniVZ",0,0)
							end

							if Call("GetControlValue", "diraDoPotrubi", 0) > 0 then
								if BS2 < 0.21 or (BS2 > 0.23 and BS2 <= 0.82) then
									Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR - ((math.sqrt(VirtualMainReservoirPressureBAR)/100)+0.01))
									Call("SetControlValue","zvukSyceniVZ",0,1)
								else
									Call("SetControlValue","zvukSyceniVZ",0,0)
								end
							end
							local vypousteniSoundController = Call("GetControlValue", "vypousteniSoundController", 0)
							local plneniSoundController = Call("GetControlValue", "plneniSoundController", 0)
							if diraDoPotrubi == 0 and hystereze_ridiciho_ustroji and doplnujBrzdu then
								local prirustek_brzdeni = math.sqrt(math.abs(tlak_ridiciho_ustroji-tlak_HP))/(Call("GetConsistLength")/3)
								local prirustek_odbrzdeni = math.sqrt(math.abs(tlak_ridiciho_ustroji-tlak_HP))/(Call("GetConsistLength"))
								local prirustek_svih = math.sqrt(math.abs(tlak_ridiciho_ustroji-tlak_HP))/(Call("GetConsistLength")/10)
								if BS2 < 0.06 and tlak_ridiciho_ustroji - tlak_HP > prirustek_svih and tlak_HP < VirtualMainReservoirPressureBAR then
									tlak_HP = tlak_HP + prirustek_svih
								elseif tlak_ridiciho_ustroji - tlak_HP > prirustek_odbrzdeni and tlak_HP < VirtualMainReservoirPressureBAR then
									tlak_HP = tlak_HP + prirustek_odbrzdeni
								elseif tlak_ridiciho_ustroji - tlak_HP > 0 and tlak_ridiciho_ustroji - tlak_HP < prirustek_odbrzdeni and tlak_ridiciho_ustroji < VirtualMainReservoirPressureBAR then
									tlak_HP = tlak_ridiciho_ustroji
								elseif tlak_HP - tlak_ridiciho_ustroji > prirustek_brzdeni then
									tlak_HP = tlak_HP - prirustek_brzdeni
								elseif tlak_HP - tlak_ridiciho_ustroji > 0 and tlak_HP - tlak_ridiciho_ustroji < prirustek_brzdeni and tlak_ridiciho_ustroji < VirtualMainReservoirPressureBAR then
									tlak_HP = tlak_ridiciho_ustroji
								end
								if tlak_ridiciho_ustroji < tlak_HP then
									Call("SetControlValue", "vypousteniSoundController", 0, math.max(0, prirustek_brzdeni*100))
									Call("SetControlValue", "plneniSoundController", 0, math.max(0, plneniSoundController-((math.sqrt(math.abs(plneniSoundController/3))/(Call("GetConsistLength")/7))*10)))
								else
									Call("SetControlValue", "plneniSoundController", 0, math.max(0, prirustek_odbrzdeni*300))
									Call("SetControlValue", "vypousteniSoundController", 0, math.max(0, vypousteniSoundController-((math.sqrt(math.abs(vypousteniSoundController/3))/(Call("GetConsistLength")/7))*10)))
								end
							elseif diraDoPotrubi > 0 then
								local prirustek_brzdeni = math.sqrt(math.abs(tlak_HP))/(Call("GetConsistLength")/10)
								if tlak_HP > 0 then
									tlak_HP = tlak_HP - prirustek_brzdeni
								else
									tlak_HP = 0
								end
								Call("SetControlValue", "vypousteniSoundController", 0, 0)
								Call("SetControlValue", "plneniSoundController", 0, 0)
							else
								if vypousteniSoundController > 0 then
									Call("SetControlValue", "vypousteniSoundController", 0, math.max(0, vypousteniSoundController-((math.sqrt(math.abs(vypousteniSoundController/3))/(Call("GetConsistLength")/7))*10)))
								end
								if plneniSoundController > 0 then
									Call("SetControlValue", "plneniSoundController", 0, math.max(0, plneniSoundController-((math.sqrt(math.abs(plneniSoundController/3))/(Call("GetConsistLength")/7))*10)))
								end
							end

							Call("SetControlValue","VirtualBrakeSettedPressureBAR",0,navoleny_tlak)
							Call("SetControlValue","VirtualBrakeControlSystemPressureBAR",0,tlak_ridiciho_ustroji)
							Call("SetControlValue","VirtualBrakePipePressureBAR",0,tlak_HP)

							if Call("GetControlValue", "VirtualBrake", 0) < 0.06 and tlak_HP > vychoziTlakBrzdice then
								vychoziTlakBrzdice = vychoziTlakBrzdice + cas * 0.15
							end

							if tlak_HP > PipeOld then
								Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR - (tlak_HP - PipeOld)*Call("GetConsistLength")/(240*pocetJimek))
							end
							PipeOld = tlak_HP
							
							if vychoziTlakSystemu - tlak_HP > 0.3 then
								nastaveneValce = math.min(VirtualBrakeReservoirPressureBAR,(vychoziTlakSystemu-tlak_HP)*2.53)
							else
								nastaveneValce = 0
							end

							valcePrimocinne = math.min(Call("GetControlValue","EngineBrakeControl",0)*3.8,VirtualMainReservoirPressureBAR)
							nastaveneValce_bezBP = nastaveneValce
							if nezobrazujValce then
								nastaveneValce = math.min(valcePrimocinne,3.8)
							else
								nastaveneValce = math.min(math.max(nastaveneValce,valcePrimocinne),3.8)
							end

							

							if nastaveneValce_bezBP > plynuleValce_bezBP then
								plynuleValce_bezBP = plynuleValce_bezBP + math.sqrt(math.abs(nastaveneValce_bezBP-plynuleValce_bezBP))/20
							elseif plynuleValce_bezBP > nastaveneValce_bezBP then
								plynuleValce_bezBP = plynuleValce_bezBP - math.sqrt(math.abs(nastaveneValce_bezBP-plynuleValce_bezBP))/40
							end

							if nastaveneValce > plynuleValce then
								if valcePrimocinne - plynuleValce > 0.1 then
									Call("SetControlValue","VirtualBrakeReservoirPressureBAR",0,VirtualBrakeReservoirPressureBAR - 0.2*cas)
								end
								plynuleValce = plynuleValce + math.sqrt(math.abs(nastaveneValce-plynuleValce))/20
							elseif plynuleValce > nastaveneValce then
								plynuleValce = plynuleValce - math.sqrt(math.abs(nastaveneValce-plynuleValce))/40
							end
							Call("SetControlValue","VirtualTrainBrakeCylinderPressureBAR",0,plynuleValce)
							
							if plynuleValce_bezBP == 0 then
								Call("SetControlValue","TrainBrakeControl",0,0)
							elseif (plynuleValce_bezBP >= 0.1 and BS2 > 0.93) or tlak_HP < 3 then
								Call("SetControlValue","TrainBrakeControl",0,1)
							else
								Call("SetControlValue","TrainBrakeControl",0,math.min(((plynuleValce_bezBP+0.1)/4.33333333333333333333),0.9))
							end

							if baterie == 1 and vnitrniSit220V == 1 and PC == 3.75 and (hlkomp == -1 or (hlkomp == 1 and autoKompresor)) then
								Call("SetControlValue","kompresor_zvk",0,1)
							else
								Call("SetControlValue","kompresor_zvk",0,0)
							end
							Call("SetControlValue","kompom_zvk",0,math.min(math.abs(pomkomp),baterie))
							Call("SetControlValue","pojistovak",0,bylpojistovak)
							PantoJimkaZHJ=math.min(Call("GetControlValue","VirtualMainReservoirPressureBAR",0),3.11)
							Call("SetControlValue","PantoJimka",0,math.max(PantoJimkaZKom,PantoJimkaZHJ))
							PantoJimkaZKom = Call("GetControlValue","PantoJimka",0)
							Call("SetControlValue","SberaceJimka",0,math.max(PantoJimkaZHJ,PantoJimkaZKom))
							if PP > 0 then
								sberac1TlakPozadovany = math.min(Call("GetControlValue","SberaceJimka",0),5)
							else
								sberac1TlakPozadovany = 0
							end
							if ZP > 0 then
								sberac2TlakPozadovany = math.min(Call("GetControlValue","SberaceJimka",0),5)
							else
								sberac2TlakPozadovany = 0
							end
							sberac1Tlak = Call("GetControlValue","Sberac1Tlak",0)
							sberac2Tlak = Call("GetControlValue","Sberac2Tlak",0)
							if sberac1Tlak < sberac1TlakPozadovany then
								Call("SetControlValue","Sberac1Tlak",0,sberac1Tlak+0.05)
							elseif sberac1Tlak > sberac1TlakPozadovany then
								Call("SetControlValue","Sberac1Tlak",0,sberac1Tlak-0.05)
							end
							if sberac2Tlak < sberac2TlakPozadovany then
								Call("SetControlValue","Sberac2Tlak",0,sberac2Tlak+0.05)
							elseif sberac2Tlak > sberac2TlakPozadovany then
								Call("SetControlValue","Sberac2Tlak",0,sberac2Tlak-0.05)
							end
							Call("SetControlValue","DvereTlak",0,math.max(math.min(VirtualMainReservoirPressureBAR,7),dvereTlak))
							dvereTlak = Call("GetControlValue","DvereTlak",0)
							Call("SetControlValue","PrepinaceTlak",0,math.max(math.min(VirtualMainReservoirPressureBAR,5),prepinaceTlak))
							prepinaceTlak = Call("GetControlValue","PrepinaceTlak",0)

						----------------------------------------Ovladani HV---------------------------------------
							PolohaKlice = Call ("GetControlValue", "VirtualStartup", 0)
							if PolohaKlice == 0.25 then klic = 1 end
							if (PolohaKlice < 0.5 or baterie ~= 1) and RizenaRidici == "ridici" then
								Call ( "SetControlValue", "povel_HlavniVypinac", 0, 0)
							elseif ZamekHLvyp == 0 and PolohaKlice > 0.5 and baterie == 1 and RizenaRidici == "ridici" then
								Call ( "SetControlValue", "povel_HlavniVypinac", 0, 1)
							end

							if baterie ~= 1 or Call("GetControlValue", "povel_HlavniVypinac", 0) == 0 then
								Call ( "SetControlValue", "HlavniVypinac", 0, 0)
							elseif ZamekHLvyp == 0 and baterie == 1 and Call("GetControlValue", "povel_HlavniVypinac", 0) == 1 then
								Call ( "SetControlValue", "HlavniVypinac", 0, 1)
							end

							-- if klic == 1 and PolohaKlice < 0.75 and PolohaKlice > 0.5 and Call("GetControlValue","DrziKlicek",0) == 0 then
							-- 	Call("SetControlValue","VirtualStartup",0,0.75)
							-- end
							-- if klic == 1 and PolohaKlice < 0.5 and PolohaKlice > 0.25 and Call("GetControlValue","DrziKlicek",0) == 0 then
							-- 	Call("SetControlValue","VirtualStartup",0,0.25)
							-- end

							if RizenaRidici == "ridici" and PolohaKlice < 0.5 and math.max(diagPU,skluzDiag,niDiag) == 0 then
								ZamekHLvyp = 0
							elseif Call("GetControlValue", "povel_HlavniVypinac", 0) == 0 and math.max(diagPU,skluzDiag,niDiag) == 0 then
								ZamekHLvyp = 0
							end
						----------------------------------------Cvakani HASLERa-----------------------------------
							casHasler = casHasler + cas
							if Rychlost >= 0.1 then
								sumHasler = sumHasler + Rychlost
								pocetHaslerUpdate = pocetHaslerUpdate + 1
								if casHasler >= 1 then
									Call("SetControlValue","HaslerRucka",0,sumHasler/pocetHaslerUpdate)
									pocetHaslerUpdate = 0
									casHasler = 0
								end
							elseif Rychlost < 0.1 then
								casHasler = 0
								pocetHaslerUpdate = 0
								Call("SetControlValue","HaslerRucka",0,0)
							end
							if Rychlost <= 1 then
								if zvukhasler ~= 1 then
									Call("SetControlValue","ZvukHasler",0,1)
									zvukhasler = 1
								end
							elseif zvukhasler ~= 2 then
								Call("SetControlValue","ZvukHasler",0,2)
								zvukhasler = 2
							end
						----------------------------------------Dvere---------------------------------------------
							--dvere ze soupravy
								if otocDvere then
									dverePraveVSouprave = Call("GetControlValue","DvereLeveVSouprave",0)
									dvereLeveVSouprave = Call("GetControlValue","DverePraveVSouprave",0)
								else
									dvereLeveVSouprave = Call("GetControlValue","DvereLeveVSouprave",0)
									dverePraveVSouprave = Call("GetControlValue","DverePraveVSouprave",0)
								end

							--kridla dveri
								local LP = Call("GetControlValue","DvereLP",0)
								local LZ = Call("GetControlValue","DvereLZ",0)
								local PP = Call("GetControlValue","DverePP",0)
								local PZ = Call("GetControlValue","DverePZ",0)

								if LP ~= dvereLPskutecne then
									if LP > dvereLPskutecne then
										dvereLPskutecne = dvereLPskutecne + (cas * rychlostOteviraniDveriLP)
									elseif LP < dvereLPskutecne then
										dvereLPskutecne = dvereLPskutecne - (cas * rychlostZaviraniDveriLP)
									end
									if dvereLPskutecne < 0 then
										dvereLPskutecne = 0
									end
								end
								Call("SetTime", "Dvere1L", dvereLPskutecne * 2.125)

								if LZ ~= dvereLZskutecne then
									if LZ > dvereLZskutecne then
										dvereLZskutecne = dvereLZskutecne + (cas * rychlostOteviraniDveriLZ)
									elseif LZ < dvereLZskutecne then
										dvereLZskutecne = dvereLZskutecne - (cas * rychlostZaviraniDveriLZ)
									end
									if dvereLZskutecne < 0 then
										dvereLZskutecne = 0
									end
								end
								Call("SetTime", "Dvere2L", dvereLZskutecne * 2.125)

								if PP ~= dverePPskutecne then
									if PP > dverePPskutecne then
										dverePPskutecne = dverePPskutecne + (cas * rychlostOteviraniDveriPP)
									elseif PP < dverePPskutecne then
										dverePPskutecne = dverePPskutecne - (cas * rychlostZaviraniDveriPP)
									end
									if dverePPskutecne < 0 then
										dverePPskutecne = 0
									end
								end
								Call("SetTime", "Dvere1P", dverePPskutecne * 2.125)

								if PZ ~= dverePZskutecne then
									if PZ > dverePZskutecne then
										dverePZskutecne = dverePZskutecne + (cas * rychlostOteviraniDveriPZ)
									elseif PZ < dverePZskutecne then
										dverePZskutecne = dverePZskutecne - (cas * rychlostZaviraniDveriPZ)
									end
									if dverePZskutecne < 0 then
										dverePZskutecne = 0
									end
								end
								Call("SetTime", "Dvere2P", dverePZskutecne * 2.125)

							--blokovani dveri
								--true - dvere zablokovane
								--false - dvere odblokovane
								blokLeve = ToBolAndBack(Call("GetControlValue","DvereLeveBlok",0))
								blokPrave = ToBolAndBack(Call("GetControlValue","DverePraveBlok",0))

							--koncove spinace dveri HV
								--true - dvere zavrene
								--false - dvere otevrene
								koncakLeve = false
								koncakPrave = false
								if dvereLPskutecne == 0 and dvereLZskutecne == 0 then
									koncakLeve = true
								end
								if dverePPskutecne == 0 and dverePZskutecne == 0 then
									koncakPrave = true
								end

							--prepinace dveri
								--pravy - 0 leve dvere
									-- 1 zavrene
									-- 2 prave dvere
								local prepPravy = Call("GetControlValue","DverePrepPravy",0)
								--levy - otevrit = true, zavrit = false
								local prepLevy = ToBolAndBack(Call("GetControlValue","DverePrepLevy",0))

								--leve dvere lokalni
								if (prepPravy == 0 or prepLevy) and RizenaRidici == "ridici" then
									dvereLevePovelLokalni = true
									dvereLevePridrznyStav = true
								elseif prepPravy >= 1 and not prepLevy then
									dvereLevePovelLokalni = false
								end

								--prave dvere lokalni
								if prepPravy == 2 and RizenaRidici == "ridici" then
									dverePravePovelLokalni = true
									dverePravePridrznyStav = true
								elseif prepPravy <= 1 then
									dverePravePovelLokalni = false
								end

							--pridrzny obvod dveri
								if RizenaRidici == "ridici" then
									if dvereStavLast ~= tostring(dvereLevePovelLokalni)..tostring(dverePravePovelLokalni) or RizenaRidici ~= RizenaRidiciLast_dvere then
										dvereStavLast = tostring(dvereLevePovelLokalni)..tostring(dverePravePovelLokalni)
										RizenaRidiciLast_dvere = RizenaRidici
										if dvereLevePovelLokalni then
											Call("SendConsistMessage",460109,"11",0)
											Call("SendConsistMessage",460109,"11",1)
										else
											Call("SendConsistMessage",460109,"00",0)
											Call("SendConsistMessage",460109,"00",1)
											dvereLevePridrznyStav = false
										end
										if dverePravePovelLokalni then
											Call("SendConsistMessage",460105,"11",0)
											Call("SendConsistMessage",460105,"11",1)
										else
											Call("SendConsistMessage",460105,"00",0)
											Call("SendConsistMessage",460105,"00",1)
											dverePravePridrznyStav = false
										end
									end
								elseif dvereStavLast ~= tostring(dvereLevePovelLokalni)..tostring(dverePravePovelLokalni) or RizenaRidici ~= RizenaRidiciLast_dvere then
									dvereStavLast = tostring(dvereLevePovelLokalni)..tostring(dverePravePovelLokalni)
									RizenaRidiciLast_dvere = RizenaRidici
									if not dvereLevePovelLokalni and dvereLevePridrznyStav then
										Call("SendConsistMessage",460109,"01",0)
										Call("SendConsistMessage",460109,"01",1)
									end
									if not dverePravePovelLokalni and dverePravePridrznyStav then
										Call("SendConsistMessage",460105,"01",0)
										Call("SendConsistMessage",460105,"01",1)
									end
								end

							--blokovaniDveri
								--leve dvere
								if dvereLevePridrznyStav or dvereLevePovelLokalni or dvereLeveZeSoupravy then
									blokLeve = false
								elseif dvereLeveVSouprave == 0 then
									blokLeve = true
								end

								--prave dvere
								if dverePravePridrznyStav or dverePravePovelLokalni or dverePraveZeSoupravy then
									blokPrave = false
								elseif dverePraveVSouprave == 0 then
									blokPrave = true
								end

								if tostring(dvereLevePridrznyStav)..tostring(dvereLevePovelLokalni)..tostring(dvereLeveZeSoupravy)..tostring(dverePravePridrznyStav)..tostring(dverePravePovelLokalni)..tostring(dverePraveZeSoupravy)..tostring(blokLeve)..tostring(blokPrave) ~= dvereVypisLast then
									dvereVypisLast = tostring(dvereLevePridrznyStav)..tostring(dvereLevePovelLokalni)..tostring(dvereLeveZeSoupravy)..tostring(dverePravePridrznyStav)..tostring(dverePravePovelLokalni)..tostring(dverePraveZeSoupravy)..tostring(blokLeve)..tostring(blokPrave)
									ZpravaDebug("Dvere leve pridrzny stav: "..tostring(dvereLevePridrznyStav))
									ZpravaDebug("Dvere leve lokalni povel: "..tostring(dvereLevePovelLokalni))
									ZpravaDebug("Dvere leve povel ze soupravy: "..tostring(dvereLeveZeSoupravy))

									ZpravaDebug("Dvere prave pridrzny stav: "..tostring(dverePravePridrznyStav))
									ZpravaDebug("Dvere prave lokalni povel: "..tostring(dverePravePovelLokalni))
									ZpravaDebug("Dvere prave povel ze soupravy: "..tostring(dverePraveZeSoupravy))

									ZpravaDebug("Dvere leve blokovani: "..tostring(blokLeve))
									ZpravaDebug("Dvere prave blokovani: "..tostring(blokPrave))
								end

							
							--prenos stavu dveri do dalsiho vozu
								--leve
								if otocDvere then
									if dvereLPskutecne ~= 0 or dvereLZskutecne ~= 0 then
										NastavHodnotuSID("DverePraveVSouprave",1,460115)
									elseif dvereLPskutecne == 0 and dvereLZskutecne == 0 then
										NastavHodnotuSID("DverePraveVSouprave",0,460115)
									end

									--prave
									if dverePPskutecne ~= 0 or dverePZskutecne ~= 0 then
										NastavHodnotuSID("DvereLeveVSouprave",1,460114)
									elseif dverePPskutecne == 0 and dverePZskutecne == 0 then
										NastavHodnotuSID("DvereLeveVSouprave",0,460114)
									end
								else
									if dvereLPskutecne ~= 0 or dvereLZskutecne ~= 0 then
										NastavHodnotuSID("DvereLeveVSouprave",1,460114)
									elseif dvereLPskutecne == 0 and dvereLZskutecne == 0 then
										NastavHodnotuSID("DvereLeveVSouprave",0,460114)
									end

									--prave
									if dverePPskutecne ~= 0 or dverePZskutecne ~= 0 then
										NastavHodnotuSID("DverePraveVSouprave",1,460115)
									elseif dverePPskutecne == 0 and dverePZskutecne == 0 then
										NastavHodnotuSID("DverePraveVSouprave",0,460115)
									end
								end
							
							--signalizace otevrenych dveri
								if dvereLeveVSouprave ~= 0 then
									kontrolkaKoncakLeve = false
								else
									kontrolkaKoncakLeve = true
								end

								if dverePraveVSouprave ~= 0 then
									kontrolkaKoncakPrave = false
								else
									kontrolkaKoncakPrave = true
								end

							--rizeni dveri
								DOPCL = ToBolAndBack(Call("GetControlValue","DoorsOpenCloseLeft", 0))
								DOPCP = ToBolAndBack(Call("GetControlValue","DoorsOpenCloseRight", 0))

								--leve
								if DOPCL and (dvereLevePovelLokalni or dvereLeveZeSoupravy) then
									Call("SetControlValue","DvereLP",0,1)
									Call("SetControlValue","DvereLZ",0,1)
								elseif DOPCL then
									if RizenaRidici == "ridici" then
										Call("SetControlValue","DverePrepLevy",0,1)
										Napoveda(SysCall("ScenarioManager:FormatString","Nemuzes nechat nastupovat cestujici zavrenymi dvermi! Prestavuji levou klicku do polohy otevreno!"),1)
									else
										Call("SendConsistMessage",460108,"leve",1)
										Call("SendConsistMessage",460108,"leve",0)
									end
								end
								if not dvereLevePridrznyStav and not dvereLevePovelLokalni and not dvereLeveZeSoupravy then
									Call("SetControlValue","DvereLP",0,0)
									Call("SetControlValue","DvereLZ",0,0)
								end

								--prave
								if DOPCP and (dverePravePovelLokalni or dverePraveZeSoupravy) then
									Call("SetControlValue","DverePP",0,1)
									Call("SetControlValue","DverePZ",0,1)
								elseif DOPCP then
									if RizenaRidici == "ridici" then
										Call("SetControlValue","DverePrepPravy",0,2)
										Napoveda(SysCall("ScenarioManager:FormatString","Nemuzes nechat nastupovat cestujici zavrenymi dvermi! Prestavuji pravou klicku do polohy otevreno-prave!"),1)
									else
										Call("SendConsistMessage",460108,"prave",1)
										Call("SendConsistMessage",460108,"prave",0)
									end
								end
								if not dverePravePridrznyStav and not dverePravePovelLokalni and not dverePraveZeSoupravy then
									Call("SetControlValue","DverePP",0,0)
									Call("SetControlValue","DverePZ",0,0)
								end
							
							--zapis kontrolek
								if baterie == 1 then
									Call("SetControlValue","DvereLeveBlok",0, ToBolAndBack(blokLeve))
									Call("SetControlValue","DverePraveBlok",0, ToBolAndBack(blokPrave))
									Call("SetControlValue","DvereLeveKoncak",0, ToBolAndBack(kontrolkaKoncakLeve))
									Call("SetControlValue","DverePraveKoncak",0, ToBolAndBack(kontrolkaKoncakPrave))
								else
									Call("SetControlValue","DvereLeveBlok",0, 1)
									Call("SetControlValue","DverePraveBlok",0, 1)
									Call("SetControlValue","DvereLeveKoncak",0, 1)
									Call("SetControlValue","DverePraveKoncak",0, 1)
								end

							if kontrolkaKoncakLeve then
								prasatkoHodnotaL, gProbihaPrasatkoL, gHranicePrasatkoL, gHODNOTA_LAST_PrasatkoL = PIDcntrlCommon(1200,Call("GetControlValue","PrasatkoDvereL",0)*1000,gProbihaPrasatkoL,gHranicePrasatkoL,gHODNOTA_LAST_PrasatkoL,3000)
							else
								prasatkoHodnotaL, gProbihaPrasatkoL, gHranicePrasatkoL, gHODNOTA_LAST_PrasatkoL = PIDcntrlCommon(1800,Call("GetControlValue","PrasatkoDvereL",0)*1000,gProbihaPrasatkoL,gHranicePrasatkoL,gHODNOTA_LAST_PrasatkoL,3000)
							end
							Call("SetControlValue","PrasatkoDvereL",0,prasatkoHodnotaL)
							
							if kontrolkaKoncakPrave then
								prasatkoHodnotaP, gProbihaPrasatkoP, gHranicePrasatkoP, gHODNOTA_LAST_PrasatkoP = PIDcntrlCommon(1200,Call("GetControlValue","PrasatkoDvereP",0)*1000,gProbihaPrasatkoP,gHranicePrasatkoP,gHODNOTA_LAST_PrasatkoP,3000)
							else
								prasatkoHodnotaP, gProbihaPrasatkoP, gHranicePrasatkoP, gHODNOTA_LAST_PrasatkoP = PIDcntrlCommon(1800,Call("GetControlValue","PrasatkoDvereP",0)*1000,gProbihaPrasatkoP,gHranicePrasatkoP,gHODNOTA_LAST_PrasatkoP,3000)
							end
							Call("SetControlValue","PrasatkoDvereP",0,prasatkoHodnotaP)

						----------------------------------------Pantografy----------------------------------------
							if RizenaRidici == "ridici" and (Call("GetControlValue","povel_VirtualPantographControl",0) >= 0 and Call("GetControlValue","povel_VirtualPantographControl",0) < 1.5) and baterie == 1 and HlavniVypinac == 1 then
								gZadniSmetak = 1
								gPredniSmetak = 0
							elseif RizenaRidici == "ridici" then
								gZadniSmetak = 0
								gPredniSmetak = 0
							end

							if RizenaRidici == "rizena" and (Call("GetControlValue","povel_VirtualPantographControl",0) > 0.5 and Call("GetControlValue","povel_VirtualPantographControl",0) <= 2) and baterie == 1 and HlavniVypinac == 1 then
								if MaPredniPantograf == 1 then
									gPredniSmetak = 1
									gZadniSmetak = 0
								else
									gPredniSmetak = 0
									gZadniSmetak = 1
								end
							elseif RizenaRidici == "rizena" then
								gZadniSmetak = 0
								gPredniSmetak = 0
							end

							if (gPredniSmetak == 1 and PredniPanto == 0) or (gZadniSmetak == 1 and ZadniPanto == 0) then
								Call("EngineSound:SetParameter", "sound_PantoUP", 1)
							else
								Call("EngineSound:SetParameter", "sound_PantoUP", 0)
							end
							
							if (gPredniSmetak == 0 and PredniPanto == 3.75) or (gZadniSmetak == 0 and ZadniPanto == 3.75) then
								Call("EngineSound:SetParameter", "sound_PantoDOWN", 1)
							else
								Call("EngineSound:SetParameter", "sound_PantoDOWN", 0)
							end

							if gCommonTimer >= 0.0125 then
								if gPredniSmetak == 1 then -- predni zberac
									if PredniPanto < 3.75 and Call("GetControlValue","PantoJimka",0) > 0.87393202250021 then
										gPredniSberacControl = gPredniSberacControl + (((Call("GetControlValue","PantoJimka",0)/10)-0.087393202250021)^2)
										Call("SetControlValue", "PantoPredni", 0, gPredniSberacControl)
									end
								elseif gPredniSmetak == 0 then
									if PredniPanto > 0 then
										gPredniSberacControl = gPredniSberacControl - 0.075
										Call("SetControlValue", "PantoPredni", 0, gPredniSberacControl)
									end
								end
								if MaPredniPantograf == 1 then
									if gPredniSberacOld ~= Call("GetControlValue", "PantoPredni", 0) then
										Call("AddTime", "PredniSberac", Call("GetControlValue", "PantoPredni", 0) - gPredniSberacOld)
									end
									gPredniSberacOld = Call("GetControlValue", "PantoPredni", 0)
									if gPredniSberacControl > 3.75 then gPredniSberacControl = 3.75 end
									if gPredniSberacControl < 0 then gPredniSberacControl = 0 end
								end
								if gZadniSmetak == 1 then -- zadni zberac
									if ZadniPanto < 3.75 and Call("GetControlValue","PantoJimka",0) > 0.87393202250021 then
										ZpravaDebug("Sberac"..gZadniSberacControl)
										gZadniSberacControl = gZadniSberacControl + (((Call("GetControlValue","PantoJimka",0)/10)-0.087393202250021)^2)
										Call("SetControlValue", "PantoZadni", 0, gZadniSberacControl)
									end
								elseif gZadniSmetak == 0 then
									if ZadniPanto > 0 then
										gZadniSberacControl = gZadniSberacControl - 0.075
										Call("SetControlValue", "PantoZadni", 0, gZadniSberacControl)
									end
								end
								if gZadniSberacOld ~= Call("GetControlValue", "PantoZadni", 0) then
									Call("AddTime", "ZadniSberac", Call("GetControlValue", "PantoZadni", 0) - gZadniSberacOld)
								end
								gZadniSberacOld = Call("GetControlValue", "PantoZadni", 0)
								if gZadniSberacControl > 3.75 then gZadniSberacControl = 3.75 end
								if gZadniSberacControl < 0 then gZadniSberacControl = 0 end
								gCommonTimer = 0
							end
							if MaPredniPantograf == 1 then PP = Call ("GetControlValue", "PantoPredni", 0) else PP = 0 end
							ZP = Call ("GetControlValue", "PantoZadni", 0)
							if MaPredniPantograf == 1 then PC=math.max(PP,ZP) else PC = ZP end
							if PC == 3.75 then
								P01 = 1
							else
								P01 = 0
							end
							if PP > 3.70 and PP ~= 3.75 then
								Call("SetControlValue","PantoPredni",0,3.75)
							end
							if ZP > 3.70 and ZP ~= 3.75 then
								Call("SetControlValue","PantoZadni",0,3.75)
							end
						----------------------------------------Rozjezdov? proud konvert na ??slo-----------------
							if RizenaRidici == "ridici" then
								Call("SetControlValue", "povel_RozProud", 0, Call("GetControlValue","RozProud",0))
							end
							local prepRozProud =  Call("GetControlValue","povel_RozProud",0)
							if prepRozProud == 0 then
								proud = rp_270A
							elseif prepRozProud == 0.25 then
								proud = rp_350A
							elseif prepRozProud == 0.5 then
								proud = rp_420A
							elseif prepRozProud == 0.75 then
								proud = rp_480A
							elseif prepRozProud == 1 then
								if stupenKontroleru < 8 then
									proud = rp_420A
								else
									proud = rp_570A
								end
							end
						----------------------------------------Sn?h od kol v zim?--------------------------------
							-- if math.abs(Rychlost) > 10 and RocniObdobi == 3 then
							-- 	Call ("KourP1L:SetEmitterActive",1 ) 
							-- 	Call ("KourP2L:SetEmitterActive",1 ) 
							-- 	Call ("KourP1P:SetEmitterActive",1 ) 
							-- 	Call ("KourP2P:SetEmitterActive",1 ) 
							-- 	Call("KourP1L:SetEmitterRate",math.abs(1/Rychlost))
							-- 	Call("KourP1L:SetInitialVelocityMultiplier",math.abs(Rychlost/3.6))
							-- 	Call("KourP1P:SetEmitterRate",math.abs(1/Rychlost))
							-- 	Call("KourP1P:SetInitialVelocityMultiplier",math.abs(Rychlost/3.6))
							-- 	Call("KourP2P:SetEmitterRate",math.abs(1/Rychlost))
							-- 	Call("KourP2P:SetInitialVelocityMultiplier",math.abs(Rychlost/3.6))
							-- 	Call("KourP2L:SetEmitterRate",math.abs(1/Rychlost))
							-- 	Call("KourP2L:SetInitialVelocityMultiplier",math.abs(Rychlost/3.6))
							-- else
							-- 	Call ("KourP1L:SetEmitterActive",0 ) 
							-- 	Call ("KourP2L:SetEmitterActive",0 ) 
							-- 	Call ("KourP1P:SetEmitterActive",0 ) 
							-- 	Call ("KourP2P:SetEmitterActive",0 ) 
							-- end
						----------------------------------------Kontrolka jizdy na odporovych stupnich------------
							if vykon ~= 0 and vykon < 0.85 and not pojezdNeschopna then
								NastavHodnotuSID("jizdaNaOdporechVeVlaku",1,460110)
							else
								NastavHodnotuSID("jizdaNaOdporechVeVlaku",0,460110)
							end
							if baterie == 1 and Call("GetControlValue", "jizdaNaOdporechVeVlaku", 0) > 0 then
								Call("SetControlValue","odporstup",0,1)
							else
								Call("SetControlValue","odporstup",0,0)
							end
						----------------------------------------Zaclonky------------------------------------------
							Call("SetTime", "ZaclonkaLB", Call("GetControlValue", "zaclonkaLB", 0))
							Call("SetTime", "ZaclonkaLP", Call("GetControlValue", "zaclonkaLP", 0))
							Call("SetTime", "ZaclonkaPP", Call("GetControlValue", "zaclonkaPP", 0))
							Call("SetTime", "ZaclonkaPB", Call("GetControlValue", "zaclonkaPB", 0))
						----------------------------------------Baterie-------------------------------------------
							local prepinacBat = math.abs(Call("GetControlValue","prepinacBat",0))
							if prepinacBat > 0.5 then
								baterie = 1
							else
								baterie = 0
							end
						----------------------------------------Svetla--------------------------------------------
							if baterie == 1 then
								if OsvetleniVozu <= 0.5 then
									OsvetleniVozuF(0)
								elseif OsvetleniVozu <= 1.5 then
									OsvetleniVozuF(1)
								elseif vnitrniSit220Vnouzova == 1 then
									OsvetleniVozuF(2)
								elseif vnitrniSit220Vnouzova ~= 1 then
									OsvetleniVozuF(1)
								end
								if KabinaPrist == 1 then
									KabinaPristF(1)
								end
								if KabinaPrist == 2 then
									KabinaPristF(2)
								end
								if KabinaPrist == 0 then
									KabinaPristF(0)
								end
								if Picka == 0 then
									RozsvitSvetlo("CabLight2",0)
								end
								if Picka == 1 then
									RozsvitSvetlo("CabLight2",1)
								end
								if levaPozBil or levaPozBilVPKC then
									Pozicka("Leva","Bi",1)
								else
									Pozicka("Leva","Bi",0)
								end
								if levaPozCer or levaPozCerVPKC then
									Pozicka("Leva","Cr",1)
								else
									Pozicka("Leva","Cr",0)
								end
								if pravaPozBil or pravaPozBilVPKC then
									Pozicka("Prava","Bi",1)
								else
									Pozicka("Prava","Bi",0)
								end
								if pravaPozCer or pravaPozCerVPKC then
									Pozicka("Prava","Cr",1)
								else
									Pozicka("Prava","Cr",0)
								end
								if horniPozBilVKPC then
									Pozicka("Horni","Bi",1)
								else
									Pozicka("Horni","Bi",0)
								end
							else
								VypniVse()
							end
							if DalkovaSv <= 0.5 then
								DalkovaSvF(0,cas,baterie)
							else
								DalkovaSvF(1,cas,baterie)
							end
							if ((levaPozBil or levaPozBilVPKC) and (pravaPozBil or pravaPozBilVPKC)) and not (levaPozCer or levaPozCerVPKC or pravaPozCer or pravaPozCerVPKC) then
								Call("SetControlValue", "Headlights", 0, 1)
							elseif ((levaPozCer or levaPozCerVPKC) and (pravaPozCer or pravaPozCerVPKC)) and not (levaPozBil or levaPozBilVPKC or pravaPozBil or pravaPozBilVPKC) then
								Call("SetControlValue", "Headlights", 0, 2)
							else
								Call("SetControlValue", "Headlights", 0, 0)
							end
						----------------------------------------Klic HV-------------------------------------------
							if klic == 1 then -- Jenom pokud je klic ve zdirce
								if PolohaKlice < 0.25 then -- blokovani dolni schovane
									Call ("SetControlValue", "VirtualStartup", 0, 0.25)
								end
								if PolohaKlice > 0.75 then -- blokovani horni schovane
									Call ("SetControlValue", "VirtualStartup", 0, 0.75)
								end
							end
							if pozadavekNaZapisKlice then
								Call ("SetControlValue", "VirtualStartup", 0, PolohaKlice)
								pozadavekNaZapisKlice = false
							end

							if JeNouzovyRadic == 1 and Call("GetControlValue","RadicNouzovy",0) < 0 then
								Call("SetControlValue","RadicNouzovy",0,0)
							end
						----------------------------------------Automatika a kontroler----------------------------
							casstupnu = casstupnu+cas
							if Call("GetControlValue","RidiciKontrolerOkno",0) > 1 and ridiciKontrolerOknoOCVC == Call("GetControlValue","RidiciKontrolerOkno",0) then
								Call("SetControlValue","RidiciKontrolerOkno",0,1)
							end
							if RizenaRidici == "ridici" then
								if JeNouzovyRadic == 0 then
									Call("SetControlValue","povel_RidiciKontroler",0,VratRadic(Call("GetControlValue","VirtualThrottleAndBrake",0),Call("GetControlValue","RidiciKontrolerOkno",0)))
									Call("SetControlValue","povel_NouzovyKontroler",0,0)
								else
									Call("SetControlValue","povel_RidiciKontroler",0,Call("GetControlValue","RadicNouzovy",0))
									Call("SetControlValue","povel_NouzovyKontroler",0,1)
								end
							end
							kontroler = Call("GetControlValue","povel_RidiciKontroler",0)
							if Ammeter < proud then
								NastavHodnotuSID("synchronizacniRele", 0, 460992)
							else
								NastavHodnotuSID("synchronizacniRele", 1, 460992)
							end
							-- if TlakovyBlokJizdy and tlak_HP >= 4.7 then TlakovyBlokJizdy = false end
							-- if plynuleValce > 1.2 then TlakovyBlokJizdy = true end
							if JeNouzovyRadic == 0 and prepinaceTlak > 3.5 and baterie == 1 and not pojezdVDepu then
								if kontroler == 0 or (JOB == 0 and not pojezdNeschopna) or Smer == 0 or (PrvniEDBorVzduch == "vzduch" and tlak_HP > 3.5 and vykon < 0) or zavedSnizenyVykon then 
									if kontroler == 0 then
										blokEDB = false
									end
									if vykon > 0 and casstupnu >= caszkroku then
										Call("SetControlValue","JizdniKontroler",0,vykon - 0.05)
										casstupnu = 0
										caszkroku = (math.random(3,7)/20)
									elseif vykon < 0 and casstupnu >= caszkroku then
										Call("SetControlValue","JizdniKontroler",0,vykon + 0.25)
										casstupnu = 0
										caszkroku = (math.random(8,12)/20)
									end
								elseif kontroler == 0.5 and not blokKrokSkluz and not SnizenyVykonVozu then
									if vykon < 0 and casstupnu >= caszkroku then
										Call("SetControlValue","JizdniKontroler",0,vykon+0.25)
										casstupnu = 0
										caszkroku = (math.random(3,7)/20)
									elseif vykon < 0.05 and casstupnu >= caskroku and (JOB == 1 or pojezdNeschopna) then
										Call("SetControlValue","JizdniKontroler",0,vykon+0.05)
										casstupnu = 0
										caskroku = (math.random(8,12)/20)
									end
								elseif kontroler == 1 and not blokKrokSkluz and not SnizenyVykonVozu then
									if vykon >= 0.05 and vykon < 1 and casstupnu >= caskroku and (JOB == 1 or pojezdNeschopna) and ojDiag == 0 then
										if Call("GetControlValue", "synchronizacniRele", 0) < 1 then
											Call("SetControlValue","JizdniKontroler",0,vykon+0.05)
											casstupnu = 0
											caskroku = (math.random(8,12)/20)
										end
									elseif vykon < 0 and casstupnu >= caszkroku and (JOB == -1  or pojezdNeschopna) then
										Call("SetControlValue","JizdniKontroler",0,vykon+0.25)
										casstupnu = 0
										caszkroku = (math.random(3,7)/20)
									elseif vykon < 0.05 and casstupnu >= caskroku and (JOB == 1 or pojezdNeschopna) then
										Call("SetControlValue","JizdniKontroler",0,0.05)
										casstupnu = 0
										caskroku = (math.random(8,12)/20)
									end
								elseif Rychlost < rychlostEDB and vykon < 0 and casstupnu >= caszkroku then
									blokEDB = true
									Call("SetControlValue","JizdniKontroler",0,vykon+0.25)
									casstupnu = 0
									caszkroku = (math.random(3,7)/20)
								elseif kontroler == -0.5 or (kontroler == -1 and blokKrokNU) then
									if vykon > 0 and casstupnu >= caszkroku and (JOB == 1 or pojezdNeschopna) then
										Call("SetControlValue","JizdniKontroler",0,vykon-0.05)
										casstupnu = 0
										caszkroku = (math.random(3,7)/20)
									elseif vykon == 0 and casstupnu >= caskroku and (JOB == -1 or pojezdNeschopna) and Rychlost > rychlostEDB and not blokKrokSkluz and not blokEDB and not (PrvniEDBorVzduch == "vzduch" and tlak_HP > 3.5) then
										Call("SetControlValue","JizdniKontroler",0,vykon-0.25)
										casstupnu = 0
										caskroku = (math.random(8,12)/20)
									-- elseif vykon < -0.25 and casstupnu >= caszkroku and (JOB == -1 or pojezdNeschopna) and Rychlost > rychlostEDB and not blokKrokSkluz and not blokEDB then
									-- 	Call("SetControlValue","JizdniKontroler",0,vykon+0.25)
									-- 	casstupnu = 0
									-- 	caszkroku = (math.random(3,7)/20)
									end
								elseif kontroler == -1 then 
									if vykon <= -0.25 and vykon > -1 and casstupnu >= caskroku and (JOB == -1 or pojezdNeschopna) and not blokKrokSkluz and not blokKrokNU and Rychlost > rychlostEDB and not blokEDB and ojDiag == 0 and not (PrvniEDBorVzduch == "vzduch" and tlak_HP > 3.5) then
										if Ammeter >= -350 then
											Call("SetControlValue","JizdniKontroler",0,vykon-0.25)
											casstupnu = 0
											caskroku = (math.random(8,12)/20)
										end
									elseif vykon > 0 and casstupnu >= caszkroku and (JOB == 1 or pojezdNeschopna) then
										Call("SetControlValue","JizdniKontroler",0,vykon-0.05)
										casstupnu = 0
										caszkroku = (math.random(3,7)/20)
									elseif vykon > -0.25 and casstupnu >= caskroku and (JOB == -1 or pojezdNeschopna) and not blokKrokSkluz and not blokKrokNU and Rychlost > rychlostEDB and not blokEDB and not (PrvniEDBorVzduch == "vzduch" and tlak_HP > 3.5) then
										Call("SetControlValue","JizdniKontroler",0,-0.25)
										casstupnu = 0
										caskroku = (math.random(8,12)/20)
									end
								end
							elseif JeNouzovyRadic == 1 and prepinaceTlak > 3.5 and baterie == 1 and not pojezdVDepu then
								if kontroler - vykon > 0.03 and casstupnu >= caskroku and JOB == 1 and Smer ~= 0 and ventilatoryTM == 1 then
									Call("SetControlValue","JizdniKontroler",0,vykon+0.05)
									casstupnu = 0
									caskroku = (math.random(8,12)/20)
								elseif kontroler - vykon < -0.03 and vykon > 0 and casstupnu >= caszkroku or JOB ~= 1 then
									Call("SetControlValue","JizdniKontroler",0,vykon-0.05)
									casstupnu = 0
									caszkroku = (math.random(3,7)/20)
								end
							end
							vykon = Call("GetControlValue","JizdniKontroler",0) 
							if (vykon < 0.05 and vykon >= 0) or (vykon > -0.25 and vykon <= 0) then 
								Call("SetControlValue","JizdniKontroler",0,0) 
								vykon = 0 
							end
							pojezdNeschopna = false
							if (PC == 3.75 and HlavniVypinac == 1 and baterie == 1 and Call("GetControlValue","VentilatoryTM",0) == 1 and not (SnizenyVykonVozu and vykon > 0) and JOB ~= 0) or pojezdVDepu then -- kontrola podmínek pro jízdu
								if vykon == 0 or not pojezdNeschopna then
									Call("SetControlValue","MuteSounds",0,0)
								end
								Call("SetControlValue","VykonPredTrCh",0,Call("GetControlValue","JizdniKontroler",0))
							elseif (kontroler ~= 0 or vykon ~= 0) and Call("GetControlValue","mgVS",0) > 0 and baterie == 1 and not (SnizenyVykonVozu and vykon > 0) then
								Call("SetControlValue","VykonPredTrCh",0,Call("GetControlValue","JizdniKontroler",0))
								pojezdNeschopna = true
								Call("SetControlValue","MuteSounds",0,1)
							else
								if vykon == 0 or not pojezdNeschopna then
									Call("SetControlValue","MuteSounds",0,0)
								end
								Call("SetControlValue","VykonPredTrCh",0,0)
							end
							if JeNouzovyRadic == 0 then
								if Call("GetControlValue","VirtualThrottleAndBrake",0) > 1 then
									Call("SetControlValue","VirtualThrottleAndBrake",0,1)
								end
							end
							if JeNouzovyRadic == 1 and Call("GetControlValue","RadicNouzovy",0) > 0.85 then
								Call("SetControlValue","RadicNouzovy",0,0.85)
							end
							stupenKontroleruOld = stupenKontroleru
							if vykon > 0 then
								stupenKontroleru = vykon/0.05
								cele, zbytek = divMod(stupenKontroleru,1) 
								if zbytek ~= 0 then
									if zbytek > 0.5 then
										stupenKontroleru = cele + 1
									else 
										stupenKontroleru = cele
									end
								end
							end
							if vykon < 0 then
								stupenKontroleru = vykon/0.5
								cele, zbytek = divMod(stupenKontroleru,1)
								if zbytek ~= 0 then
									if zbytek < -0.5 then
										stupenKontroleru = cele - 1
									else
										stupenKontroleru = cele
									end
								end
							end

							local blokujJK = false
							local blokujSmer = true
							if Smer == 0 or Smer == 2 or baterie ~= 1 then
								blokujJK = true
							end
							if vykon == 0 and baterie == 1 and not pojezdNeschopna and (Call("GetControlValue","VirtualThrottleAndBrake",0) == 0 or Call("GetControlValue","VirtualThrottleAndBrake",0) == 2) and (Call("GetControlValue","RadicNouzovy",0) == 0 or Call("GetControlValue","RadicNouzovy",0) == 2) then
								blokujSmer = false
							end

							if blokujSmer then
								if smerBlokovany == nil then
									cele, zbytek = divMod(Smer,1)
									smerBlokovany = cele
									if zbytek > 0.5 then
										smerBlokovany = smerBlokovany + 1
									end
								end
								Call("SetControlValue","UserVirtualReverser",0,smerBlokovany)
							else
								smerBlokovany = nil
							end
							
							if blokujJK then
								if JeNouzovyRadic == 0 then
									if JKBlokovany == nil then
										cele, zbytek = divMod(Call("GetControlValue","VirtualThrottleAndBrake",0),1)
										JKBlokovany = cele
										if zbytek > 0.5 then
											JKBlokovany = JKBlokovany + 1
										end
									end
									Call("SetControlValue","VirtualThrottleAndBrake",0,JKBlokovany)
								else
									Call("SetControlValue","RadicNouzovy",0,0)
								end
							else
								JKBlokovany = nil
							end
							
							if JeNouzovyRadic == 1 then
								Call("SetControlValue","VirtualThrottleAndBrake",0,2)
								if math.abs(Call("GetControlValue","RadicNouzovy",0)) < 0.025 then
									Call("LockControl","JeNouzovyRadic",0,0)
								end
							else
								Call("SetControlValue","RadicNouzovy",0,2)
								if math.abs(Call("GetControlValue","VirtualThrottleAndBrake",0)) < 0.05 then
									Call("LockControl","JeNouzovyRadic",0,0)
								end
							end

							if math.abs(Call("GetControlValue","VirtualThrottleAndBrake",0)) > 0.05 and math.abs(2-Call("GetControlValue","VirtualThrottleAndBrake",0)) > 0.05 then
								Call("SetControlValue","JeNouzovyRadic",0,0)
								Call("LockControl","JeNouzovyRadic",0,1)
							end

							if math.abs(Call("GetControlValue","RadicNouzovy",0)) > 0.025 and math.abs(2-Call("GetControlValue","RadicNouzovy",0)) > 0.025 then
								Call("SetControlValue","JeNouzovyRadic",0,1)
								Call("LockControl","JeNouzovyRadic",0,1)
							end

						----------------------------------------Ventil?tory---------------------------------------
							if HlavniVypinac == 1 and PC == 3.75 and baterie == 1 and Call("GetControlValue","Reverser",0) ~= 0 and vnitrniSit220V == 1 then
								Call("SetControlValue","VentilatoryTM",0,1)
								ventilatoryTM = 1
								if math.abs(Call("GetControlValue", "prerusovanyChodVentilatoru", 0)) > 0.5 then
									if Call("GetControlValue","odporstup",0) == 1 and ventilatory_tm_otacky == 1 then
										Call("SetControlValue","VentilatoryStrecha",0,1)
										ventilatoryStrecha = 1
									else
										Call("SetControlValue","VentilatoryStrecha",0,0)
										ventilatoryStrecha = 0
									end
								elseif ventilatory_tm_otacky == 1 then
									Call("SetControlValue","VentilatoryStrecha",0,1)
									ventilatoryStrecha = 1
								end
							elseif HlavniVypinac ~= 1 or PC ~= 3.75 or baterie ~= 1 or Call("GetControlValue","Reverser",0) == 0 or vnitrniSit220V ~= 1 then
								Call("SetControlValue","VentilatoryTM",0,0)
								ventilatoryTM = 0
								Call("SetControlValue","VentilatoryStrecha",0,0)
								ventilatoryStrecha = 0
							end

							if ventilatoryTM == 0 and JOB ~= 0 then
								Call ( "SetControlValue", "HlavniVypinac", 0, 0)
								ZamekHLvyp = 1
							end

							local nabehVentilatoru = 5.852
							local dobehVentilatoru = 12

							local poleNabehy = {0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9}

							local poleDobehy = {1,0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1}

							--TM
								if ventilatory_tm_otacky == 1 then
									blokuj_nabeh_TM = false
								end
								if ventilatory_tm_otacky == 0 then
									blokuj_dobeh_TM = false
								end

								local a, b = divMod(ventilatory_tm_otacky,0.05)

								local i = 1
								while i <= 10 do
									Call("SetControlValue","VentilatoryTMnabeh"..i,0,0)
									Call("SetControlValue","VentilatoryTMdobeh"..i,0,0)
									i = i + 1
								end

								if ventilatoryTM == 0 then
									blokuj_nabeh_TM = false
								else
									blokuj_dobeh_TM = false
								end

								if ventilatoryTM == 1 and b < 0.01 and not blokuj_nabeh_TM and ventilatory_tm_otacky <= 0.91 then
									local i = 1
									while i <= 10 do
										if math.abs(ventilatory_tm_otacky - poleNabehy[i]) < 0.01 then
											Call("SetControlValue","VentilatoryTMnabeh"..i,0,1)
											blokuj_nabeh_TM = true
											blokuj_dobeh_TM = false
											break 
										end
										i = i + 1
									end
								elseif ventilatoryTM == 0 and b < 0.01 and not blokuj_dobeh_TM and ventilatory_tm_otacky >= 0.09 then
									local i = 1
									while i <= 10 do
										if math.abs(ventilatory_tm_otacky - poleDobehy[i]) < 0.01 then
											Call("SetControlValue","VentilatoryTMdobeh"..i,0,1)
											blokuj_dobeh_TM = true
											blokuj_nabeh_TM = false
											break 
										end
										i = i + 1
									end
								end

								if ventilatoryTM == 1 and ventilatory_tm_otacky < 1 then
									ventilatory_tm_otacky = ventilatory_tm_otacky + cas/nabehVentilatoru
								elseif ventilatoryTM == 0 and ventilatory_tm_otacky > 0 then
									ventilatory_tm_otacky = ventilatory_tm_otacky - cas/dobehVentilatoru
								end

								Call("SetControlValue","VentilatoryTMotacky",0,ventilatory_tm_otacky)

								if ventilatory_tm_otacky < 0 then
									ventilatory_tm_otacky = 0
								elseif ventilatory_tm_otacky > 1 then
									ventilatory_tm_otacky = 1
								end

							--Strecha
								if ventilatory_strecha_otacky == 1 then
									blokuj_nabeh_strecha = false
								end
								if ventilatory_strecha_otacky == 0 then
									blokuj_dobeh_strecha = false
								end

								local a, b = divMod(ventilatory_strecha_otacky,0.05)

								local i = 1
								while i <= 10 do
									Call("SetControlValue","VentilatoryStrechaNabeh"..i,0,0)
									Call("SetControlValue","VentilatoryStrechaDobeh"..i,0,0)
									i = i + 1
								end

								if ventilatoryStrecha == 0 then
									blokuj_nabeh_strecha = false
								else
									blokuj_dobeh_strecha = false
								end

								if ventilatoryStrecha == 1 and b < 0.01 and not blokuj_nabeh_strecha and ventilatory_strecha_otacky <= 0.91 then
									local i = 1
									while i <= 10 do
										if math.abs(ventilatory_strecha_otacky - poleNabehy[i]) < 0.01 then
											Call("SetControlValue","VentilatoryStrechaNabeh"..i,0,1)
											blokuj_nabeh_strecha = true
											blokuj_dobeh_strecha = false
											break 
										end
										i = i + 1
									end
								elseif ventilatoryStrecha == 0 and b < 0.01 and not blokuj_dobeh_strecha and ventilatory_strecha_otacky >= 0.09 then
									local i = 1
									while i <= 10 do
										if math.abs(ventilatory_strecha_otacky - poleDobehy[i]) < 0.01 then
											Call("SetControlValue","VentilatoryStrechaDobeh"..i,0,1)
											blokuj_dobeh_strecha = true
											blokuj_nabeh_strecha = false
											break 
										end
										i = i + 1
									end
								end

								if ventilatoryStrecha == 1 and ventilatory_strecha_otacky < 1 then
									ventilatory_strecha_otacky = ventilatory_strecha_otacky + cas/nabehVentilatoru
								elseif ventilatoryStrecha == 0 and ventilatory_strecha_otacky > 0 then
									ventilatory_strecha_otacky = ventilatory_strecha_otacky - cas/dobehVentilatoru
								end

								Call("SetControlValue","VentilatoryStrechaOtacky",0,ventilatory_strecha_otacky)

								if ventilatory_strecha_otacky < 0 then
									ventilatory_strecha_otacky = 0
								elseif ventilatory_strecha_otacky > 1 then
									ventilatory_strecha_otacky = 1
								end

						----------------------------------------Vypnuti HV v jizde pri tlaku----------------------
							if JOB > 0 and Call("GetControlValue","VirtualBrakePipePressureBAR",0) < 3.2 then
								Call ( "SetControlValue", "HlavniVypinac", 0, 0)
								ZamekHLvyp = 1
							end

						----------------------------------------Sn??en? v?kon-------------------------------------
							if Call("GetControlValue","snizenyvykonanim",0) == 1 and RizenaRidici == "ridici" then
								Call("SetControlValue","SnizenyVykon",0,1)
								snizenyVykonTady = true
							elseif snizenyVykonTady then
								snizenyVykonTady = false
								Call("SetControlValue","SnizenyVykon",0,0)
							end
							zavedSnizenyVykon = false
							if Call("GetControlValue","snizenyvykonanim",0) == 0 and Call("GetControlValue","SnizenyVykon",0) == 1 then
								if Call("GetControlValue","VykonPredTrCh",0) <= 0 then
									SnizenyVykonVozu = true
								else
									zavedSnizenyVykon = true
								end
							else
								SnizenyVykonVozu = false
							end
						----------------------------------------Brzdi? z?mek--------------------------------------
							if (Call("GetControlValue","ZamekBS2vs",0) ~= 1 or gKlicTady) and Call("GetControlValue","VirtualBrake",0) > 0.85 and Call("GetControlValue","VirtualBrake",0) < 0.87 then
								Call("LockControl","ZamekBS2",0,0)
							else
								Call("LockControl","ZamekBS2",0,1)
							end
							if Call("GetControlValue","ZamekBS2",0) == 0 then
								Call("SetControlValue","ZamekBS2vs",0,1)
								Call("LockControl","VirtualBrake",0,0)
								gKlicTady = true
							elseif Call("GetControlValue","ZamekBS2",0) == 1 and gKlicTady then
								Call("SetControlValue","ZamekBS2vs",0,0)
								gKlicTady = false
							end
							if Call("GetControlValue","ZamekBS2",0) ~= 0 then
								Call("LockControl","VirtualBrake",0,1)
							end
						----------------------------------------Nouzové vypnutí všech HV--------------------------
							if Call("GetControlValue","NZvyp",0) >= 0.5 then
								Call ( "SetControlValue", "HlavniVypinac", 0, 0)
								Call ( "SetControlValue", "povel_HlavniVypinac", 0, 0)
								ZamekHLvyp = 1
							end
						----------------------------------------Matrosov------------------------------------------
							if Call("GetControlValue","Matrosov",0) >= 0.5 then
								matrosov = true
							else
								matrosov = false
							end
						----------------------------------------Rychlý start--------------------------------------
							if pozadavekNaFastStart == 1 and not jeMrtva then
								tlak_ridiciho_ustroji = 5.0
								tlak_HP = 5.0
								navoleny_tlak = 5.0
								nastaveneValce = 0
								plynuleValce = 0
								Call("SetControlValue","ZamekBS2",0,0)
								Call("SetControlValue","ZamekBS2vs",0,1)
								Call("SetControlValue","VirtualBrake",0,0.14)
								VirtualMainReservoirPressureBAR = 10
								VirtualBrakeReservoirPressureBAR = 5
								gKlicTady = true
								RizenaRidici = "ridici"
								Call("SetControlValue","prepinacBat",0,1)
								baterie = 1
								Call("SetControlValue","VirtualPantographControl",0,1)
								Call ("SetControlValue", "PantoZadni", 0,3.75) 
								gZadniSberacControl = 3.75
								PC = 3.75
								Call("SendConsistMessage",460101,"1",1)
								Call("SendConsistMessage",460111,"Z",1)
								Call("SetControlValue","UserVirtualReverser",0,0)
								Smer = 0
								Call("SetControlValue","Reverser",0,0)
								Call("SetControlValue","mgp",0,1)
								mgp = 1
								pocetMG = decToBitsCount(pocetJimek)
								Call("SetControlValue","mg",0,pocetJimek)
								Call("SetControlValue","mgVS",0,pocetJimek)
								NastavHodnotuSID("mgPriprava",1,460116)
								Call("SetControlValue","mgZvuk",0,1)
								mg = 1
								NastavHodnotuSID("mg",1,460118)
								napetiVS220 = 380 
								napetiVS220nouz = 380
								Call("SetControlValue","VirtualStartup",0,0.75)
								Call ( "SetControlValue", "HlavniVypinac", 0, 1)
								Call ( "SetControlValue", "povel_HlavniVypinac", 0, 1)
								Call("SetControlValue","HlKompPrep",0,1)
								Call("SetControlValue","DvereLeveSignal",0,0)
								Call("SetControlValue","DverePraveSignal",0,0)
								LVZ(0,0,0,0)
								klic = 1
								Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR)
								Call("SetControlValue","VirtualBrakeSettedPressureBAR",0,navoleny_tlak)
								Call("SetControlValue","VirtualBrakeControlSystemPressureBAR",0,tlak_ridiciho_ustroji)
								Call("SetControlValue","VirtualBrakePipePressureBAR",0,tlak_HP)
								Call("SetControlValue","VirtualTrainBrakeCylinderPressureBAR",0,VirtualTrainBrakeCylinderPressureBAR)
								Call("SetControlValue","VirtualBrakeReservoirPressureBAR",0,VirtualBrakeReservoirPressureBAR)
								Call("SetControlValue","PantoJimka",0,4)
								Call("SetControlValue","EngineBrakeControl",0,0)
								Call("SetControlValue","HandBrake",0,0);
								levaPozBilVPKC = false
								pravaPozBilVPKC = false
								if predMasinou == 0 then
									levaPozBilVPKC = true
									pravaPozBilVPKC = true
									horniPozBilVKPC = true
									Call("SetControlValue","VolbaPozicKonecCelo",0,0)
									Call("OnControlValueChange","VolbaPozicKonecCelo",0,0)
								end
								levaPozCerVPKC = false
								pravaPozCerVPKC = false
								PantoJimkaZKom = 4
								Call("SetControlValue","mgautostart",0,1)
								Call("SetControlValue", "LVZrezim", 0, 0)
								Call("SetControlValue", "LVZhv", 0, 1)
								byloZhaveni = true
								soupatkoVZ = 0
								Call("SetControlValue","FastStart",0,0)
								pozadavekNaFastStart = 0
								SysCall("ScenarioManager:ShowMessage", ZPRAVA_HLAVICKA, ZPRAVA_FAST_START,ALERT)
							elseif pozadavekNaFastStart == 1 and jeMrtva then
								SysCall("ScenarioManager:ShowMessage", ZPRAVA_HLAVICKA, ZPRAVA_NEUSPESNY_FAST_START,ALERT)
								pozadavekNaFastStart = 0
								Call("SetControlValue","FastStart",0,0)
							elseif pozadavekNaFastStart == 2 and not jeMrtva then
								horniPozBilVKPC = false
								levaPozBilVPKC = false
								pravaPozBilVPKC = false
								levaPozCerVPKC = false
								pravaPozCerVPKC = false
								if predMasinou == 0 then
									levaPozCerVPKC = true
									pravaPozCerVPKC = true
									Call("SetControlValue","VolbaPozicKonecCelo",0,2)
									Call("OnControlValueChange","VolbaPozicKonecCelo",0,2)
								end
								tlak_ridiciho_ustroji = 5.0
								tlak_HP = 5.0
								navoleny_tlak = 5.0
								nastaveneValce = 0
								plynuleValce = 0
								Call("SetControlValue","prepinacBat",0,1)
								baterie = 1
								Call("SetControlValue","VirtualPantographControl",0,1)
								if MaPredniPantograf == 1 then Call ("SetControlValue", "PantoPredni", 0,3.75) gPredniSberacControl = 3.75 else Call ("SetControlValue", "PantoZadni", 0,3.75) gZadniSberacControl = 3.75 end
								PC = 3.75
								Call("SetControlValue", "LVZrezim", 0, 1)
								Call("SetControlValue","EngineBrakeControl",0,0)
								Call("SetControlValue","HandBrake",0,0)
								Call("SetControlValue","VirtualStartup",0,0)
								klic = 0
								Call("SendConsistMessage",460101,"0",1)
								VirtualMainReservoirPressureBAR = 10
								VirtualBrakeReservoirPressureBAR = 5
								Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR)
								Call("SetControlValue","VirtualBrakeSettedPressureBAR",0,navoleny_tlak)
								Call("SetControlValue","VirtualBrakeControlSystemPressureBAR",0,tlak_ridiciho_ustroji)
								Call("SetControlValue","VirtualBrakePipePressureBAR",0,tlak_HP)
								Call("SetControlValue","VirtualTrainBrakeCylinderPressureBAR",0,VirtualTrainBrakeCylinderPressureBAR)
								Call("SetControlValue","VirtualBrakeReservoirPressureBAR",0,VirtualBrakeReservoirPressureBAR)
								Call("SetControlValue","PantoJimka",0,3.11)
								Call("SetControlValue","mgZvuk",0,1)
								mg = 1
								NastavHodnotuSID("mg",1,460118)
								napetiVS220 = 380 
								napetiVS220nouz = 380
								PantoJimkaZKom = 3.11
								Call("SetControlValue","mgautostart",0,1)
								Call("SetControlValue","FastStart",0,0)
								pozadavekNaFastStart = 0
							elseif pozadavekNaFastStart == 2 and jeMrtva then
								SysCall("ScenarioManager:ShowMessage", ZPRAVA_HLAVICKA, ZPRAVA_NEUSPESNY_FAST_START,ALERT)
								pozadavekNaFastStart = 0
								Call("SetControlValue","FastStart",0,0)
							end
						----------------------------------------JOB-----------------------------------------------
							if RizenaRidici == "ridici" then
								if kontroler > 0 and Call("GetControlValue","VykonPredTrCh",0) == 0 and baterie == 1 then
									Call("SetControlValue","JOBpovel",0,1)
								elseif kontroler < 0 and Call("GetControlValue","VykonPredTrCh",0) == 0 and baterie == 1 then
									Call("SetControlValue","JOBpovel",0,-1)
								elseif Call("GetControlValue","VykonPredTrCh",0) == 0 or baterie == 0 then
									Call("SetControlValue","JOBpovel",0,0)
								end
							end
							if Call("GetControlValue","VykonPredTrCh",0) == 0 and baterie == 1 and ventilatoryTM == 1 and P01 == 1 and Call("GetControlValue","JOBpovel",0) == 1 then
								Call("SetControlValue","JOB",0,1)
							elseif Call("GetControlValue","VykonPredTrCh",0) == 0 and baterie == 1 and ventilatoryTM == 1 and Call("GetControlValue","JOBpovel",0) == -1 then
								Call("SetControlValue","JOB",0,-1)
							elseif Call("GetControlValue","VykonPredTrCh",0) == 0 or ventilatoryTM == 0 or baterie == 0 or P01 ~= 1 or Call("GetControlValue","JOBpovel",0) == 0 then
								Call("SetControlValue","JOB",0,0)
							end

							if (Call("GetControlValue","JOB",0) ~= 0 or pojezdVDepu) and not SnizenyVykonVozu then
								Call("SetControlValue","PantographControl",0,1)
							else
								Call("SetControlValue","PantographControl",0,0)
							end

							if Ammeter > 600 and JOB == 0 and JOBold ~= 0 then
								VypniHVaVynutRestart()
							end
						----------------------------------------Pojezd v depu-------------------------------------
							if PC == 0 and baterie == 1 and centrala == 1 and JOB == 0 and buttonPojezdVDepu > 0.75 then
								pojezdVDepu = true
								Call("SetControlValue","VykonPredTrCh",0,0.01)
								Call("SetControlValue","StykacPojezd",0,1)
							else
								pojezdVDepu = false
								Call("SetControlValue","StykacPojezd",0,0)
							end
						----------------------------------------Okenka a zvuky deste------------------------------
							okna = (Call("GetControlValue","OknoL",0)+Call("GetControlValue","OknoP",0))/2
							
							if SysCall("GetPrecipitationDensity") > 0 then
								if SysCall("GetCurrentPrecipitationType") < 2 then
									if venku then
										Call("EngineSound:SetParameter", "DestIn", 0)
										Call("EngineSound:SetParameter", "DestExOkno", 0)
										Call("EngineSound:SetParameter", "DestEx", 1)
										Call("EngineSound:SetParameter", "Kroupy", 0)
									else
										Call("EngineSound:SetParameter", "DestIn", 1)
										Call("EngineSound:SetParameter", "DestExOkno", 1)
										Call("EngineSound:SetParameter", "DestEx", 0)
										Call("EngineSound:SetParameter", "Kroupy", 0)
									end
								elseif SysCall("GetCurrentPrecipitationType") == 2 then
									if venku then
										Call("EngineSound:SetParameter", "DestIn", 0)
										Call("EngineSound:SetParameter", "DestExOkno", 0)
										Call("EngineSound:SetParameter", "DestEx", 1)
									else
										Call("EngineSound:SetParameter", "DestIn", 0)
										Call("EngineSound:SetParameter", "DestExOkno", 0)
										Call("EngineSound:SetParameter", "DestEx", 0)
										if SysCall("GetPrecipitationDensity") > 0.5 then
											Call("EngineSound:SetParameter", "Kroupy", 2)
										else
											Call("EngineSound:SetParameter", "Kroupy", 1)
										end
									end
								else
									Call("EngineSound:SetParameter", "DestIn", 0)
									Call("EngineSound:SetParameter", "DestExOkno", 0)
									Call("EngineSound:SetParameter", "DestEx", 0)
									Call("EngineSound:SetParameter", "Kroupy", 0)
								end
							else
								Call("EngineSound:SetParameter", "DestIn", 0)
								Call("EngineSound:SetParameter", "DestExOkno", 0)
								Call("EngineSound:SetParameter", "DestEx", 0)
								Call("EngineSound:SetParameter", "Kroupy", 0)
							end
							if not vOddile then
								Call("EngineSound:SetParameter", "OknaOcclusion", okna)
							else
								Call("EngineSound:SetParameter", "OknaOcclusion", 0)
							end
						----------------------------------------Vnitrni sit---------------------------------------
							mgZvuk = Call("GetControlValue","mgZvuk",0)
							if mgZvuk == 1 and napetiVS220 < 380 then
								napetiVS220 = napetiVS220 + cas * 100
							elseif mgZvuk == 0 and napetiVS220 > 0 then
								napetiVS220 = napetiVS220 - cas * 10
							end
							if napetiVS220 > 300 and mgdocasny == 0 then
								vnitrniSit220V = 1
							else
								vnitrniSit220V = 0
							end
							Call("SetControlValue","VnitrniSit",0,napetiVS220)

							if Call("GetControlValue","mgVS",0) > 1 and napetiVS220nouz < 380 then
								napetiVS220nouz = napetiVS220nouz + cas * 100
							elseif Call("GetControlValue","mgVS",0) == 0 and napetiVS220nouz > 0 then
								napetiVS220nouz = napetiVS220nouz - cas * 10
							end
							if math.max(napetiVS220nouz,napetiVS220) > 300 and mgdocasny == 0 then
								vnitrniSit220Vnouzova = 1
							else
								vnitrniSit220Vnouzova = 0
							end
							Call("SetControlValue","VnitrniSitNouzova",0,math.max(napetiVS220nouz,napetiVS220))
						
						----------------------------------------Custom TrCh---------------------------------------
							Call("SetControlValue","ThrottleAndBrake",0,VratTCh(Call("GetControlValue","VykonPredTrCh",0)))
							vykon = Call("GetControlValue","VykonPredTrCh",0)
						----------------------------------------Custom Ampermetr----------------------------------
							Call("SetControlValue","Ampermetr",0,VratProud(Call("GetControlValue","ThrottleAndBrake",0),Call("GetControlValue","VykonPredTrCh",0)))
							Ammeter = Call("GetControlValue","Ampermetr",0)
							if not pojezdNeschopna and Call("GetControlValue", "Ammeter", 0) ~= 0 then
								-- Call("SetControlTargetValue","VirtualAmmeter",0,Call("GetControlValue","Ampermetr",0))
									Call("SetControlValue","VirtualAmmeter",0,PIDcntrlAmp(Call("GetControlValue", "Reverser", 0)*Call("GetControlValue","Ampermetr",0),Call("GetControlValue","VirtualAmmeter",0)))
							else
								Call("SetControlValue","VirtualAmmeter",0,PIDcntrlAmp(0,Call("GetControlValue","VirtualAmmeter",0)))
							end
							
						----------------------------------------VOLTMETR------------------------------------------
							local tvrdostNapeti = math.sqrt(math.sqrt(math.floor(((math.floor(os.time()/100)/100) - math.floor(math.floor(os.time()/100)/100))*100)+mm))
							if not pojezdNeschopna then
								napeti = ((3000 - (200 * Ammeter / 700)) - ((tvrdostNapeti-2.5) * 300)) / 3.896
							else
								napeti = (3000 - ((tvrdostNapeti-2.5) * 300)) / 3.896
							end
							if Ammeter < 0 then
								napeti = (3000 - ((tvrdostNapeti-2.5) * 300)) / 3.896
							end
							if P01 == 1 and not pojezdVDepu then
								Call("SetControlValue","Napeti",0,napeti)
								Call("SetControlValue","Voltmeter",0,PIDcntrlVolt(napeti,Call("GetControlValue","Voltmeter",0)))
							else
								Call("SetControlValue","Voltmeter",0,PIDcntrlVolt(0,Call("GetControlValue","Voltmeter",0)))
								Call("SetControlValue","Napeti",0,0)
							end
							
						----------------------------------------Diagnostický panel a ochrany----------------------
							local stridaveNap = ToBolAndBack(vnitrniSit220Vnouzova)
							if stridaveNap and baterie == 1 then
								--*******H6 SIT220V
									Call("SetControlValue","Diag_220V",0,0) -- H6
									
								--*******H7 vypHV
									local diagHV = 0
									if ZamekHLvyp == 1 then
										diagHV = 1
									end
									Call("SetControlValue","Diag_HV",0,diagHV) -- H7
								
								--*******H8 VENTILATORY
									local diagVentilatoryBeh = 0
									if ventilatoryTM == 1 then
										if casVentilatory == nil then
											casVentilatory = math.random(3,6)
										end
										gTimeVentilatory = gTimeVentilatory + cas
										if gTimeVentilatory > casVentilatory then
											diagVentilatoryBeh = 0
										else
											diagVentilatoryBeh = 1
										end
									else
										gTimeVentilatory = 0
										casVentilatory = nil
									end
									Call("SetControlValue","Diag_Ventilatory",0,diagVentilatoryBeh) -- H8
								
								--*******H9 AREL
									local diagArel = 0
									Call("SetControlValue","Diag_AREL",0,diagArel) -- H9
								
								--*******H10 USMERNOVAC
									local diagPretaveni = 0
									Call("SetControlValue","Diag_Pretaveni",0,diagPretaveni) -- H10
								
								--*******H11 NU
									if Rychlost > 100 and vykon < -0.5 then
										diagNU = 1
										if Call("GetControlValue","Diag_NU",0) == 0 then
											-- Call ( "SetControlValue", "HlavniVypinac", 0, 0)
											-- ZamekHLvyp = 1
											blokKrokNU = true
											if vykon == -1 then
												Call("SetControlValue","JizdniKontroler",0,-0.5)
											end
										end
									elseif Call("GetControlValue", "povel_Reverser", 0) == 0 then
										diagNU = 0
										blokKrokNU = false
									end
									Call("SetControlValue","Diag_NU",0,diagNU) -- H11
								
								--*******H12 PU
									if Call("GetControlValue", "povel_Reverser", 0) ~= 0 and (Call("GetControlValue","Napeti",0) < 500 and P01 == 1) then
										diagPU = 1
										if Call("GetControlValue","Diag_PU",0) == 0 and P01 == 1 then
											Call ( "SetControlValue", "HlavniVypinac", 0, 0)
											ZamekHLvyp = 1
										end
									elseif Call("GetControlValue", "povel_Reverser", 0) == 0 then
										diagPU = 0
									end
									Call("SetControlValue","Diag_PU",0,diagPU) -- H12
								
								--*******H13 DOTO
									local dotoDiag = 0
									if false then
										dotoDiag = 1
									else
										dotoDiag = 0
									end
									Call("SetControlValue","Diag_DOTO",0,dotoDiag) -- H13
								
								--*******H14 DOPM
									local mgDiag = 0
									if false then
										mgDiag = 1
										--Call("GetControlValue","ResetDOPM",0) > 0.75
									else
										mgDiag = 0 
									end
									Call("SetControlValue","Diag_DOPM",0,mgDiag) -- H14
								
								--*******H15 NI
									if Ammeter > 800 then
										niDiag = 1 
										if Call("GetControlValue","Diag_NI",0) == 0 and P01 == 1 then
											Call ( "SetControlValue", "HlavniVypinac", 0, 0)
											ZamekHLvyp = 1
										end
									elseif Call("GetControlValue", "povel_Reverser", 0) == 0 then
										niDiag = 0
									end
									Call("SetControlValue","Diag_NI",0,niDiag) -- H15
								
								--*******H18 OJ
									if (vykon ~= 0 and math.abs(Ammeter) < 0.05) or (Call("GetControlValue", "Ammeter", 0) == 0 and vykon ~= 0 and not pojezdVDepu and Call("GetIsEngineWithKey") == 1) and not pojezdNeschopna then
										ojDiag = 1
									elseif kontroler == 0 or math.abs(Ammeter) > 0.5 or Call("GetControlValue", "Ammeter", 0) ~= 0 or pojezdNeschopna then
										ojDiag = 0
									end
									Call("SetControlValue","Diag_OJ",0,ojDiag) -- H18
									-- if vykon ~= 0 and Call("GetControlValue", "Current", 0) == 0 then
									-- 	SysCall("ScenarioManager:ShowMessage", "460 Debug", "Proud je nula, ale vykon neni nula!", ALERT)
									-- end

								--*******H19 SOUCINOST BRZD
									local rbDiag = 0
									if Ammeter < -300 and PrvniEDBorVzduch == "EDB" then
										rbDiag = 1
									end
									Call("SetControlValue","Diag_RB",0,rbDiag) -- H19
								
								--*******H20 UZEMNENI
									local uzemneniDiag = 0
									Call("SetControlValue","Diag_Uzem",0,uzemneniDiag) -- H20
								
								--*******H22 POZICE JOB
									local jobDiag = 0
									if ((Call("GetControlValue","VykonPredTrCh",0) > 0 and JOB ~= 1) or (Call("GetControlValue","VykonPredTrCh",0) == 0 and JOB ~= 0) or (Call("GetControlValue","VykonPredTrCh",0) < 0 and JOB ~= -1)) and RizenaRidici == "ridici" then
										jobDiag = 1
									end
									Call("SetControlValue","Diag_JOB",0,jobDiag) -- H22
								
								--*******H24 ROZ PROUD
									local rozProudDiag = 0
									if Ammeter > proud and not pojezdNeschopna then
										rozProudDiag = 1
									end
									Call("SetControlValue","Diag_RozProud",0,rozProudDiag) -- H24

								--*******ObecnaPorucha a Skluz
									if Call("GetControlValue","JOB",0) ~= 0 and Call("GetControlValue","VykonPredTrCh",0) == 0 then
										failvykon = 1 
									else
										failvykon = 0
									end
									if stridaveNap then
										skluzmg = 0
									else
										skluzmg = 1
									end
									if vnitrniSit220V ~= 1 then
										failmg = 1
									else
										failmg = 0
									end
									
									if skluzWheelSlip == 1 then
										casSkluz = casSkluz + cas
										if wheelSlip > 2 and P01 == 1 then
											Call ( "SetControlValue", "HlavniVypinac", 0, 0)
											ZamekHLvyp = 1
										else
											if casSkluz > 0.225 or prvniKrok then
												casSkluz = 0
												prvniKrok = false
												if vykon > 0 then
													Call("SetControlValue","JizdniKontroler",0,vykon - 0.05)
												elseif vykon < 0 then
													Call("SetControlValue","JizdniKontroler",0,vykon + 0.25)
												end
											end
										end
										skluzDiag = 1
										blokKrokSkluz = true
									end
									if kontroler <= 0.5 and kontroler >= -0.5 then --predelat na tlacitko az bude
										--if Call("GetControlValue","ResetDOTO",0) > 0.75 then
										blokKrokSkluz = false
										skluzDiag = 0
										casSkluz = 0
										prvniKrok = true
									end

									Call("SetControlValue","fail",0,math.max(math.min(Call("GetControlValue","poruchaVeVlaku",0),1),failmg,failvykon,diagHV,diagArel,diagPretaveni,diagNU,diagPU,skluzDiag,mgDiag,niDiag,ojDiag,uzemneniDiag,jobDiag))
									Call("SetControlValue","skluz",0,math.max(skluzDiag,skluzWheelSlip))
								--*******H5 OBECNA POR NA VLASTNIM
									local PoruchaNap = 0
									Call("SetControlValue","Diag_Porucha",0,math.max(failmg,failvykon,PoruchaNap,diagHV,diagArel,diagPretaveni,diagNU,diagPU,skluzDiag,mgDiag,niDiag,ojDiag,uzemneniDiag,jobDiag)) -- H5
									NastavHodnotuSID("poruchaVeVlaku",Call("GetControlValue","Diag_Porucha",0),460120)
								--*******Odshuntovani az do odporu
									if stupenKontroleru > 17 then
										shunty = true
									else
										shunty = false
									end
									if shunty and stupenKontroleru < stupenKontroleruOld then
										pocitejCasShuntu = true
									end
									if not shunty then
										pocitejCasShuntu = false
									end 
									if pocitejCasShuntu then
										casShuntu = casShuntu + cas
									else
										casShuntu = 0
									end
									if casShuntu > 6 then
										Call("SetControlValue","HlavniVypinac",0,0)
										ZamekHLvyp = 1
									end
							elseif baterie == 1 then
								Call("SetControlValue","fail",0,1)
								Call("SetControlValue","skluz",0,1)
								Call("SetControlValue","Diag_Porucha",0,1) -- H5
								Call("SetControlValue","Diag_220V",0,1) -- H6
								Call("SetControlValue","Diag_HV",0,1) -- H7
								Call("SetControlValue","Diag_RozProud",0,1) -- H24
								if ZamekHLvyp == 0 then
									Call("SetControlValue","Diag_NU",0,1) -- H11
									Call("SetControlValue","Diag_PU",0,1) -- H12
									Call("SetControlValue","Diag_DOTO",0,1) -- H13
									Call("SetControlValue","Diag_DOPM",0,1) -- H14
									Call("SetControlValue","Diag_NI",0,1) -- H15
									Call("SetControlValue","Diag_OJ",0,1) -- H18
								elseif diagPU == 1 then
									Call("SetControlValue","Diag_PU",0,1) -- H12
									if Call("GetControlValue", "povel_Reverser", 0) == 0 then
										diagPU = 0
									end
								elseif skluzDiag == 1 then
									Call("SetControlValue","Diag_DOTO",0,1) -- H12
									if Call("GetControlValue", "povel_Reverser", 0) == 0 then --predelat na tlacitko az bude
										--if Call("GetControlValue","ResetDOTO",0) > 0.75 then
										blokKrokSkluz = false
										skluzDiag = 0
										casSkluz = 0
										prvniKrok = true
									end
								elseif niDiag == 1 then
									Call("SetControlValue","Diag_NI",0,1) -- H15
									if Call("GetControlValue", "povel_Reverser", 0) == 0 then
										niDiag = 0
									end
								end
							else
								ZamekHLvyp = 0
								diagNU = 0
								diagPU = 0
								skluzDiag = 0
								niDiag = 0
								ojDiag = 0
								Call("SetControlValue","Diag_220V",0,0) -- H6
								Call("SetControlValue","Diag_HV",0,0) -- H7
								Call("SetControlValue","Diag_Ventilatory",0,0) -- H8
								Call("SetControlValue","Diag_AREL",0,0) -- H9
								Call("SetControlValue","Diag_Pretaveni",0,0) -- H10
								Call("SetControlValue","Diag_NU",0,diagNU) -- H11
								Call("SetControlValue","Diag_PU",0,diagPU) -- H12
								Call("SetControlValue","Diag_DOTO",0,skluzDiag) -- H13
								Call("SetControlValue","Diag_DOPM",0,0) -- H14
								Call("SetControlValue","Diag_NI",0,niDiag) -- H15
								Call("SetControlValue","Diag_OJ",0,ojDiag) -- H18
								Call("SetControlValue","Diag_RB",0,0) -- H19
								Call("SetControlValue","Diag_Uzem",0,0) -- H20
								Call("SetControlValue","Diag_JOB",0,0) -- H22
								Call("SetControlValue","Diag_RozProud",0,0) -- H24
								Call("SetControlValue","fail",0,0)
								Call("SetControlValue","skluz",0,0)
								Call("SetControlValue","Diag_Porucha",0,0) -- H5
							end
					end
				--##################################################################################--
				------------------------------------KONEC gásti expert controls-----------------------
				--##################################################################################--
				-- else
				-- 	--##################################################################################--
				-- 	------------------------------------ČOST simple controls------------------------------
				-- 	--##################################################################################--
				-- 	if UzJsiZjistovalPanto == false then
				-- 		MaPredniPantograf = Call("ControlExists","PantoPredni",0)
				-- 		UzJsiZjistovalPanto = true
				-- 		Call ( "DalkovePrave:Activate", 0 )
				-- 		Call ( "DalkoveLeve:Activate", 0 )
				-- 		Call ( "ActivateNode","dalkaclevy",0)
				-- 		Call ( "ActivateNode","dalkacpravy",0)
				-- 		Call ( "ActivateNode","reflektor_rozsviceny",0) 
				-- 		Call ( "PozickaHorniBi:Activate", 0 )
				-- 		Call ( "PozickaLevaBi:Activate", 0 )
				-- 		Call ( "PozickaLevaCr:Activate", 0 )
				-- 		Call ( "PozickaPravaBi:Activate", 0 )
				-- 		Call ( "PozickaPravaCr:Activate", 0 )
				-- 		Call ( "ActivateNode", "pozickalevaBi", 0 ) 
				-- 		Call ( "ActivateNode", "pozickalevaCr", 0 ) 
				-- 		Call ( "ActivateNode", "pozickapravaBi", 0 ) 
				-- 		Call ( "ActivateNode", "pozickapravaCr", 0 ) 
				-- 		soupatkoVZ = 0
				-- 		if PolohaKlice == 0.25 then klic = 1 end
				-- 		if MaPredniPantograf == 1 then
				-- 			Call ("SetTime","PredniSberac",0)
				-- 			Call ("SetTime","ZadniSberac",0)
				-- 		else
				-- 			Call ("SetTime","ZadniSberac",0)
				-- 		end
				-- 		Call("SetControlValue","vysilacka_displeje",0,0)
				-- 		Call("SetControlValue","HlavniVypinac",0,0)
				-- 		Call("SetControlValue","VirtualStartup",0,0)
				-- 		Call("SetControlValue","PantoJimka",0,3.11)
				-- 	end
				-- 	if MaPredniPantograf == 1 then PredniPanto = Call("GetControlValue", "PantoPredni", 0) else PredniPanto = 0 end
				-- 	ZadniPanto = Call("GetControlValue", "PantoZadni", 0)

				-- 	----------------------------------------Pantografy----------------------------------------
				-- 	sberaceSimple = Call("GetControlValue","VirtualPantographControl",0)
				-- 	smerSimple = 1
				-- 	if Call("GetSpeed") > 1 then
				-- 		smerSimple = 1
				-- 	elseif Call("GetSpeed") < -1 then
				-- 		smerSimple = -1
				-- 	end
				-- 	if sberaceSimple == 1 then
				-- 		if smerSimple == 1 then
				-- 			gPredniSmetak = 0
				-- 			gZadniSmetak = 1
				-- 		elseif smerSimple == 2 then
				-- 			gPredniSmetak = 1
				-- 			gZadniSmetak = 0
				-- 		end
				-- 	else
				-- 		gPredniSmetak = 0
				-- 		gZadniSmetak = 0
				-- 	end
						
				-- 	if gCommonTimer >= 0.0125 then
				-- 		if gPredniSmetak == 1 then -- predni zberac
				-- 			if PredniPanto < 3.75 and Call("GetControlValue","PantoJimka",0) > 0.87393202250021 then
				-- 				gPredniSberacControl = gPredniSberacControl + (((Call("GetControlValue","PantoJimka",0)/10)-0.087393202250021)^2)
				-- 				Call("SetControlValue", "PantoPredni", 0, gPredniSberacControl)
				-- 			end
				-- 		elseif gPredniSmetak == 0 then
				-- 			if PredniPanto > 0 then
				-- 				gPredniSberacControl = gPredniSberacControl - 0.075
				-- 				Call("SetControlValue", "PantoPredni", 0, gPredniSberacControl)
				-- 			end
				-- 		end
				-- 		if MaPredniPantograf == 1 then
				-- 			if gPredniSberacOld ~= Call("GetControlValue", "PantoPredni", 0) then
				-- 				Call("AddTime", "PredniSberac", Call("GetControlValue", "PantoPredni", 0) - gPredniSberacOld)
				-- 			end
				-- 			gPredniSberacOld = Call("GetControlValue", "PantoPredni", 0)
				-- 			if gPredniSberacControl > 3.75 then gPredniSberacControl = 3.75 end
				-- 			if gPredniSberacControl < 0 then gPredniSberacControl = 0 end
				-- 		end
				-- 		if gZadniSmetak == 1 then -- zadni zberac
				-- 			if ZadniPanto < 3.75 and Call("GetControlValue","PantoJimka",0) > 0.87393202250021 then
				-- 				ZpravaDebug("Sberac"..gZadniSberacControl)
				-- 				gZadniSberacControl = gZadniSberacControl + (((Call("GetControlValue","PantoJimka",0)/10)-0.087393202250021)^2)
				-- 				Call("SetControlValue", "PantoZadni", 0, gZadniSberacControl)
				-- 			end
				-- 		elseif gZadniSmetak == 0 then
				-- 			if ZadniPanto > 0 then
				-- 				gZadniSberacControl = gZadniSberacControl - 0.075
				-- 				Call("SetControlValue", "PantoZadni", 0, gZadniSberacControl)
				-- 			end
				-- 		end
				-- 		if gZadniSberacOld ~= Call("GetControlValue", "PantoZadni", 0) then
				-- 			Call("AddTime", "ZadniSberac", Call("GetControlValue", "PantoZadni", 0) - gZadniSberacOld)
				-- 		end
				-- 		gZadniSberacOld = Call("GetControlValue", "PantoZadni", 0)
				-- 		if gZadniSberacControl > 3.75 then gZadniSberacControl = 3.75 end
				-- 		if gZadniSberacControl < 0 then gZadniSberacControl = 0 end
				-- 		gCommonTimer = 0
				-- 	end
				-- 	if MaPredniPantograf == 1 then PP = Call ("GetControlValue", "PantoPredni", 0) else PP = 0 end
				-- 	ZP = Call ("GetControlValue", "PantoZadni", 0)
				-- 	if MaPredniPantograf == 1 then PC=math.max(PP,ZP) else PC = ZP end
				-- 	if PC == 3.75 then
				-- 		P01 = 1
				-- 	else
				-- 		P01 = 0
				-- 	end
				-- 	if PP > 3.70 and PP ~= 3.75 then 
				-- 		Call("SetControlValue","PantoPredni",0,3.75)
				-- 	end
				-- 	if ZP > 3.70 and ZP ~= 3.75 then 
				-- 		Call("SetControlValue","PantoZadni",0,3.75)
				-- 	end
			end
		--######################################################################################--
		----------------------------------------KONEC gásti řízené userem-------------------------
		--######################################################################################--
		elseif not UzJsiZjistovalPanto then
			Call("MSVstart:ActivateNode","MSVstart",0)
			Call("MSVstart2:ActivateNode","MSVstart",0)
			IS.stav = "sleep"
			IS:NastavCil1(1,true)
			IS:NastavCil2(1,true)
			IS:NastavLinku(1,true)
			Call("SetControlValue","AI",0,1)
			Call("SetControlValue","AbsolutniRychlomer",0,math.abs(Call("GetSpeed")*3.6))
			deltaSpeedMinula = deltaSpeed
			deltaSpeed = Call("GetSpeed")
			local reflektorAI = false
			Call("SetControlValue", "DeltaSpeed", 0, math.abs(deltaSpeed) - math.abs(deltaSpeedMinula))
			if deltaSpeed > 0.01 then
				SmerAI = 1
				if predMasinou == 0 and not jeMrtva then
					SvetlaAI = 1
				else
					SvetlaAI = 0
				end
			elseif deltaSpeed < -0.01 then
				SmerAI = -1
				if predMasinou == 0 and not jeMrtva then
					SvetlaAI = 1
				else
					SvetlaAI = 0
				end
			elseif not jeMrtva then
				SvetlaAI = 1
				reflektorAI = false
			else
				SvetlaAI = 0
			end
			if not jeMrtva then
				if Call("ControlExists","PantoPredni",0) == 0 then
					Call ("SetTime","ZadniSberac",3.75)
				elseif SmerAI == 1 then 
					Call ("SetTime","PredniSberac",0)
					Call ("SetTime","ZadniSberac",3.75)
				elseif SmerAI == -1 then 
					Call ("SetTime","PredniSberac",3.75)
					Call ("SetTime","ZadniSberac",0)
				end
			else
				Call ("SetTime","ZadniSberac",0)
				if Call("ControlExists","PantoPredni",0) ~= 0 then
					Call ("SetTime","PredniSberac",0)
				end
			end
			-- ZpravaDebug(Call("PlayerEngine:GetControlValue", "Headlights", 0))
			if SvetlaAI == 1 then
				if math.abs(deltaSpeed) > 0 then
					ujeteMetryAI = ujeteMetryAI + (math.abs(deltaSpeed)*cas)
					if ujeteMetryAI > 100 then
						reflektorAI = true
					end
					pX, _, pY = SysCall("PlayerEngine:getNearPosition") or 0,0,0
					x, _, y = Call("*:getNearPosition")
					vzdalenostAIlast = vzdalenostAI
					vzdalenostAI = math.sqrt((pX-x)^2+(pY-y)^2)
					if vzdalenostAI < 300 then
						reflektorAI = false
						if 0 >= 0.5 then --Call("PlayerEngine:GetControlValue", "Headlights", 0) or
							casPlayerReflektor = casPlayerReflektor + cas
							if (casPlayerReflektor > 4 and casPlayerReflektor < 5) or casPlayerReflektor > 8 then
								reflektorAI = true
							end
						else
							casPlayerReflektor = 0
						end
					else
						casPlayerReflektor = 0
					end
					if vzdalenostAIlast < vzdalenostAI and vzdalenostAI > 100 then
						reflektorAI = true
					end
				else
					ujeteMetryAI = 0
					casPlayerReflektor = 0
				end
				if SmerAI == -1 then
					Call ( "DalkovePrave:Activate", 0 )
					Call ( "DalkoveLeve:Activate", 0 )
					Call ( "ActivateNode","dalkaclevy",0)
					Call ( "ActivateNode","dalkacpravy",0)
					Call ( "ActivateNode","reflektor_rozsviceny",0) 
					Call ( "PozickaHorniBi:Activate", 0 )
					Call ( "PozickaLevaBi:Activate", 0 )
					Call ( "PozickaLevaCr:Activate", 1 )
					Call ( "PozickaPravaBi:Activate", 0 )
					Call ( "PozickaPravaCr:Activate", 1 )
					Call ( "ActivateNode", "pozickalevaBi", 0 ) 
					Call ( "ActivateNode", "pozickalevaCr", 1 ) 
					Call ( "ActivateNode", "pozickapravaBi", 0 ) 
					Call ( "ActivateNode", "pozickapravaCr", 1 ) 
				elseif SmerAI == 1 then
					if SysCall("ScenarioManager:GetSeason") ~= 3 then
						if dennicas < 063000 or dennicas > 220000 then
							if reflektorAI then
								Call ( "DalkovePrave:Activate", 1 )
								Call ( "DalkoveLeve:Activate", 1 )
								Call ( "ActivateNode","dalkaclevy",1)
								Call ( "ActivateNode","dalkacpravy",1)
							else
								Call ( "DalkovePrave:Activate", 0 )
								Call ( "DalkoveLeve:Activate", 0 )
								Call ( "ActivateNode","dalkaclevy",0)
								Call ( "ActivateNode","dalkacpravy",0)
							end
							Call ( "ActivateNode","reflektor_rozsviceny",1) 
							Call ( "PozickaHorniBi:Activate", 1 )
							Call ( "PozickaLevaBi:Activate", 1 )
							Call ( "PozickaLevaCr:Activate", 0 )
							Call ( "PozickaPravaBi:Activate", 1 )
							Call ( "PozickaPravaCr:Activate", 0 )
							Call ( "ActivateNode", "pozickalevaBi", 1 ) 
							Call ( "ActivateNode", "pozickalevaCr", 0 ) 
							Call ( "ActivateNode", "pozickapravaBi", 1 ) 
							Call ( "ActivateNode", "pozickapravaCr", 0 ) 
						elseif dennicas > 063000 and dennicas < 220000 then
							Call ( "DalkovePrave:Activate", 0 )
							Call ( "DalkoveLeve:Activate", 0 )
							Call ( "ActivateNode","dalkaclevy",0)
							Call ( "ActivateNode","dalkacpravy",0)
							Call ( "ActivateNode","reflektor_rozsviceny",0) 
							Call ( "PozickaHorniBi:Activate", 1 )
							Call ( "PozickaLevaBi:Activate", 1 )
							Call ( "PozickaLevaCr:Activate", 0 )
							Call ( "PozickaPravaBi:Activate", 1 )
							Call ( "PozickaPravaCr:Activate", 0 )
							Call ( "ActivateNode", "pozickalevaBi", 1 ) 
							Call ( "ActivateNode", "pozickalevaCr", 0 ) 
							Call ( "ActivateNode", "pozickapravaBi", 1 ) 
							Call ( "ActivateNode", "pozickapravaCr", 0 ) 
						end
					else
						if dennicas < 080000 or dennicas > 163000 then
							if reflektorAI then
								Call ( "DalkovePrave:Activate", 1 )
								Call ( "DalkoveLeve:Activate", 1 )
								Call ( "ActivateNode","dalkaclevy",1)
								Call ( "ActivateNode","dalkacpravy",1)
							else
								Call ( "DalkovePrave:Activate", 0 )
								Call ( "DalkoveLeve:Activate", 0 )
								Call ( "ActivateNode","dalkaclevy",0)
								Call ( "ActivateNode","dalkacpravy",0)
							end
							Call ( "ActivateNode","reflektor_rozsviceny",1) 
							Call ( "PozickaHorniBi:Activate", 1 )
							Call ( "PozickaLevaBi:Activate", 1 )
							Call ( "PozickaLevaCr:Activate", 0 )
							Call ( "PozickaPravaBi:Activate", 1 )
							Call ( "PozickaPravaCr:Activate", 0 )
							Call ( "ActivateNode", "pozickalevaBi", 1 ) 
							Call ( "ActivateNode", "pozickalevaCr", 0 ) 
							Call ( "ActivateNode", "pozickapravaBi", 1 ) 
							Call ( "ActivateNode", "pozickapravaCr", 0 ) 
						elseif dennicas > 080000 and dennicas < 163000 then
							Call ( "DalkovePrave:Activate", 0 )
							Call ( "DalkoveLeve:Activate", 0 )
							Call ( "ActivateNode","dalkaclevy",0)
							Call ( "ActivateNode","dalkacpravy",0)
							Call ( "ActivateNode","reflektor_rozsviceny",0) 
							Call ( "PozickaHorniBi:Activate", 1 )
							Call ( "PozickaLevaBi:Activate", 1 )
							Call ( "PozickaLevaCr:Activate", 0 )
							Call ( "PozickaPravaBi:Activate", 1 )
							Call ( "PozickaPravaCr:Activate", 0 )
							Call ( "ActivateNode", "pozickalevaBi", 1 ) 
							Call ( "ActivateNode", "pozickalevaCr", 0 ) 
							Call ( "ActivateNode", "pozickapravaBi", 1 ) 
							Call ( "ActivateNode", "pozickapravaCr", 0 ) 
						end
					end
				else
					Call ( "DalkovePrave:Activate", 0 )
					Call ( "DalkoveLeve:Activate", 0 )
					Call ( "ActivateNode","dalkaclevy",0)
					Call ( "ActivateNode","dalkacpravy",0)
					Call ( "ActivateNode","reflektor_rozsviceny",0) 
					Call ( "PozickaHorniBi:Activate", 0 )
					Call ( "PozickaLevaBi:Activate", 0 )
					Call ( "PozickaLevaCr:Activate", 0 )
					Call ( "PozickaPravaCr:Activate", 0 )
					Call ( "ActivateNode", "pozickalevaBi", 0 ) 
					Call ( "ActivateNode", "pozickalevaCr", 0 ) 
					Call ( "ActivateNode", "pozickapravaCr", 0 )
					if predMasinou == 0 then
						Call ( "PozickaPravaBi:Activate", 1 )
						Call ( "ActivateNode", "pozickapravaBi", 1 ) 
					end
				end
			else
				Call ( "DalkovePrave:Activate", 0 )
				Call ( "DalkoveLeve:Activate", 0 )
				Call ( "ActivateNode","dalkaclevy",0)
				Call ( "ActivateNode","dalkacpravy",0)
				Call ( "ActivateNode","reflektor_rozsviceny",0) 
				Call ( "PozickaHorniBi:Activate", 0 )
				Call ( "PozickaLevaBi:Activate", 0 )
				Call ( "PozickaLevaCr:Activate", 0 )
				Call ( "PozickaPravaBi:Activate", 0 )
				Call ( "PozickaPravaCr:Activate", 0 )
				Call ( "ActivateNode", "pozickalevaBi", 0 ) 
				Call ( "ActivateNode", "pozickalevaCr", 0 ) 
				Call ( "ActivateNode", "pozickapravaBi", 0 ) 
				Call ( "ActivateNode", "pozickapravaCr", 0 )
			end
			Call("SetControlValue","JeNouzovyRadic",0,0)
			Call("SetControlValue","Picka",0,0)
			Call("SetControlValue","EngineBrakeControl",0,0)
			Call("SetControlValue","HandBrake",0,0)
			Call ( "Zarovka1:Activate", 0 )
			Call ( "Zarovka2:Activate", 0 )
			Call ( "Zarivka1:Activate", 0 )
			Call ( "Zarivka2:Activate", 0 )
			Call ( "Zarivka3:Activate", 0 )
			Call ( "CabLight1:Activate", 0 )
			Call ( "SvetloRychlomer:Activate", 0 )
			Call ( "SvetloBudik1:Activate", 0 )
			Call ( "SvetloBudik2:Activate", 0 )
			Call ( "SvetloBudik3:Activate", 0 )
			Call ( "SvetloBudik4:Activate", 0 )

			if Call("GetControlValue","DoorsOpenCloseLeft") then
				Call("SetControlValue","DvereLP",0,1)
				Call("SetControlValue","DvereLZ",0,1)
			else
				Call("SetControlValue","DvereLP",0,0)
				Call("SetControlValue","DvereLZ",0,0)
			end
			if Call("GetControlValue","DoorsOpenCloseRight") then
				Call("SetControlValue","DverePP",0,1)
				Call("SetControlValue","DverePZ",0,1)
			else
				Call("SetControlValue","DverePP",0,0)
				Call("SetControlValue","DverePZ",0,0)
			end

			--kridla dveri
				local LP = Call("GetControlValue","DvereLP",0)
				local LZ = Call("GetControlValue","DvereLZ",0)
				local PP = Call("GetControlValue","DverePP",0)
				local PZ = Call("GetControlValue","DverePZ",0)

				if LP ~= dvereLPskutecne then
					if LP > dvereLPskutecne then
						dvereLPskutecne = dvereLPskutecne + (cas * rychlostOteviraniDveriLP)
					elseif LP < dvereLPskutecne then
						dvereLPskutecne = dvereLPskutecne - (cas * rychlostZaviraniDveriLP)
					end
					if dvereLPskutecne < 0 then
						dvereLPskutecne = 0
					end
				end
				Call("SetTime", "Dvere1L", dvereLPskutecne * 2.125)

				if LZ ~= dvereLZskutecne then
					if LZ > dvereLZskutecne then
						dvereLZskutecne = dvereLZskutecne + (cas * rychlostOteviraniDveriLZ)
					elseif LZ < dvereLZskutecne then
						dvereLZskutecne = dvereLZskutecne - (cas * rychlostZaviraniDveriLZ)
					end
					if dvereLZskutecne < 0 then
						dvereLZskutecne = 0
					end
				end
				Call("SetTime", "Dvere2L", dvereLZskutecne * 2.125)

				if PP ~= dverePPskutecne then
					if PP > dverePPskutecne then
						dverePPskutecne = dverePPskutecne + (cas * rychlostOteviraniDveriPP)
					elseif PP < dverePPskutecne then
						dverePPskutecne = dverePPskutecne - (cas * rychlostZaviraniDveriPP)
					end
					if dverePPskutecne < 0 then
						dverePPskutecne = 0
					end
				end
				Call("SetTime", "Dvere1P", dverePPskutecne * 2.125)

				if PZ ~= dverePZskutecne then
					if PZ > dverePZskutecne then
						dverePZskutecne = dverePZskutecne + (cas * rychlostOteviraniDveriPZ)
					elseif PZ < dverePZskutecne then
						dverePZskutecne = dverePZskutecne - (cas * rychlostZaviraniDveriPZ)
					end
					if dverePZskutecne < 0 then
						dverePZskutecne = 0
					end
				end
				Call("SetTime", "Dvere2P", dverePZskutecne * 2.125)
		end
	end
end

function OnControlValueChange ( name, index, value )
	if Call( "*:ControlExists", name, index ) then
		if name == "VirtualStartup" then
			if value <= 0.5 and value > 0.1 then
				pozadavekNaZapisKlice = true
				PolohaKlice = 0.25
			elseif value > 0.5 and value < 0.9 then
				pozadavekNaZapisKlice = true
				PolohaKlice = 0.75
			end
		end
		if name == "vytahniklic" then
			if math.abs(PolohaKlice - 0.25) < 0.1 then
				pozadavekNaZapisKlice = true
				PolohaKlice = 0
				Call("SetControlValue", "VirtualStartup", 0,0)
				klic = 0
				Call("SendConsistMessage",460101,"0",1)
			end
		end
		if name == "vlozklic" then
			if PolohaKlice < 0.25 and KlicNaDruheKabine == 0 then
				pozadavekNaZapisKlice = true
				PolohaKlice = 0.25
				Call("SetControlValue", "VirtualStartup", 0,0.25)
				klic = 1
				Call("SendConsistMessage",460101,"1",1)
			end
		end
		if name == "OsvetleniVozu" then
			if value == 0 then
				OsvetleniVozu = 0
				Call ("SendConsistMessage",460106,"0",1)
			end
			if value == 1 then
				OsvetleniVozu = 1
				Call ("SendConsistMessage",460106,"1",1)
			end
			if value == 2 then
				OsvetleniVozu = 2
				Call ("SendConsistMessage",460106,"2",1)
			end
		end
		if name == "JeNouzovyRadic" then
			if value == 0 then
				Call("SetControlValue","VirtualThrottleAndBrake",0,0)
				Call("SetControlValue","RadicNouzovy",0,2)
			else
				Call("SetControlValue","VirtualThrottleAndBrake",0,2)
				Call("SetControlValue","RadicNouzovy",0,0)
			end
		end
		if name == "FastStart" and value == 1 then
			pozadavekNaFastStart = 1
		end
		if name == "vysilackaStart" and vysilackaObrazovka == 0 then
			if value == 1 then 
				vysilackaObrazovka = 1
				Call("SetControlValue","VysilackaStartSound",0,1)
			end
		end
		if name == "vysilacka8" then
			tlacitko8 = value
		end
		if name == "vysilacka1" then
			tlacitko1 = value
		end
		if name == "vysilackaEnter" then
			tlacitkoEnter = value
		end
		if name == "vysilackaDelete" then
			tlacitkoDelete = value
		end
		if name == "vysilacka0" then
			tlacitko0 = value
		end
		if name == "vysilacka2" then
			tlacitko2 = value
		end
		if name == "vysilacka3" then
			tlacitko3 = value
		end
		if name == "vysilacka4" then
			tlacitko4 = value
		end
		if name == "vysilacka5" then
			tlacitko5 = value
		end
		if name == "vysilacka6" then
			tlacitko6 = value
		end
		if name == "vysilacka7" then
			tlacitko7 = value
		end
		if name == "vysilacka9" then
			tlacitko9 = value
		end
		if name == "RidiciKontrolerOkno" then
			ridiciKontrolerOknoOCVC = value
		end
		if name == "VirtualHeadlights" then
			if value <= 0.5 then
				DalkovaSv = 0
			else
				DalkovaSv = 1
			end
		end
		if name == "OsvetleniKabiny" then
			if value <= 0.25 then
				KabinaPrist = 1
			end
			if value >= 1.75 then
				KabinaPrist = 2
			end
			if value >= 0.75 and value <= 1.25 then
				KabinaPrist = 0
			end
		end
		if name == "Picka" then
			if value < 0.5 then
				Picka = 0
			end
			if value > 0.5 then
				Picka = 1
			end
		end
		if name == "VolbaPozicKonecCelo" then
			if value > 0.5 and value < 1.5 then
				levaPozBilVPKC = false
				levaPozCerVPKC = false
				pravaPozBilVPKC = false
				pravaPozCerVPKC = false
				horniPozBilVKPC = false
			end
			if value > 1.75 then
				levaPozBilVPKC = false
				levaPozCerVPKC = true
				pravaPozBilVPKC = false
				pravaPozCerVPKC = true
				horniPozBilVKPC = false
			end
			if value < 0.25 then
				levaPozBilVPKC = true
				levaPozCerVPKC = false
				pravaPozBilVPKC = true
				pravaPozCerVPKC = false
				horniPozBilVKPC = true
			end
		end
		if name == "LevaPoz" then
			if value > 0.5 and value < 1.5 then
				levaPozCer = false
				levaPozBil = false
			end
			if value > 1.75 then
				levaPozCer = true
				levaPozBil = false
			end
			if value < 0.25 then
				levaPozCer = false
				levaPozBil = true				
			end
		end
		if name == "PravaPoz" then
			if value > 0.5 and value < 1.5 then
				pravaPozCer = false
				pravaPozBil = false
			end
			if value > 1.75 then
				pravaPozCer = true
				pravaPozBil = false
			end
			if value < 0.25 then
				pravaPozCer = false
				pravaPozBil = true
			end
		end
		if name == "Napoveda" then
			levelNapovedy = levelNapovedy + 1
			if levelNapovedy == 4 then
				levelNapovedy = 0
			end
			SysCall("ScenarioManager:ShowMessage", ZPRAVA_HLAVICKA, SysCall("ScenarioManager:FormatString",ZPRAVA_UROVEN_HELP,levelNapovedy),ALERT)
		end
		Call( "*:SetControlValue", name, index, value )
	end
end