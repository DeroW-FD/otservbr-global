local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	local targetPlayer = Player(variant:getString()) or player
	local guest = targetPlayer:getTile():getHouse()
	local owner =  player:getTile():getHouse()
	if not owner or not guest or not guest:kickPlayer(player, targetPlayer) then
		player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end
	return true
end

spell:name("House Kick")
spell:words("alana sio")
spell:hasParams(true)
spell:hasPlayerNameParam(true)
spell:isAggressive(false)
spell:register()
