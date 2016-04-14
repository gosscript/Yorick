if GetObjectName(GetMyHero()) ~= "Warwick" then return end

require('Inspired')

local WWMenu = MenuConfig("Warwick","Warwick")

WWMenu:Menu("Combo")

WWMenu.Combo:Menu("QSettings", "Q - Settings")
WWMenu.Combo.QSettings:Boolean("Q", "Use Q", true)
WWMenu.Combo.QSettings:Slider("QMana", "Use Q if %mana >",70, 1, 100, 1) 


WWMenu.Combo:Menu("WSettings", "W - Settings")
WWMenu.Combo.WSettings:Boolean("W", "Use W", true)
WWMenu.Combo.QSettings:Slider("QMana", "Use Q if %mana >",35, 1, 100, 1)


WWMenu.Combo:Menu("RSettings", "R - Settings")
WWMenu.Combo.RSettings:Boolean("R", "Use R", false)

WWMenu:Menu("Killsteal", "Killsteal")
WWMenu.Killsteal:Boolean("KillQ", "Use Q", true)
WWMenu.Killsteal:Boolean("KillIgnite", "Use Ignite", false)

WWMenu:Menu("Drawings", "Drawings")
WWMenu.Drawings:Boolean("DrawQ", "Draw Q Range", true)
WWMenu.Drawings:Boolean("DrawW", "Draw W&R Range", true)
WWMenu.Drawings:Slider("Quality", "Quality", 125, 1, 255)

local Ignite = (GetCastName(GetMyHero(),SUMMONER_1):lower():find("summonerdot") and SUMMONER_1 or (GetCastName(GetMyHero(),SUMMONER_2):lower():find("summonerdot") and SUMMONER_2 or nil))

OnDraw(function(myHero)

	if WWMenu.Drawings.DrawQ:Value() and IsReady(_Q) then
		DrawCircle(GetOrigin(myHero), 400, 1, WWMenu.Drawings.Quality:Value(), GoS.Green)
		--DrawCircle(Vector3D, radius, width, quality, color)
	end
	if WWMenu.Drawings.DrawW:Value() and (IsReady(_W) or IsReady(_R)) then
		DrawCircle(GetOrigin(myHero), 900, 1, WWMenu.Drawings.Quality:Value(), GoS.Yellow)
	end
end)

OnTick(function(myHero)

		local target = GetCurrentTarget()
		
		if IOW:Mode() == "Combo" then
			
			if IsReady(_Q) and (GetDistance(target) <= 400 )then
				CastSpell(_Q)
				
			end
		end
	end
end
