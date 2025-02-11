local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ICE)

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 20000)
condition:setFormula(-0.35, 0, -0.5, 0)
combat:addCondition(condition)

local area = createCombatArea(AREA_CIRCLE2X2)
combat:setArea(area)
combat:addCondition(condition)


local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end


spell:name("frost dragon paralyze 2")
spell:words("###249")
spell:needTarget(true)
spell:needLearn(true)
spell:isAggressive(true)
spell:blockWalls(true)
spell:register()