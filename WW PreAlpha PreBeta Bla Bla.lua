if GetObjectName(GetMyHero()) ~= "Warwick" then return end

require('Inspired')

local manaQ = GetCastMana(myHero, _Q, GetCastLevel(myHero,_Q))
local manaW = GetCastMana(myHero, _W, GetCastLevel(myHero,_W))
local manaE = GetCastMana(myHero, _R, GetCastLevel(myHero,_R))

local WWMenu = MenuConfig("Warwick","Warwick")

WWMenu:Menu("Drawings", "Drawings")
WWMenu:SubMenu("Combo", "Combo")
WWMenu.Combo:Boolean("Q", "Use Q", true)
WWMenu.Combo:Boolean("W", "Use W", true)
WWMenu.Combo:Boolean("R", "Use R", true)
WWkMenu.Drawings:Boolean("Q", "Draw Q Range", true)
WWMenu.Drawings:Boolean("W", "Draw W Range", true)
WWMenu.Drawings:Boolean("E", "Draw E Range", true)

OnDraw(function(myHero)
local pos = GetOrigin(myHero)
if WWMenu.Drawings.Q:Value() then DrawCircle(pos,400,1,10,GoS.Red) end
if WWMenu.Drawings.W:Value() then DrawCircle(pos,1250,1,10,GoS.Yellow) end
if WWMenu.Drawings.W:Value() then DrawCircle(pos,600,1,10,GoS.Yellow) end
if WWMenu.Drawings.R:Value() then DrawCircle(pos,700,1,10,GoS.Pink) end
end)

OnTick(function(myHero)

	local target = GetCurrentTarget()
	
	if target ~= nil then
	
	if GetCurrentMana(myHero) > manaQ + manaW + manaE and IOW:Mode() == "Combo" then
	
	 if WWMenu.Combo.Q:Value() and Ready(_Q) and ValidTarget(target, 400) then
	 
			CastSpell(target, _Q)
		end
	
	if WWMenu.Combo.W:Value() and Ready(_W) and ValidTarget(target, 600) and Ready(_Q) then
	
			CastSpell(_W)
		end
	end
end
end

	

	
	
	
