
	local combat = Combat()
	combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
	combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)

	arr = {
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0}
	}

	local area = createCombatArea(arr)
	combat:setArea(area)


local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:name("lisa wave")
spell:words("###63")
spell:needTarget(false)
spell:needLearn(true)
spell:isAggressive(false)
spell:blockWalls(true)
spell:needDirection(true)
spell:register()
	local combat = Combat()
	combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
	combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_GREEN_RINGS)

	arr = {
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0}
	}

	local area = createCombatArea(arr)
	combat:setArea(area)


local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:name("lisa wave")
spell:words("###63")
spell:needTarget(false)
spell:needLearn(true)
spell:isAggressive(false)
spell:blockWalls(true)
spell:needDirection(true)
spell:register()
