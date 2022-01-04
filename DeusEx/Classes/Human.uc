class Human injects Human;

//LDDP, 10/26/21: Female storage, because flags wipe on new game.
var(LDDP) travel bool bMadeFemale, bFemaleUsesMaleInteractions; //Are we female? Do we want traditionally male interactions? Save this per char, I guess.
var(LDDP) globalconfig bool bRetroMorpheus, bGaveNewGameTips; //Keep old morpheus lines? Also, did we give a tip yet?

function UpdatePlayerSkin()
{
    local DentonClone DC;

    Super.UpdatePlayerSkin();

    //LDDP, 10/26/21: Reskin denton clone on the fly
    forEach AllActors(class'DentonClone', DC)
    {
        DC.SetSkin(Human(Self));
    }
}

function bool SetBasedPawnSize(float newRadius, float newHeight)
{
    local bool bSuccess;

    bSuccess = Super.SetBasedPawnSize(newRadius, newHeight);
	// TODO: enabling this causes the player to fall through the floor at the start?
    if(false && bSuccess) {
        //LDDP, 10/26/21: We use this to dynamically adjust our collision height. Bear this in mind.
        if ((FlagBase != None) && (FlagBase.GetBool('LDDPJCIsFemale')))
        {
            if (PrePivot.Z ~= 4.5)
            {
                PrePivot.Z -= 4.5;
            }
            BaseEyeHeight -= 2;
        }
    }

    return bSuccess;
}

function float GetDefaultCollisionHeight()
{
	 // TODO: enabling this causes the player to fall through the floor at the start?
    if (false && (FlagBase != None) && (FlagBase.GetBool('LDDPJCIsFemale')))
    {
        return Default.CollisionHeight-9.0;
    }
     return Super.GetDefaultCollisionHeight();
}

function Bool HasTwoHandedWeapon()
{
	//LDDP, 11/3/2021: Checking bool here because it's faster, and anim functions are called a LOT.
	if (bMadeFemale)
	{
		return false;
	}
    return Super.HasTwoHandedWeapon();
}

//LDDP, 10/26/21: These next 3 functions are all modified for unique sound playing based on female stuff
function Gasp()
{
	local Sound TSound;
	
	if ((FlagBase != None) && (FlagBase.GetBool('LDDPJCIsFemale')))
	{
		TSound = Sound(DynamicLoadObject("FemJC.FJCGasp", class'Sound', false));
		if (TSound != None) PlaySound(TSound, SLOT_Pain,,,, RandomPitch());
	}
	else
	{
		PlaySound(sound'MaleGasp', SLOT_Pain,,,, RandomPitch());
	}
}

function PlayDyingSound()
{
	local Sound TSound;
	
	if ((FlagBase != None) && (FlagBase.GetBool('LDDPJCIsFemale')))
	{
		if (Region.Zone.bWaterZone)
		{
			TSound = Sound(DynamicLoadObject("FemJC.FJCWaterDeath", class'Sound', false));
			if (TSound != None) PlaySound(TSound, SLOT_Pain,,,, RandomPitch());
		}
		else
		{
			TSound = Sound(DynamicLoadObject("FemJC.FJCDeath", class'Sound', false));
			if (TSound != None) PlaySound(TSound, SLOT_Pain,,,, RandomPitch());
		}
	}
	else
	{
		if (Region.Zone.bWaterZone)
		{
			PlaySound(sound'MaleWaterDeath', SLOT_Pain,,,, RandomPitch());
		}
		else
		{
			PlaySound(sound'MaleDeath', SLOT_Pain,,,, RandomPitch());
		}
	}
}

function PlayTakeHitSound(int Damage, name damageType, int Mult)
{
	local float rnd;
	
	local sound TSound;

	if ( Level.TimeSeconds - LastPainSound < FRand() + 0.5)
		return;

	LastPainSound = Level.TimeSeconds;

	if ((FlagBase != None) && (FlagBase.GetBool('LDDPJCIsFemale')))
	{
		if (Region.Zone.bWaterZone)
		{
			if (damageType == 'Drowned')
			{
				if (FRand() < 0.8)
				{
					TSound = Sound(DynamicLoadObject("FemJC.FJCDrown", class'Sound', false));
					if (TSound != None) PlaySound(TSound, SLOT_Pain, FMax(Mult * TransientSoundVolume, Mult * 2.0),,, RandomPitch());
				}
			}
			else
			{
				TSound = Sound(DynamicLoadObject("FemJC.FJCPainSmall", class'Sound', false));
				if (TSound != None) PlaySound(TSound, SLOT_Pain, FMax(Mult * TransientSoundVolume, Mult * 2.0),,, RandomPitch());
			}
		}
		else
		{
			// Body hit sound for multiplayer only
			if (((damageType == 'Shot') || (damageType == 'AutoShot'))  && (Level.NetMode != NM_Standalone))
			{
				PlaySound(sound'BodyHit', SLOT_Pain, FMax(Mult * TransientSoundVolume, Mult * 2.0),,, RandomPitch());
			}
			
			if ((damageType == 'TearGas') || (damageType == 'HalonGas'))
			{
				TSound = Sound(DynamicLoadObject("FemJC.FJCEyePain", class'Sound', false));
				if (TSound != None) PlaySound(TSound, SLOT_Pain, FMax(Mult * TransientSoundVolume, Mult * 2.0),,, RandomPitch());
			}
			else if (damageType == 'PoisonGas')
			{
				TSound = Sound(DynamicLoadObject("FemJC.FJCCough", class'Sound', false));
				if (TSound != None) PlaySound(TSound, SLOT_Pain, FMax(Mult * TransientSoundVolume, Mult * 2.0),,, RandomPitch());
			}
			else
			{
				rnd = FRand();
				if (rnd < 0.33)
				{
					TSound = Sound(DynamicLoadObject("FemJC.FJCPainSmall", class'Sound', false));
					if (TSound != None) PlaySound(TSound, SLOT_Pain, FMax(Mult * TransientSoundVolume, Mult * 2.0),,, RandomPitch());
				}
				else if (rnd < 0.66)
				{
					TSound = Sound(DynamicLoadObject("FemJC.FJCPainMedium", class'Sound', false));
					if (TSound != None) PlaySound(TSound, SLOT_Pain, FMax(Mult * TransientSoundVolume, Mult * 2.0),,, RandomPitch());
				}
				else
				{
					TSound = Sound(DynamicLoadObject("FemJC.FJCPainLarge", class'Sound', false));
					if (TSound != None) PlaySound(TSound, SLOT_Pain, FMax(Mult * TransientSoundVolume, Mult * 2.0),,, RandomPitch());
				}
			}
			AISendEvent('LoudNoise', EAITYPE_Audio, FMax(Mult * TransientSoundVolume, Mult * 2.0));
		}
	}
	else
	{
		if (Region.Zone.bWaterZone)
		{
			if (damageType == 'Drowned')
			{
				if (FRand() < 0.8)
					PlaySound(sound'MaleDrown', SLOT_Pain, FMax(Mult * TransientSoundVolume, Mult * 2.0),,, RandomPitch());
			}
			else
				PlaySound(sound'MalePainSmall', SLOT_Pain, FMax(Mult * TransientSoundVolume, Mult * 2.0),,, RandomPitch());
		}
		else
		{
			// Body hit sound for multiplayer only
			if (((damageType=='Shot') || (damageType=='AutoShot'))  && ( Level.NetMode != NM_Standalone ))
			{
				PlaySound(sound'BodyHit', SLOT_Pain, FMax(Mult * TransientSoundVolume, Mult * 2.0),,, RandomPitch());
			}
			
			if ((damageType == 'TearGas') || (damageType == 'HalonGas'))
				PlaySound(sound'MaleEyePain', SLOT_Pain, FMax(Mult * TransientSoundVolume, Mult * 2.0),,, RandomPitch());
			else if (damageType == 'PoisonGas')
				PlaySound(sound'MaleCough', SLOT_Pain, FMax(Mult * TransientSoundVolume, Mult * 2.0),,, RandomPitch());
			else
			{
				rnd = FRand();
				if (rnd < 0.33)
					PlaySound(sound'MalePainSmall', SLOT_Pain, FMax(Mult * TransientSoundVolume, Mult * 2.0),,, RandomPitch());
				else if (rnd < 0.66)
					PlaySound(sound'MalePainMedium', SLOT_Pain, FMax(Mult * TransientSoundVolume, Mult * 2.0),,, RandomPitch());
				else
					PlaySound(sound'MalePainLarge', SLOT_Pain, FMax(Mult * TransientSoundVolume, Mult * 2.0),,, RandomPitch());
			}
			AISendEvent('LoudNoise', EAITYPE_Audio, FMax(Mult * TransientSoundVolume, Mult * 2.0));
		}
	}
}

//LDDP, 10/28/21: Use this command to summon a debug dood with helpful advice.
exec function LDDPDebugDude()
{
	local Vector TLoc;
	local Rotator TRot;
	local ScriptedPawn SP;
	local class<ScriptedPawn> TClass;
	
	TClass = class<ScriptedPawn>(DynamicLoadObject("FemJC.LDDPCRohan", class'Class', false));
	if (TClass != None)
	{
		TLoc = Location + (vector(Rotation) * 128);
		TRot = Rotation + Rot(0,32768,0);
		
		SP = Spawn(TClass,,, TLoc, TRot);
		
		//LDDP, 10/28/21: We're leaving him at wandering for now. Whatevs. If this is more your speed, modder, knock yourself out.
		//SP.SetOrders('Standing', 'None', true);
	}
}

//LDDP, 10/26/21: Fix for using "Walk" command resetting collision height in a way that is wrong.
function ClientReStart()
{
	Super.ClientRestart();
	
	if ((FlagBase != None) && (FlagBase.GetBool('LDDPJCIsFemale')))
	{
		BaseEyeHeight = CollisionHeight - (GetDefaultCollisionHeight() - Default.BaseEyeHeight) - 2.0;
	}
	else
	{
		BaseEyeHeight = CollisionHeight - (GetDefaultCollisionHeight() - Default.BaseEyeHeight);
	}
}

//LDDP, 10/26/21: We tweak this because in theory feign death breaks dynamic collision size. That's bad, M'kay.
state FeigningDeath
{
ignores SeePlayer, HearNoise, Bump;

	function Rise()
	{
		if ( !bRising )
		{
			Enable('AnimEnd');
			
			//LDDP, 10/26/21: Yeah, this is on its way out. Thanks.
			//BaseEyeHeight = Default.BaseEyeHeight;
			
			//LDDP, 10/26/21: Update female sounds a bit here.
			if ((FlagBase != None) && (FlagBase.GetBool('LDDPJCIsFemale')))
			{
				BaseEyeHeight = CollisionHeight - (GetDefaultCollisionHeight() - Default.BaseEyeHeight) - 2.0;
			}
			else
			{
				BaseEyeHeight = CollisionHeight - (GetDefaultCollisionHeight() - Default.BaseEyeHeight);
			}
			bRising = true;
			PlayRising();
		}
	}
}

function CreateColorThemeManager()
{
	if (ThemeManager == None)
	{
		ThemeManager = Spawn(Class'ColorThemeManager', Self);

		// Add all default themes.

		// Menus
		ThemeManager.AddTheme(Class'ColorThemeMenu_Default');
		ThemeManager.AddTheme(Class'ColorThemeMenu_LDDP');
		ThemeManager.AddTheme(Class'ColorThemeMenu_BlueAndGold');
		ThemeManager.AddTheme(Class'ColorThemeMenu_CoolGreen');
		ThemeManager.AddTheme(Class'ColorThemeMenu_Cops');
		ThemeManager.AddTheme(Class'ColorThemeMenu_Cyan');
		ThemeManager.AddTheme(Class'ColorThemeMenu_DesertStorm');
		ThemeManager.AddTheme(Class'ColorThemeMenu_DriedBlood');
		ThemeManager.AddTheme(Class'ColorThemeMenu_Dusk');
		ThemeManager.AddTheme(Class'ColorThemeMenu_Earth');
		ThemeManager.AddTheme(Class'ColorThemeMenu_Green');
		ThemeManager.AddTheme(Class'ColorThemeMenu_Grey');
		ThemeManager.AddTheme(Class'ColorThemeMenu_IonStorm');
		ThemeManager.AddTheme(Class'ColorThemeMenu_Lava');
		ThemeManager.AddTheme(Class'ColorThemeMenu_NightVision');
		ThemeManager.AddTheme(Class'ColorThemeMenu_Ninja');
		ThemeManager.AddTheme(Class'ColorThemeMenu_Olive');
		ThemeManager.AddTheme(Class'ColorThemeMenu_PaleGreen');
		ThemeManager.AddTheme(Class'ColorThemeMenu_Pastel');
		ThemeManager.AddTheme(Class'ColorThemeMenu_Plasma');
		ThemeManager.AddTheme(Class'ColorThemeMenu_Primaries');
		ThemeManager.AddTheme(Class'ColorThemeMenu_Purple');
		ThemeManager.AddTheme(Class'ColorThemeMenu_Red');
		ThemeManager.AddTheme(Class'ColorThemeMenu_Seawater');
		ThemeManager.AddTheme(Class'ColorThemeMenu_SoylentGreen');
		ThemeManager.AddTheme(Class'ColorThemeMenu_Starlight');
		ThemeManager.AddTheme(Class'ColorThemeMenu_Steel');
		ThemeManager.AddTheme(Class'ColorThemeMenu_SteelGreen');
		ThemeManager.AddTheme(Class'ColorThemeMenu_Superhero');
		ThemeManager.AddTheme(Class'ColorThemeMenu_Terminator');
		ThemeManager.AddTheme(Class'ColorThemeMenu_Violet');

		// HUD
		ThemeManager.AddTheme(Class'ColorThemeHUD_Default');
		ThemeManager.AddTheme(Class'ColorThemeHUD_LDDP');
		ThemeManager.AddTheme(Class'ColorThemeHUD_Amber');
		ThemeManager.AddTheme(Class'ColorThemeHUD_Cops');
		ThemeManager.AddTheme(Class'ColorThemeHUD_Cyan');
		ThemeManager.AddTheme(Class'ColorThemeHUD_DarkBlue');
		ThemeManager.AddTheme(Class'ColorThemeHUD_DesertStorm');
		ThemeManager.AddTheme(Class'ColorThemeHUD_DriedBlood');
		ThemeManager.AddTheme(Class'ColorThemeHUD_Dusk');
		ThemeManager.AddTheme(Class'ColorThemeHUD_Grey');
		ThemeManager.AddTheme(Class'ColorThemeHUD_IonStorm');
		ThemeManager.AddTheme(Class'ColorThemeHUD_NightVision');
		ThemeManager.AddTheme(Class'ColorThemeHUD_Ninja');
		ThemeManager.AddTheme(Class'ColorThemeHUD_PaleGreen');
		ThemeManager.AddTheme(Class'ColorThemeHUD_Pastel');
		ThemeManager.AddTheme(Class'ColorThemeHUD_Plasma');
		ThemeManager.AddTheme(Class'ColorThemeHUD_Primaries');
		ThemeManager.AddTheme(Class'ColorThemeHUD_Purple');
		ThemeManager.AddTheme(Class'ColorThemeHUD_Red');
		ThemeManager.AddTheme(Class'ColorThemeHUD_SoylentGreen');
		ThemeManager.AddTheme(Class'ColorThemeHUD_Starlight');
		ThemeManager.AddTheme(Class'ColorThemeHUD_SteelGreen');
		ThemeManager.AddTheme(Class'ColorThemeHUD_Superhero');
		ThemeManager.AddTheme(Class'ColorThemeHUD_Terminator');
		ThemeManager.AddTheme(Class'ColorThemeHUD_Violet');
	}
}
