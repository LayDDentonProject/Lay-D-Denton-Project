//=============================================================================
// LDDPCRohan.
//=============================================================================
class LDDPCRohan extends HumanMilitary;


function float ShieldDamage(name damageType)
{
	// handle special damage types
	if ((damageType == 'Flamed') || (damageType == 'Burned') || (damageType == 'Stunned') ||
	    (damageType == 'KnockedOut'))
		return 0.0;
	else if ((damageType == 'TearGas') || (damageType == 'PoisonGas') || (damageType == 'HalonGas') ||
			(damageType == 'Radiation') || (damageType == 'Shocked') || (damageType == 'Poison') ||
	        (damageType == 'PoisonEffect'))
		return 0.1;
	else
		return Super.ShieldDamage(damageType);
}

function GotoDisabledState(name damageType, EHitLocation hitPos)
{
	if (!bCollideActors && !bBlockActors && !bBlockPlayers)
		return;
	if (CanShowPain())
		TakeHit(hitPos);
	else
		GotoNextState();
}


function Carcass SpawnCarcass()
{
	if (bStunned)
		return Super.SpawnCarcass();

	Explode();

	return None;
}

function Explode()
{
	local SphereEffect sphere;
	local ScorchMark s;
	local ExplosionLight light;
	local int i;
	local float explosionDamage;
	local float explosionRadius;

	explosionDamage = 0;
	explosionRadius = 256;

	// alert NPCs that I'm exploding
	PlaySound(Sound'Spark1', SLOT_None,,, 256*16);

	// draw a pretty explosion
	light = Spawn(class'ExplosionLight',,, Location);
	if (light != None)
		light.size = 4;

	Spawn(class'ExplosionSmall',,, Location + 2*VRand()*CollisionRadius);
	Spawn(class'ExplosionMedium',,, Location + 2*VRand()*CollisionRadius);
	Spawn(class'ExplosionMedium',,, Location + 2*VRand()*CollisionRadius);
	Spawn(class'ExplosionLarge',,, Location + 2*VRand()*CollisionRadius);

	sphere = Spawn(class'SphereEffect',,, Location);
	if (sphere != None)
		sphere.size = explosionRadius / 32.0;

	// spawn a mark
	s = spawn(class'ScorchMark', Base,, Location-vect(0,0,1)*CollisionHeight, Rotation+rot(16384,0,0));
	if (s != None)
	{
		s.DrawScale = FClamp(explosionDamage/30, 0.1, 3.0);
		s.ReattachDecal();
	}

	// spawn some rocks and flesh fragments
	spawn(class'EMPGrenade',,,Location);
	spawn(class'EMPGrenade',,,Location);
	for (i=0; i<150; i++)
	{
		spawn(class'FireComet',,,Location);
	}

	HurtRadius(explosionDamage, explosionRadius, 'Exploded', explosionDamage*100, Location);
}

defaultproperties
{
     CarcassType=Class'FemJC.LDDPCRohanCarcass'
     WalkingSpeed=0.020000
     bLeaveAfterFleeing=True
     InitialAlliances(0)=(AllianceName=Player,AllianceLevel=1.000000)
     BaseAssHeight=-23.000000
     runAnimMult=4.000000
     GroundSpeed=2000.000000
     WaterSpeed=2000.000000
     AirSpeed=2000.000000
     AccelRate=2000.000000
     JumpZ=500.000000
     Health=600
     HealthHead=900
     HealthTorso=600
     HealthLegLeft=600
     HealthLegRight=600
     HealthArmLeft=600
     HealthArmRight=600
     Mesh=LodMesh'DeusExCharacters.GM_Trench'
     MultiSkins(0)=Texture'FemJC.Characters.XriborgTex0'
     MultiSkins(1)=Texture'FemJC.Characters.XriborgTex2'
     MultiSkins(2)=Texture'DeusExCharacters.Skins.PantsTex5'
     MultiSkins(3)=Texture'FemJC.Characters.XriborgTex0'
     MultiSkins(4)=Texture'FemJC.Characters.XriborgTex1'
     MultiSkins(5)=Texture'FemJC.Characters.XriborgTex2'
     MultiSkins(6)=Texture'DeusExItems.Skins.GrayMaskTex'
     MultiSkins(7)=Texture'DeusExItems.Skins.BlackMaskTex'
     CollisionRadius=20.000000
     CollisionHeight=47.500000
     BindName="LDDPCRohan"
     FamiliarName="Chris Rohan"
     UnfamiliarName="Chris Rohan"
}
