local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_NONE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)

local area = createCombatArea(AREA_SQUARE1X1)
combat:setArea(area)

local maxsummons = 4

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local summoncount = creature:getSummons()
	if #summoncount < 4 then
		for i = 1, maxsummons - #summoncount do
			local mid = Game.createMonster("Vampire", creature:getPosition())
    			if not mid then
					return
				end
			mid:setMaster(creature)
		end
	end
	return combat:execute(creature, var)
end


spell:name("arthei summon")
spell:words("###130")
spell:needTarget(false)
spell:needLearn(true)
spell:isAggressive(false)
spell:blockWalls(true)
spell:register()