GADGET.PrintName = "Exoskeleton"
GADGET.Description =
[[Using the active ability activates a short boost.

You cannot run.
Passively provides 20% increased Global damage resistance.]]
GADGET.Icon = "items/gadgets/exoskeleton.png"
GADGET.Duration = 0
GADGET.Cooldown = 5
GADGET.Active = true
GADGET.Params = {
    [1] = {value = 5},
}
GADGET.Hooks = {}

GADGET.Hooks.Horde_UseActiveGadget = function (ply)
    if CLIENT then return end
    if ply:Horde_GetGadget() ~= "gadget_exoskeleton" then return end
    --sound.Play("weapons/physcannon/energy_sing_explosion2.wav", ply:GetPos())
    local dir = ply:GetForward()
    local vel = dir * 1000
    ply:SetLocalVelocity(vel)
end

GADGET.Hooks.Horde_OnPlayerDamageTaken = function (ply, dmginfo, bonus)
    if ply:Horde_GetGadget() ~= "gadget_exoskeleton"  then return end
    bonus.resistance = bonus.resistance + 0.2
end

GADGET.Hooks.Horde_PlayerMoveBonus = function (ply, mv)
    if ply:Horde_GetGadget() ~= "gadget_exoskeleton"  then return end
    ply:SetRunSpeed(ply:Horde_GetClass().movespd)
end