//=============================================================================
// MedicalBotFemJC.
//=============================================================================
class MedicalBotFemJC extends MedicalBot;

// ----------------------------------------------------------------------
// Frob()
//
// Invoke the Augmentation Upgrade 
// ----------------------------------------------------------------------

function Frob(Actor Frobber, Inventory frobWith)
{
   	local DeusExPlayer player;
	local DeusExRootWindow root;
	local HUDMedBotAddAugsScreenFemJC winAug;
	local HUDMedBotHealthScreenFemJC  winHealth;
	local AugmentationCannister augCan;
	
   	Super.Frob(Frobber, frobWith);
   	
   	player = DeusExPlayer(Frobber);
	
   	if ((player == None) || (EMPHitPoints <= 0)) //MADDERS: Stop us from being used if EMP'd.
      		return;
   	
   	// DEUS_EX AMSD  In multiplayer, don't pop up the window, just use them
   	// In singleplayer, do the old thing.  
   	if (Level.NetMode == NM_Standalone)
   	{
      		root = DeusExRootWindow(player.rootWindow);
      		if (root != None)
      		{
        		// First check to see if the player has any augmentation cannisters.
        		// If so, then we'll pull up the Add Augmentations screen.  
        		// Otherwise pull up the Health screen first.
        		
        		augCan = AugmentationCannister(player.FindInventoryType(Class'AugmentationCannister'));
        	
        		if (augCan != None)
        		{
           			winAug = HUDMedBotAddAugsScreenFemJC(root.InvokeUIScreen(Class'HUDMedBotAddAugsScreenFemJC', True));
           			winAug.SetMedicalBot(Self, True);
        		}
        		else
        		{
           			winHealth = HUDMedBotHealthScreenFemJC(root.InvokeUIScreen(Class'HUDMedBotHealthScreenFemJC', True));
          			winHealth.SetMedicalBot(Self, True);
        		}
        		root.MaskBackground(True);
      		}
   	}
   	else
   	{
     		if (CanHeal())
      		{
			if ( Level.NetMode != NM_Standalone )
			{
				PlaySound(sound'MedicalHiss', SLOT_None,,, 256);
				if ( Frobber.IsA('DeusExPlayer') )
				{
					DeusExPlayer(Frobber).StopPoison();
					DeusExPlayer(Frobber).ExtinguishFire();
					DeusExPlayer(Frobber).drugEffectTimer = 0;
				}
			}
         		HealPlayer(DeusExPlayer(Frobber));
      		}
      		else
      		{
         		Pawn(Frobber).ClientMessage("Medbot still charging, "$int(healRefreshTime - (Level.TimeSeconds - lastHealTime))$" seconds to go.");
      		}
   	}   
}


// ----------------------------------------------------------------------
// ----------------------------------------------------------------------

defaultproperties
{
}
