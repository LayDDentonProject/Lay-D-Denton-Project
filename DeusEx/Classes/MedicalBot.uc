class MedicalBot merges MedicalBot;

function Frob(Actor Frobber, Inventory frobWith)
{
    local DeusExPlayer player;
    local DeusExRootWindow root;
    local HUDMedBotAddAugsScreen winAug;
    local HUDMedBotHealthScreen  winHealth;
    local AugmentationCannister augCan;
    
    local class<HUDMedbotAddAugsScreen> ASClass;
    local class<HUDMedbotHealthScreen> HSClass;
    local bool bFemale;
    
    Super.Frob(Frobber, frobWith);
    
    player = DeusExPlayer(Frobber);

    if (player == None)
            return;
    
    if ((Player.FlagBase != None) && (Player.FlagBase.GetBool('LDDPJCIsFemale')))
    {
        bFemale = true;
    }
       
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

            //LDDP, 10/25/21: Use female parallel windows if we can AND have to.
            //LDDP, 10/26/21: THESE ARE NOW OBSOLETE! You can ignore this class's changes entirely.
            /*if (bFemale)
            {
                ASClass = class<HUDMedbotAddAugsScreen>(DynamicLoadObject("FemJC.HUDMedBotAddAugsScreenFemJC", class'Class', false));
                HSClass = class<HUDMedbotHealthScreen>(DynamicLoadObject("FemJC.HUDMedBotHealthScreenFemJC", class'Class', false));
            }*/
            if (ASClass == None) ASClass = Class'HUDMedBotAddAugsScreen';
            if (HSClass == None) HSClass = Class'HUDMedBotHealthScreen';
    
            if (augCan != None)
            {
                winAug = HUDMedBotAddAugsScreen(root.InvokeUIScreen(ASClass, True));
                winAug.SetMedicalBot(Self, True);
            }
            else
            {
                winHealth = HUDMedBotHealthScreen(root.InvokeUIScreen(HSClass, True));
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
