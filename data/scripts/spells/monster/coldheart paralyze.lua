local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 20000)
condition:setFormula(-0.5, 0, -0.75, 0)
combat:addCondition(condition)

local area = createCombatArea(AREA_SQUARE1X1)
combat:setArea(area)
combat:addCondition(condition)


local spell = Spell("instant")

function spell.onCastSpell(creature, var)
    return combat:execute(creature, var)
end

spell:name("coldheart paralyze")
spell:words("###314")
spell:needTarget(false)
spell:needLearn(true)
spell:isAggressive(true)
spell:blockWalls(true)
spell:register()