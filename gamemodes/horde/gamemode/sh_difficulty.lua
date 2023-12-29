-- Useage example:
-- To get the damageMultiplier of the current difficulty: HORDE.Difficulty[HORDE.CurrentDifficulty].damageMultiplier

HORDE.Difficulty = {
    [1] = {
        name = "NORMAL",
        damageMultiplier = 1,
        enemyCountMultiplier = 1,
        rewardMultiplier = 1,
        healthMultiplier = 1,
        startMoneyMultiplier = 1,
        spawnRadiusMultiplier = 1,
        maxEnemiesAliveScaleFactor = 1,
        poisonHeadcrabDamage = 50,
        statusDurationBonus = 0,
        breakHealthLeft = 0.25,
        shockDamageIncrease = 0.15,
        frostbiteSlow = 0.4,
        eliteHealthScaleAdd = 0,
        eliteHealthScaleMultiplier = 1,
        eliteMutationProbability = 0,
        mutationProbability = 0,
        additionalPack = 0,
        additionalAmmoBoxes = 2,
        hemorrhagePercentage = 0.3,
        xpMultiStart = 1,
        xpMultiEnd = 1,
    },
    [2] = {
        name = "HARD",
        damageMultiplier = 1.25,
        enemyCountMultiplier = 1.3,
        rewardMultiplier = 0.8,
        healthMultiplier = 1.25,
        startMoneyMultiplier = 0.9,
        spawnRadiusMultiplier = 0.75,
        maxEnemiesAliveScaleFactor = 1.15,
        poisonHeadcrabDamage = 60,
        statusDurationBonus = 1,
        breakHealthLeft = 0.25,
        shockDamageIncrease = 0.20,
        frostbiteSlow = 0.45,
        eliteHealthScaleAdd = 0.1,
        eliteHealthScaleMultiplier = 1,
        eliteMutationProbability = 0.05,
        mutationProbability = 0.05,
        additionalPack = 1,
        additionalAmmoBoxes = 1,
        hemorrhagePercentage = 0.35,
        xpMultiStart = 1,
        xpMultiEnd = 2,
    },
    [3] = {
        name = "REALISM",
        damageMultiplier = 1.5,
        enemyCountMultiplier = 1.5,
        rewardMultiplier = 0.6,
        healthMultiplier = 1.5,
        startMoneyMultiplier = 0.8,
        spawnRadiusMultiplier = 0.5,
        maxEnemiesAliveScaleFactor = 1.25,
        poisonHeadcrabDamage = 75,
        statusDurationBonus = 2,
        breakHealthLeft = 0.25,
        shockDamageIncrease = 0.25,
        frostbiteSlow = 0.5,
        eliteHealthScaleAdd = 0.075,
        eliteHealthScaleMultiplier = 1,
        eliteMutationProbability = 0.10,
        mutationProbability = 0.10,
        additionalPack = 0,
        additionalAmmoBoxes = 0,
        hemorrhagePercentage = 0.4,
        xpMultiStart = 2,
        xpMultiEnd = 3,
    },
    [4] = {
        name = "NIGHTMARE",
        damageMultiplier = 1.7,
        enemyCountMultiplier = 1.6,
        rewardMultiplier = 0.5,
        healthMultiplier = 1.5,
        startMoneyMultiplier = 0.75,
        spawnRadiusMultiplier = 0.5,
        maxEnemiesAliveScaleFactor = 1.25,
        poisonHeadcrabDamage = 75,
        statusDurationBonus = 3,
        breakHealthLeft = 0.25,
        shockDamageIncrease = 0.25,
        frostbiteSlow = 0.5,
        eliteHealthScaleAdd = 0.1,
        eliteHealthScaleMultiplier = 1.1,
        eliteMutationProbability = 0.30,
        mutationProbability = 0.20,
        additionalPack = 2,
        additionalAmmoBoxes = 0,
        hemorrhagePercentage = 0.5,
        xpMultiStart = 2,
        xpMultiEnd = 4,
    },
    [5] = {
        name = "APOCALYPSE",
        damageMultiplier = 1.9,
        enemyCountMultiplier = 1.7,
        rewardMultiplier = 0.4,
        healthMultiplier = 1.5,
        startMoneyMultiplier = 0.6,
        spawnRadiusMultiplier = 0.4,
        maxEnemiesAliveScaleFactor = 1.3,
        poisonHeadcrabDamage = 75,
        statusDurationBonus = 4,
        breakHealthLeft = 0.25,
        shockDamageIncrease = 0.30,
        frostbiteSlow = 0.55,
        eliteHealthScaleAdd = 0.125,
        eliteHealthScaleMultiplier = 1.2,
        eliteMutationProbability = 0.40,
        mutationProbability = 0.30,
        additionalPack = 3,
        additionalAmmoBoxes = 0,
        hemorrhagePercentage = 0.5,
        xpMultiStart = 3,
        xpMultiEnd = 5,
    },
    [6] = {
        name = "HELL",
        damageMultiplier = 2,
        enemyCountMultiplier = 1.5,
        rewardMultiplier = 0.3,
        healthMultiplier = 2,
        startMoneyMultiplier = 0.6,
        spawnRadiusMultiplier = 0.4,
        maxEnemiesAliveScaleFactor = 1.75,
        poisonHeadcrabDamage = 75,
        statusDurationBonus = 5,
        breakHealthLeft = 0.25,
        shockDamageIncrease = 0.50,
        frostbiteSlow = 0.75,
        eliteHealthScaleAdd = 0.15,
        eliteHealthScaleMultiplier = 1.5,
        eliteMutationProbability = 0.50,
        mutationProbability = 1,
        additionalPack = 4,
        additionalAmmoBoxes = 2,
        hemorrhagePercentage = 0.5,
        xpMultiStart = 3,
        xpMultiEnd = 6,
    },
    [7] = {
        name = "CHAOS",
        damageMultiplier = 2,
        healthMultiplier = 2.5,
        enemyCountMultiplier = 1.5,
        rewardMultiplier = 0.3,
        startMoneyMultiplier = 0.6,
        spawnRadiusMultiplier = 0.4,
        maxEnemiesAliveScaleFactor = 1.75,
        poisonHeadcrabDamage = 50,
        statusDurationBonus = 5,
        breakHealthLeft = 0.25,
        shockDamageIncrease = 0.50,
        frostbiteSlow = 0.75,
        eliteHealthScaleAdd = 0.175,
        eliteHealthScaleMultiplier = 1.75,
        eliteMutationProbability = 0.75,
        mutationProbability = 1,
        additionalPack = 4,
        additionalAmmoBoxes = 5,
        hemorrhagePercentage = 0.5,
        xpMultiStart = 4,
        xpMultiEnd = 7,
    },
    [8] = {
        name = "SWARM",
        damageMultiplier = 1.8,
        enemyCountMultiplier = 2.5,
        rewardMultiplier = 0.2,
        healthMultiplier = 1.2,
        startMoneyMultiplier = 1,
        spawnRadiusMultiplier = 0.5,
        maxEnemiesAliveScaleFactor = 10,
        poisonHeadcrabDamage = 25,
        statusDurationBonus = 1,
        breakHealthLeft = 0.5,
        shockDamageIncrease = 0.1,
        frostbiteSlow = 0.5,
        eliteHealthScaleAdd = 0.1,
        eliteHealthScaleMultiplier = 1.1,
        eliteMutationProbability = 0.30,
        mutationProbability = 0.30,
        additionalPack = 6,
        additionalAmmoBoxes = 10,
        hemorrhagePercentage = 0.5,
        xpMultiStart = 2,
        xpMultiEnd = 4,
    },
}

-- Making sure that all all keys are present
local requiredKeys = {
    "name",
    "damageMultiplier",
    "enemyCountMultiplier",
    "rewardMultiplier",
    "healthMultiplier",
    "startMoneyMultiplier",
    "spawnRadiusMultiplier",
    "maxEnemiesAliveScaleFactor",
    "poisonHeadcrabDamage",
    "statusDurationBonus",
    "breakHealthLeft",
    "shockDamageIncrease",
    "frostbiteSlow",
    "eliteHealthScaleAdd",
    "eliteHealthScaleMultiplier",
    "eliteMutationProbability",
    "mutationProbability",
    "additionalPack",
    "additionalAmmoBoxes",
    "hemorrhagePercentage",
}

for _, difficulty in pairs( HORDE.Difficulty ) do
    for _, key in pairs( requiredKeys ) do
        if difficulty[key] == nil then
            print( "Difficulty " .. difficulty.name .. " is missing key " .. key )
            ErrorNoHalt( "Difficulty " .. difficulty.name .. " is missing key " .. key .. "\n" )
        end
    end
end
