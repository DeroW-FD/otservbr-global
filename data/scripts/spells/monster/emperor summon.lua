local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_NONE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SOUND_PURPLE)

local area = createCombatArea(AREA_CIRCLE2X2)
combat:setArea(area)

local maxsummons = 2

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local summoncount = creature:getSummons()
	if #summoncount < 2 then
		for i = 1, maxsummons - #summoncount do
			local mid = Game.createMonster("Draken Warmaster", creature:getPosition())
    			if not mid then
					return
				end
			mid:setMaster(creature)
		end
	end
	return combat:execute(creature, var)
end


spell:name("emperor summon")
spell:words("###140")
spell:needTarget(false)
spell:needLearn(true)
spell:isAggressive(false)
spell:blockWalls(true)
spell:register()