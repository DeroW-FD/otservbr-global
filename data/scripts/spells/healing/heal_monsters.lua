function onTargetCreature(creature, target)
	local player = creature:getPlayer()
	local min = 100
	local max = 300
	local master = target:getMaster()

	if target:isPlayer() then
		return true
	end
	if master then
		return true
	end

	doTargetCombatHealth(0, target, COMBAT_HEALING, min, max, CONST_ME_NONE)
	return true
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))
combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:name("Heal Monster")
spell:words("#####458")
spell:group("healing")
spell:needDirection(true)
spell:isAggressive(false)
spell:isBlockingWalls(true)
spell:needTarget(false)
spell:needLearn(true)
spell:register()