require("main.constants")

INITIAL_STATE = {
	projection = vmath.matrix4(),
	view = vmath.matrix4(),

	gold = 100,
	health = 10,
	shield = 10,
	lazer_stability = 100,

	cooldown_upgrade = COOLDOWN_UPGRADE,
	cooldown_shield_regen = 0,
	cooldown_lazer = 0,
	cooldown_lazer_stabilize = 0,	
	cooldown_missile = 0,
	cooldown_roll = 0,

	upgrade_forcefield = 0,
	upgrade_roll = 0,
	upgrade_gyrator = 0,
	upgrade_stabilizer = 0,
	upgrade_beam_splitter = 0,
	upgrade_missile = 0,
	upgrade_condensor = 0,

	selected_upgrade = nil
}

local M = {
	time = 0
}

function M.reset()
	local s = {}
	for k, v in pairs(INITIAL_STATE) do
		M[k] = v
	end
end

M.reset()

function M.update(dt)
	M.time = M.time + dt
	M.cooldown_upgrade = math.max(0, M.cooldown_upgrade - dt)

	if not M.is_upgrading() then
		M.cooldown_shield_regen = math.max(0, M.cooldown_shield_regen - dt)
		M.cooldown_lazer = math.max(0, M.cooldown_lazer - dt)
		M.cooldown_lazer_stabilize = math.max(0, M.cooldown_lazer_stabilize - dt)
		M.cooldown_missile = math.max(0, M.cooldown_missile - dt)
		M.cooldown_roll = math.max(0, M.cooldown_roll - dt)
	end

	if M.can_regen_shields() then
		M.shield = math.min(SHIELD_MAX, M.shield + SHIELD_REGEN_RATE)
	end

	if M.can_stabilize_lazer() then
		M.lazer_stability = math.min(LAZER_STABILITY_MAX, M.lazer_stability + LAZER_STABILITY_REGEN_RATE)
	end
end

function M.is_dead()
	return M.health <= 0
end

function M.is_upgrading()
	return M.cooldown_upgrade == 0
end

function M.is_locked()
	return M.is_dead() or M.is_upgrading()
end

function M.continue()
	M.cooldown_upgrade = COOLDOWN_UPGRADE
end

function M.add_gold(n)
	M.gold = M.gold + n
end

function M.can_purchase_selected_upgrade()
	return M.gold >= M.selected_upgrade.cost
end

function M.purchase_selected_upgrade()
	local u = M.selected_upgrade
	if u ~= nil and u.cost <= M.gold then
		M.gold = M.gold - u.cost
		M[u.key] = (M[u.key] or 0) + 1
		sound.play("audio#purchase")
		
		return true
	end
end

function M.get_shield_cooldown()
	if M.upgrade_forcefield == 5 then
		return 2
	elseif M.upgrade_forcefield == 4 then
		return 4
	elseif M.upgrade_forcefield == 3 then
		return 6
	elseif M.upgrade_forcefield == 2 then
		return 8
	elseif M.upgrade_forcefield == 1 then
		return 9
	else
		return COOLDOWN_SHIELD_REGEN
	end
end

function M.use_shield()
	M.cooldown_shield_regen = M.get_shield_cooldown()
end

function M.can_regen_shields()
	return M.cooldown_shield_regen == 0 and M.shield < SHIELD_MAX and not M.is_locked()
end

function M.lazer_stability_degen_rate()
	if M.upgrade_stabilizer == 4 then
		return 0.00
	elseif M.upgrade_stabilizer == 3 then
		return 0.25
	elseif M.upgrade_stabilizer == 2 then
		return 0.50
	elseif M.upgrade_stabilizer == 1 then
		return 0.75
	else
		return 1
	end
end

function M.use_lazer()
	M.cooldown_lazer = COOLDOWN_LAZER
	M.cooldown_lazer_stabilize = COOLDOWN_LAZER_STABILIZE
	M.lazer_stability = M.lazer_stability - M.lazer_stability_degen_rate()
end

function M.can_use_lazer()
	return M.lazer_stability > 5 and M.cooldown_lazer == 0 and not M.is_locked()
end

function M.can_stabilize_lazer()
	return M.cooldown_lazer_stabilize == 0 and M.lazer_stability < LAZER_STABILITY_MAX
end

function M.get_missile_cooldown()
	if M.upgrade_condensor == 3 then
		return 4
	elseif M.upgrade_condensor == 2 then
		return 6
	elseif M.upgrade_condensor == 1 then
		return 8
	else
		return COOLDOWN_MISSILE
	end
end

function M.get_missile_cooldown_pct()
	local cd = M.get_missile_cooldown()
	
	return (cd - M.cooldown_missile) / cd
end

function M.can_use_missile()
	return M.upgrade_missile > 0 and M.cooldown_missile == 0 and not M.is_locked()
end

function M.use_missile()
	M.cooldown_missile = M.get_missile_cooldown()
end

function M.get_roll_cooldown()
	if M.upgrade_gyrator == 3 then
		return 2
	elseif M.upgrade_gyrator == 2 then
		return 3
	elseif M.upgrade_gyrator == 1 then
		return 4
	else
		return COOLDOWN_ROLL
	end
end

function M.get_roll_cooldown_pct()
	local cd = M.get_roll_cooldown()

	return (cd - M.cooldown_roll) / cd
end

function M.can_use_roll()
	return M.upgrade_roll > 0 and M.cooldown_roll == 0 and not M.is_locked()
end

function M.use_roll()
	M.cooldown_roll = M.get_roll_cooldown()
end

return M