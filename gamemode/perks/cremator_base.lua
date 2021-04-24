PERK.PrintName = "Cremator Base"
PERK.Description = "The Cremator wreaks destruction with Fire damage.\nComplexity: EASY\n\n85% increased Fire damage resistance."
PERK.Params = {
    [2] = {value = 0.85, percent = true},
}

PERK.Hooks = {}
PERK.Hooks.Horde_OnSetPerk = function(ply, perk)
    if SERVER and perk == "cremator_base" then
    end
end

PERK.Hooks.Horde_OnUnsetPerk = function(ply, perk)
    if SERVER and perk == "cremator_base" then
    end
end

PERK.Hooks.Horde_OnPlayerDamageTaken = function (ply, dmginfo, bonus)
    if not ply:Horde_GetPerk("cremator_base")  then return end
    if dmginfo:GetDamageType() == DMG_BURN or dmginfo:GetDamageType() == DMG_SLOWBURN then
        bonus.resistance = bonus.resistance + 0.85
    end
end