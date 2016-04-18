if GetObjectName(GetMyHero()) ~= "Warwick" then return end

require('Inspired')

local WWMenu = MenuConfig("Warwick","Warwick")

WWMenu:SubMenu("Combo", "Combo")

WWMenu.Combo:Boolean("Q", "Use Q in combo", true)
WWMenu.Combo:Boolean("W", "Use W in combo", true)
WWMenu.Combo:Boolean("E", "Use E in combo", true)

WWMenu:SubMenu("Misc", "Misc")
WWMenu.Misc:Boolean("Level", "Auto level spells", true)
WWMenu.Misc:Boolean("Ignite", "Auto Ignite if killable", true)

WWMenu:Menu("Drawings", "Drawings")
WWMenu.Drawings:Boolean("DrawQ", "Draw Q Range", true)
WWMenu.Drawings:Boolean("DrawW", "Draw W&R Range", true)
WWMenu.Drawings:Slider("Quality", "Quality", 125, 1, 255)

local Ignite = (GetCastName(GetMyHero(),SUMMONER_1):lower():find("summonerdot") and SUMMONER_1 or (GetCastName(GetMyHero(),SUMMONER_2):lower():find("summonerdot") and SUMMONER_2 or nil))

OnDraw(function(myHero) "" soon TM ""

OnTick(function (myHero)

	local target = GetCurrentTarget()
	local BaseHPHero = GetMaxHP(myHero)
	local CurrentHPHero = GetCurrentHP(myHero)
	local BaseHPTarget = GetMaxHP(target)
	local CurrentHPTarget = GetCurrentHP(target)
	local MeleeRange = 125 GetLevel(myHero)
	local BaseAD = GetBaseDamage(myHero)
	local BonusAD = GetBonusDmg(myHero)
	local BonusAP = GetBonusAP(myHero)
	local QRange = 400
	local WRange = 1250
	local ERange = 1500 + 800 * GetLevel(myHero)
	local RRange = 700
	
	if WW.Misc.Level:Value() then

			spellorder = {_W, _Q, _W, _E, _W, _R, _W, _Q, _W, _Q, _R, _Q, _Q, _E, _E, _R, _E, _E}
			if GetLevelPoints(myHero) > 0 then
				LevelSpell(spellorder[GetLevel(myHero) + 1 - GetLevelPoints(myHero)])
			end

	end
	
if IOW:Mode() == "Combo" then

		if WWMenu.Combo.W:Value() and Ready(_W) and Ready(_Q) and ValidTarget(target, 700) then
			CastTargetSpell(_W)
		end

		if WWMenu.Combo.Q:Value() and Ready(_Q) and ValidTarget(target, QRange) then
			CastSpell(target _Q)
		end

		if WWMenu.Combo.R:Value() and Ready(_R) and GetDistance(myHero, target) < RRange and GetDistance(myHero, target) > RRange and EnemiesAround(target, 700) < 2 and  then
		
				CastSpell(target _R)
			end
		end

for _, enemy in pairs(GetEnemyHeroes()) do
	
	if WMenu.Killsteal.R:Value() and Ready(_R) and GetCurrentHP(enemy) < CalcDamage(myHero, enemy, 0, RDmg) and ValidTarget(enemy, RRange) then
			CastTargetSpell(enemy, _R)
		end
	end
end

if WWMenu.Misc.Ignite:Value() then

		for _, enemy in pairs(GetEnemyHeroes()) do
		
			if GetCastName(myHero, SUMMONER_1) == "SummonerDot" then
				local Ignite = SUMMONER_1
				if ValidTarget(enemy, 600) then
					if 20 * GetLevel(myHero) + 50 > GetCurrentHP(enemy) + GetHPRegen(enemy) * 3 then
						CastTargetSpell(enemy, Ignite)
					end
				end

			elseif GetCastName(myHero, SUMMONER_2) == "SummonerDot" then
				local Ignite = SUMMONER_2
				if ValidTarget(enemy, 600) then
					if 20 * GetLevel(myHero) + 50 > GetCurrentHP(enemy) + GetHPRegen(enemy) * 3 then
						CastTargetSpell(enemy, Ignite)
					
												end
										end
								end

						end

				end
		end
end
end)
