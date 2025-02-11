local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_NONE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITBYPOISON)

local area = createCombatArea(AREA_SQUARE1X1)
combat:setArea(area)

local maxsummons = 2

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local summoncount = creature:getSummons()
	if #summoncount < 2 then
		for i = 1, maxsummons - #summoncount do
			local mid = Game.createMonster("Death Blob", creature:getPosition())
    			if not mid then
					return
				end
			mid:setMaster(creature)
		end
	end
	return combat:execute(creature, var)
end


spell:name("draken abomination summon")
spell:words("###278")
spell:needTarget(false)
spell:needLearn(true)
spell:isAggressive(false)
spell:blockWalls(true)
spell:register()