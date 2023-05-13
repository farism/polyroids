local UPGRADE_TIME = 3

local COOLDOWN_SHIELD_REGEN = 5
local COOLDOWN_LAZER = 0.1;
local COOLDOWN_LAZER_STABILIZE = 2
local COOLDOWN_MISSILE = 5;
local COOLDOWN_ROLL = 3;

local LAZER_STABILITY_RATE = 1
local LAZER_STABILITY_REGEN_RATE = 2
local LAZER_STABILITY_MAX = 100

local HEALTH_MAX = 10
local SHIELD_MAX = 10

local M = {
	time = 0,
	
	projection = vmath.matrix4(),
	view = vmath.matrix4(),

	gold = 100,
	health = 10,
	shield = 10,
	lazer_stability = 100,
	
	cooldown_upgrade = 30,
	cooldown_shield_regen = 0,
	cooldown_lazer = 0,
	cooldown_lazer_stabilize = 0,	
	cooldown_missile = 0,
	cooldown_roll = 0,
	
	upgrade_shield = 0, -- improved shield
	upgrade_roll = false, -- 360 degree roll
	upgrade_double_roll = false, -- 720 degree roll
	upgrade_roll_cooldown = 0, -- roll reduce cooldown
	upgrade_stabilizer = 0, -- lazer 
	upgrade_beam_splitter = 3, -- lazer extra projectiles
	upgrade_guidance_system = false, -- missile homing
	upgrade_condensor = 0 -- missle reduce cooldown
}

function M.update(dt)
	M.time = M.time + dt
	M.cooldown_upgrade = math.max(0, M.cooldown_upgrade - dt)
	M.cooldown_shield_regen = math.max(0, M.cooldown_shield_regen - dt)
	M.cooldown_lazer = math.max(0, M.cooldown_lazer - dt)
	M.cooldown_lazer_stabilize = math.max(0, M.cooldown_lazer_stabilize - dt)
	M.cooldown_missile = math.max(0, M.cooldown_missile - dt)
	M.cooldown_roll = math.max(0, M.cooldown_roll - dt)

	if M.can_regen_shields() then
		M.shield = math.min(SHIELD_MAX, M.shield + SHIELD_REGEN_RATE)
	end

	if M.can_stabilize_lazer() then
		M.lazer_stability = math.min(LAZER_STABILITY_MAX, M.lazer_stability + LAZER_STABILITY_REGEN_RATE)
	end
end

function M.continue()
	M.cooldown_upgrade = UPGRADE_TIME
end

function M.add_gold(n)
	M.gold = M.gold + n
end

function M.is_upgrading()
	return M.cooldown_upgrade == 0
end

function M.use_shield()
	M.cooldown_shield_regen = COOLDOWN_SHIELD_REGEN
end

function M.can_regen_shields()
	return M.shield_regen_cooldown == 0 and M.shield < SHIELD_MAX
end

function M.use_lazer()
	M.cooldown_lazer = COOLDOWN_LAZER
end

function M.can_use_lazer()
	return M.cooldown_lazer == 0
end

function M.can_stabilize_lazer()
	return M.cooldown_lazer_stabilize == 0 and M.lazer_stability < LAZER_STABILITY_MAX
end

function M.use_lazer_stabilize()
	M.cooldown_lazer_stabilize = COOLDOWN_LAZER_STABILIZE
end

function M.can_use_missile()
	return M.cooldown_missile == 0
end

function M.use_missile()
	M.cooldown_missile = COOLDOWN_MISSILE
end

function M.get_cooldown_missile_pct()
	return (COOLDOWN_MISSILE - M.cooldown_missile) / COOLDOWN_MISSILE
end

function M.can_use_roll()
	return M.cooldown_roll == 0
end

function M.use_roll()
	M.cooldown_roll = COOLDOWN_ROLL
end

return M