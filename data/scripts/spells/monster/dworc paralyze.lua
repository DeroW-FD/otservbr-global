local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 20000)
condition:setFormula(-0.5, 0, -0.75, 0)
combat:addCondition(condition)

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
    return combat:execute(creature, var)
end


spell:name("dworc paralyze")
spell:words("###257")
spell:needTarget(true)
spell:needLearn(true)
spell:isAggressive(true)
spell:blockWalls(true)
spell:register()