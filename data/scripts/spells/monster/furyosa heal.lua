local condition = Condition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
condition:setParameter(CONDITION_PARAM_SUBID, 88888)
condition:setParameter(CONDITION_PARAM_TICKS, 15 * 60 * 1000)
condition:setParameter(CONDITION_PARAM_HEALTHGAIN, 0.01)
condition:setParameter(CONDITION_PARAM_HEALTHTICKS, 15 * 60 * 1000)

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	if creature:getHealth() < creature:getMaxHealth() * 0.2 and not creature:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT, 88888) then
		creature:addCondition(condition)
		creature:addHealth(10000)
        else
		return
	end
    return true
end


spell:name("furyosa heal")
spell:words("###340")
spell:needTarget(true)
spell:needLearn(true)
spell:isAggressive(false)
spell:blockWalls(true)
spell:register()