//Another joke about my coding https://youtu.be/klHbRAoRA2U
//=============================================================================
// FHuman.
//=============================================================================
class FHuman extends Human
	abstract;

var float mpGroundSpeed;
var float mpWaterSpeed;
var float humanAnimRate;

replication 
{
	reliable if (( Role == ROLE_Authority ) && bNetOwner )
		humanAnimRate;
}

function Bool IsFiring()
{
	if ((Weapon != None) && ( Weapon.IsInState('NormalFire') || Weapon.IsInState('ClientFiring') ) ) 
		return True;
	else
		return False;
}

function Bool HasTwoHandedWeapon()
{
	if ((Weapon != None) && (Weapon.Mass >= 30))
		return True;
	else
		return False;
}

//
// animation functions
//
function PlayTurning()
{
//	ClientMessage("PlayTurning()");
	if (bForceDuck || bCrouchOn || IsLeaning())
		TweenAnim('Crouch', 0.1);
	else
	{
		if (HasTwoHandedWeapon())
			TweenAnim('Walk', 0.1);
		else
			TweenAnim('Walk', 0.1);
	}
}

function TweenToWalking(float tweentime)
{
//	ClientMessage("TweenToWalking()");
	if (bForceDuck || bCrouchOn)
		TweenAnim('Crouch', tweentime);
	else
	{
		if (HasTwoHandedWeapon())
			TweenAnim('Walk', tweentime);
		else
			TweenAnim('Walk', tweentime);
	}
}

function PlayWalking()
{
	local float newhumanAnimRate;

	newhumanAnimRate = humanAnimRate;

	// UnPhysic.cpp walk speed changed by proportion 0.7/0.3 (2.33), but that looks too goofy (fast as hell), so we'll try something a little slower
	if ( Level.NetMode != NM_Standalone ) 
		newhumanAnimRate = humanAnimRate * 1.75;

	//	ClientMessage("PlayWalking()");
	if (bForceDuck || bCrouchOn)
		LoopAnim('Crouch', newhumanAnimRate);
	else
	{
		if (HasTwoHandedWeapon())
			LoopAnim('Walk', newhumanAnimRate);
		else
			LoopAnim('Walk', newhumanAnimRate);
	}
}

function TweenToRunning(float tweentime)
{
//	ClientMessage("TweenToRunning()");
	if (bIsWalking)
	{
		TweenToWalking(0.1);
		return;
	}

	if (IsFiring())
	{
		if (aStrafe != 0)
		{
			if (HasTwoHandedWeapon())
				PlayAnim('Strafe',humanAnimRate, tweentime);
			else
				PlayAnim('Strafe',humanAnimRate, tweentime);
		}
		else
		{
			if (HasTwoHandedWeapon())
				PlayAnim('RunShoot',humanAnimRate, tweentime);
			else
				PlayAnim('RunShoot',humanAnimRate, tweentime);
		}
	}
	else if (bOnFire)
		PlayAnim('Panic',humanAnimRate, tweentime);
	else
	{
		if (HasTwoHandedWeapon())
			PlayAnim('RunShoot',humanAnimRate, tweentime);
		else
			PlayAnim('Run',humanAnimRate, tweentime);
	}
}

function PlayRunning()
{
//	ClientMessage("PlayRunning()");
	if (IsFiring())
	{
		if (aStrafe != 0)
		{
			if (HasTwoHandedWeapon())
				LoopAnim('Strafe', humanAnimRate);
			else
				LoopAnim('Strafe', humanAnimRate);
		}
		else
		{
			if (HasTwoHandedWeapon())
				LoopAnim('RunShoot', humanAnimRate);
			else
				LoopAnim('RunShoot', humanAnimRate);
		}
	}
	else if (bOnFire)
		LoopAnim('Panic', humanAnimRate);
	else
	{
		if (HasTwoHandedWeapon())
			LoopAnim('RunShoot', humanAnimRate);
		else
			LoopAnim('Run', humanAnimRate);
	}
}

function TweenToWaiting(float tweentime)
{
//	ClientMessage("TweenToWaiting()");
	if (IsInState('PlayerSwimming') || (Physics == PHYS_Swimming))
	{
		if (IsFiring())
			LoopAnim('TreadShoot');
		else
			LoopAnim('Tread');
	}
	else if (IsLeaning() || bForceDuck)
		TweenAnim('Crouch', tweentime);
	else if (((AnimSequence == 'Pickup') && bAnimFinished) || ((AnimSequence != 'Pickup') && !IsFiring()))
	{
		if (HasTwoHandedWeapon())
			TweenAnim('BreatheLight', tweentime);
		else
			TweenAnim('BreatheLight', tweentime);
	}
}

function PlayWaiting()
{
//	ClientMessage("PlayWaiting()");
	if (IsInState('PlayerSwimming') || (Physics == PHYS_Swimming))
	{
		if (IsFiring())
			LoopAnim('TreadShoot');
		else
			LoopAnim('Tread');
	}
	else if (IsLeaning() || bForceDuck)
		TweenAnim('Crouch', 0.1);
	else if (!IsFiring())
	{
		if (HasTwoHandedWeapon())
			LoopAnim('BreatheLight');
		else
			LoopAnim('BreatheLight');
	}

}

function PlaySwimming()
{
//	ClientMessage("PlaySwimming()");
	LoopAnim('Tread');
}

function TweenToSwimming(float tweentime)
{
//	ClientMessage("TweenToSwimming()");
	TweenAnim('Tread', tweentime);
}

function PlayInAir()
{
//	ClientMessage("PlayInAir()");
	if (!bIsCrouching && (AnimSequence != 'Jump'))
		PlayAnim('Jump',3.0,0.1);
}

function PlayLanded(float impactVel)
{
//	ClientMessage("PlayLanded()");
	PlayFootStep();
	if (!bIsCrouching)
		PlayAnim('Land',3.0,0.1);
}

function PlayDuck()
{
//	ClientMessage("PlayDuck()");
	if ((AnimSequence != 'Crouch') && (AnimSequence != 'Crouch'))
	{
		if (IsFiring())
			PlayAnim('CrouchShoot',,0.1);
		else
			PlayAnim('Crouch',,0.1);
	}
	else
		Playanim('Crouch',,0.1);
}

function PlayRising()
{
//	ClientMessage("PlayRising()");
	PlayAnim('Stand',,0.1);
}

function PlayCrawling()
{
//	ClientMessage("PlayCrawling()");
	if (IsFiring())
		LoopAnim('CrouchShoot');
	else
		PlayAnim('Crouch');
}

function PlayFiring()
{
	local DeusExWeapon W;

//	ClientMessage("PlayFiring()");

	W = DeusExWeapon(Weapon);

	if (W != None)
	{
		if (IsInState('PlayerSwimming') || (Physics == PHYS_Swimming))
			LoopAnim('TreadShoot',,0.1);
		else if (W.bHandToHand)
		{
			if (bAnimFinished || (AnimSequence != 'Attack'))
				PlayAnim('Attack',,0.1);
		}
		else if (bIsCrouching || IsLeaning())
			LoopAnim('CrouchShoot',,0.1);
		else
		{
			if (HasTwoHandedWeapon())
				LoopAnim('Shoot',,0.1);
			else
				LoopAnim('Shoot',,0.1);
		}
	}
}

function PlayWeaponSwitch(Weapon newWeapon)
{
//	ClientMessage("PlayWeaponSwitch()");
	if (!bIsCrouching && !bForceDuck && !bCrouchOn && !IsLeaning())
		PlayAnim('Reload');
}

function PlayDying(name damageType, vector hitLoc)
{
	local Vector X, Y, Z;
	local float dotp;

//	ClientMessage("PlayDying()");
	GetAxes(Rotation, X, Y, Z);
	dotp = (Location - HitLoc) dot X;

	if (Region.Zone.bWaterZone)
	{
		PlayAnim('WaterDeath',,0.1);
	}
	else
	{
		// die from the correct side
		if (dotp < 0.0)		// shot from the front, fall back
			PlayAnim('DeathBack',,0.1);
		else				// shot from the back, fall front
			PlayAnim('DeathFront',,0.1);
	}

	PlayDyingSound();
}

//
// sound functions
//

function float RandomPitch()
{
	return (1.1 - 0.2*FRand());
}

function Gasp()
{
	PlaySound(sound'FJCGasp', SLOT_Pain,,,, RandomPitch());
}

function PlayDyingSound()
{
	if (Region.Zone.bWaterZone)
		PlaySound(sound'FJCWaterDeath', SLOT_Pain,,,, RandomPitch());
	else
		PlaySound(sound'FJCDeath', SLOT_Pain,,,, RandomPitch());
}

function PlayTakeHitSound(int Damage, name damageType, int Mult)
{
	local float rnd;

	if ( Level.TimeSeconds - LastPainSound < FRand() + 0.5)
		return;

	LastPainSound = Level.TimeSeconds;

	if (Region.Zone.bWaterZone)
	{
		if (damageType == 'Drowned')
		{
			if (FRand() < 0.8)
				PlaySound(sound'FJCDrown', SLOT_Pain, FMax(Mult * TransientSoundVolume, Mult * 2.0),,, RandomPitch());
		}
		else
			PlaySound(sound'FJCPainSmall', SLOT_Pain, FMax(Mult * TransientSoundVolume, Mult * 2.0),,, RandomPitch());
	}
	else
	{
		// Body hit sound for multiplayer only
		if (((damageType=='Shot') || (damageType=='AutoShot'))  && ( Level.NetMode != NM_Standalone ))
		{
			PlaySound(sound'BodyHit', SLOT_Pain, FMax(Mult * TransientSoundVolume, Mult * 2.0),,, RandomPitch());
		}

		if ((damageType == 'TearGas') || (damageType == 'HalonGas'))
			PlaySound(sound'FJCEyePain', SLOT_Pain, FMax(Mult * TransientSoundVolume, Mult * 2.0),,, RandomPitch());
		else if (damageType == 'PoisonGas')
			PlaySound(sound'FJCCough', SLOT_Pain, FMax(Mult * TransientSoundVolume, Mult * 2.0),,, RandomPitch());
		else
		{
			rnd = FRand();
			if (rnd < 0.33)
				PlaySound(sound'FJCPainSmall', SLOT_Pain, FMax(Mult * TransientSoundVolume, Mult * 2.0),,, RandomPitch());
			else if (rnd < 0.66)
				PlaySound(sound'FJCPainMedium', SLOT_Pain, FMax(Mult * TransientSoundVolume, Mult * 2.0),,, RandomPitch());
			else
				PlaySound(sound'FJCPainLarge', SLOT_Pain, FMax(Mult * TransientSoundVolume, Mult * 2.0),,, RandomPitch());
		}
		AISendEvent('LoudNoise', EAITYPE_Audio, FMax(Mult * TransientSoundVolume, Mult * 2.0));
	}
}

function UpdateAnimRate( float augValue )
{
	if ( Level.NetMode != NM_Standalone )
	{
		if ( augValue == -1.0 )
			humanAnimRate = (Default.mpGroundSpeed/320.0);
		else
			humanAnimRate = (Default.mpGroundSpeed/320.0) * augValue * 0.85;	// Scale back about 15% so were not too fast
	}
}

simulated function PreBeginPlay()
{
	Super.PreBeginPlay();

	// If this is a netgame, then override defaults
	if ( Level.NetMode != NM_StandAlone )
	{
		GroundSpeed = mpGroundSpeed;
		WaterSpeed = mpWaterSpeed;
		humanAnimRate = (GroundSpeed/320.0);
	}
}

defaultproperties
{
     mpGroundSpeed=230.000000
     mpWaterSpeed=110.000000
     humanAnimRate=1.000000
}
