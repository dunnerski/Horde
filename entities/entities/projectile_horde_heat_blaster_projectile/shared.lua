ENT.Type 				= "anim"
ENT.Base 				= "base_entity"
ENT.PrintName 			= "Heat Bolt"
ENT.Author 				= ""
ENT.Information 		= ""

ENT.Spawnable 			= false


AddCSLuaFile()

ENT.Model = "models/items/ar2_grenade.mdl"
ENT.Ticks = 0
ENT.FuseTime = 10
ENT.CollisionGroup = COLLISION_GROUP_PROJECTILE
ENT.CollisionGroupType = COLLISION_GROUP_PROJECTILE
ENT.Removing = nil
ENT.Horde_Charged = 0
function ENT:Draw()
self.Entity:DrawModel()
end
if SERVER then

function ENT:Initialize()
    self:SetMaterial("models/props_combine/portalball001_sheet")

	self.StartGlow1 = ents.Create( "env_sprite" )
	self.StartGlow1:SetKeyValue( "rendercolor","255 255 0" )
	self.StartGlow1:SetKeyValue( "GlowProxySize","2.0" )
	self.StartGlow1:SetKeyValue( "HDRColorScale","1.0" )
	self.StartGlow1:SetKeyValue( "renderfx","14" )
	self.StartGlow1:SetKeyValue( "rendermode","3" )
	self.StartGlow1:SetKeyValue( "renderamt","255" )
	self.StartGlow1:SetKeyValue( "disablereceiveshadows","0" )
	self.StartGlow1:SetKeyValue( "mindxlevel","0" )
	self.StartGlow1:SetKeyValue( "maxdxlevel","0" )
	self.StartGlow1:SetKeyValue( "framerate","10.0" )
	self.StartGlow1:SetKeyValue( "model","sprites/orangeglow1.spr" )
	self.StartGlow1:SetKeyValue( "spawnflags","0" )
    if self.Horde_Charged >= 1 then
        self.StartGlow1:SetKeyValue( "scale","2" )
    else
        self.StartGlow1:SetKeyValue( "scale","0.5" )
    end
	
	self.StartGlow1:SetPos( self.Entity:GetPos() )
	self.StartGlow1:Spawn()
	self.StartGlow1:SetParent( self.Entity )
	self:DeleteOnRemove(self.StartGlow1)

	self.StartLight1 = ents.Create("light_dynamic")
	self.StartLight1:SetKeyValue("brightness", "1")
	self.StartLight1:SetKeyValue("distance", "200")
	self.StartLight1:SetLocalPos(self:GetPos())
	self.StartLight1:SetLocalAngles( self:GetAngles() )
	self.StartLight1:Fire("Color", "255 150 0")
	self.StartLight1:SetParent(self)
	self.StartLight1:Spawn()
	self.StartLight1:Activate()
	self.StartLight1:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(self.StartLight1)
	self:SetModelScale(0.5)
    self:PhysicsInitSphere(1, "metal_bouncy")
	construct.SetPhysProp(self:GetOwner(), self, 0, self:GetPhysicsObject(), {GravityToggle = false, Material = "metal_bouncy"})
    local phys = self:GetPhysicsObject()
    if phys:IsValid() then
        phys:Wake()
        phys:SetMass(1)
        phys:SetBuoyancyRatio(0)
        phys:EnableDrag(false)
        phys:EnableGravity(false)
    end

    timer.Simple(2, function() if IsValid(self) then
        self.Removing = true
        self:Remove()
        end
    end)

	self:DrawShadow(false)
	self:ResetSequence("idle")
    local pb_vert = 1
    local pb_hor = 1
    self:PhysicsInitBox( Vector(-pb_vert,-pb_hor,-pb_hor), Vector(pb_vert,pb_hor,pb_hor) )

    self.SpawnTime = CurTime()

    --ParticleEffectAttach("vj_rpg1_fulltrail", PATTACH_ABSORIGIN_FOLLOW, self, 0)
end

function ENT:Think()
    
    if SERVER and CurTime() - self.SpawnTime >= self.FuseTime then
        self:Remove()
    end
end

function ENT:PhysicsCollide(data, collider)
    if self.Removing then return end
    local v = 125
    if self.Horde_Charged >= 1 then
        v = 250
    end

	local dmg = DamageInfo()
	dmg:SetAttacker(self.Owner)
	dmg:SetInflictor(self.Inflictor)
	dmg:SetDamageType(DMG_BURN)
	dmg:SetDamage(v)
	util.BlastDamageInfo(dmg, self:GetPos(), v)
	if self.AlreadyPaintedDeathDecal == false then
		self.AlreadyPaintedDeathDecal = true
		util.Decal("Scorch", data.HitPos + data.HitNormal, data.HitPos - data.HitNormal)
	end

    self:FireBullets({
        Attacker = owner,
        Inflitor = self,
        Damage = v,
        Tracer = 0,
        Distance = 1000,
        Dir = data.HitPos - self:GetPos(),
        Src = self:GetPos(),
        Callback = function(att, tr, dmginfo)
            dmginfo:SetDamageType(DMG_BURN)
        end
    })

    local effectdata = EffectData()
	effectdata:SetOrigin(data.HitPos)
	effectdata:SetScale((1 + self.Horde_Charged)/2.5)
	effectdata:SetEntity(self.Owner)
	util.Effect("horde_blaster_flame_explosion", effectdata )

    self:EmitSound("horde/weapons/blaster/fire_explosion.ogg")
	
	
	--ParticleEffect("vj_explosion1", self:GetPos(), Angle(0,0,0), nil)

	local expLight = ents.Create("light_dynamic")
	expLight:SetKeyValue("brightness", "4")
	expLight:SetKeyValue("distance", "300")
	expLight:SetLocalPos(data.HitPos)
	expLight:SetLocalAngles(self:GetAngles())
	expLight:Fire("Color", "255 150 0")
	expLight:SetParent(self)
	expLight:Spawn()
	expLight:Activate()
	expLight:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(expLight)
	self:Remove()
end

end

function ENT:Draw()
    self:DrawModel()
end
if CLIENT then
function ENT:Think()
    if self.Ticks % 1 == 0 then
        local emitter = ParticleEmitter(self:GetPos())
        local particle = emitter:Add("particles/smokey", self:GetPos())
        particle:SetVelocity(VectorRand():GetNormalized() * math.Rand(50, 100))
        particle:SetAirResistance(100)
        particle:SetDieTime(0.5)
        particle:SetStartAlpha(255)
        particle:SetEndAlpha(0)
        if self.Horde_Charged >= 1 then
            particle:SetStartSize(math.Rand(10, 30))
        else
            particle:SetStartSize(math.Rand(5, 15))
        end
        
        particle:SetEndSize(0)
        particle:SetRoll(math.Rand(0, 360))
        particle:SetRollDelta(math.Rand(-30, 30))
        particle:SetColor(255, 255, 255)
        particle:SetLighting(true)
        emitter:Finish()
    end

    self.Ticks = self.Ticks + 1
end
end