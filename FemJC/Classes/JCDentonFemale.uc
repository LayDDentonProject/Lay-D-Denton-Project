//When my friends see this code https://youtu.be/X9EsK9-u9xM
//=============================================================================
// JCDentonFemale.
//=============================================================================
class JCDentonFemale extends FemJC.FHuman;

// ----------------------------------------------------------------------
// TravelPostAccept()
// ----------------------------------------------------------------------

event TravelPostAccept()
{
	local DeusExLevelInfo info;

	Super.TravelPostAccept();

	switch(PlayerSkin)
	{
			case 0:	
				MultiSkins[0] = Texture'JCDentonFemaleTex0';
				MultiSkins[1]=Texture'JCDentonFemaleTex2';
				MultiSkins[2]=Texture'JCDentonFemaleTex3';
				MultiSkins[3]=Texture'JCDentonFemaleTex0';
				MultiSkins[4]=Texture'JCDentonFemaleTex1';
				MultiSkins[5]=Texture'JCDentonFemaleTex2';
				MultiSkins[6]=Texture'DeusExCharacters.Skins.FramesTex4';
				MultiSkins[7]=Texture'DeusExCharacters.Skins.LensesTex5';
				Mesh = LodMesh'GFM_Trench';
				break;
			case 1:	
				MultiSkins[0] = Texture'JCDentonFemaleTex4';
				MultiSkins[1]=Texture'JCDentonFemaleTex2';
				MultiSkins[2]=Texture'JCDentonFemaleTex3';
				MultiSkins[3]=Texture'JCDentonFemaleTex0';
				MultiSkins[4]=Texture'JCDentonFemaleTex1';
				MultiSkins[5]=Texture'JCDentonFemaleTex2';
				MultiSkins[6]=Texture'DeusExCharacters.Skins.FramesTex4';
				MultiSkins[7]=Texture'DeusExCharacters.Skins.LensesTex5';	
				Mesh = LodMesh'GFM_Trench';
				break;
			case 2:	
				MultiSkins[0] = Texture'JCDentonFemaleTex5';
				MultiSkins[1]=Texture'JCDentonFemaleTex2';
				MultiSkins[2]=Texture'JCDentonFemaleTex3';
				MultiSkins[3]=Texture'JCDentonFemaleTex0';
				MultiSkins[4]=Texture'JCDentonFemaleTex1';
				MultiSkins[5]=Texture'JCDentonFemaleTex2';
				MultiSkins[6]=Texture'DeusExCharacters.Skins.FramesTex4';
				MultiSkins[7]=Texture'DeusExCharacters.Skins.LensesTex5';		
				Mesh = LodMesh'GFM_Trench';
				break;
			case 3:
				MultiSkins[0] = Texture'JCDentonFemaleTex6';
				MultiSkins[1]=Texture'JCDentonFemaleTex2';
				MultiSkins[2]=Texture'JCDentonFemaleTex3';
				MultiSkins[3]=Texture'JCDentonFemaleTex0';
				MultiSkins[4]=Texture'JCDentonFemaleTex1';
				MultiSkins[5]=Texture'JCDentonFemaleTex2';
				MultiSkins[6]=Texture'DeusExCharacters.Skins.FramesTex4';
				MultiSkins[7]=Texture'DeusExCharacters.Skins.LensesTex5';	
				Mesh = LodMesh'GFM_Trench';
				break;
			case 4:			
				MultiSkins[0] = Texture'JCDentonFemaleTex7';
				MultiSkins[1]=Texture'JCDentonFemaleTex2';
				MultiSkins[2]=Texture'JCDentonFemaleTex3';
				MultiSkins[3]=Texture'JCDentonFemaleTex0';
				MultiSkins[4]=Texture'JCDentonFemaleTex1';
				MultiSkins[5]=Texture'JCDentonFemaleTex2';
				MultiSkins[6]=Texture'DeusExCharacters.Skins.FramesTex4';
				MultiSkins[7]=Texture'DeusExCharacters.Skins.LensesTex5';
				Mesh = LodMesh'GFM_Trench';
				break;
	}
}

// ----------------------------------------------------------------------
// RenderOverlays()
// render our in-hand object
// ----------------------------------------------------------------------

simulated event RenderOverlays( canvas Canvas )
{
    local int i;
    local Texture OldMultiskins[8];
    
    if ((inHand != None) && (inHand.Mesh == inHand.PlayerViewMesh))
    {
        for (i=0;i<8;i++)
        {
            OldMultiskins[i] = InHand.Multiskins[i];
            
            if (inHand.GetMeshTexture(i) == Texture'WeaponHandsTex')
            {
               if (PlayerSkin == 0)
			    {
					inHand.Multiskins[i] = Texture'WeaponHandsTex0Fem';
				}
				else if (PlayerSkin == 1)
				{
					inHand.Multiskins[i] = Texture'WeaponHandsTex4Fem';
				}
				else if (PlayerSkin == 2)
				{
					inHand.Multiskins[i] = Texture'WeaponHandsTex5Fem';
				}
				else if (PlayerSkin == 3)
				{
					inHand.Multiskins[i] = Texture'WeaponHandsTex6Fem';
				}
				else if (PlayerSkin == 4)
				{
					inHand.Multiskins[i] = Texture'WeaponHandsTex7Fem';
				}
            }
            else if (inHand.GetMeshTexture(i) == Texture'MiniCrossbowTex1')
            {
                if (PlayerSkin == 0)
				{
					inHand.Multiskins[i] = Texture'MiniCrossbowTex0Fem';
				}
				else if (PlayerSkin == 1)
				{
					inHand.Multiskins[i] = Texture'MiniCrossbowTex4Fem';
				}
				else if (PlayerSkin == 2)
				{
					inHand.Multiskins[i] = Texture'MiniCrossbowTex5Fem';
				}
				else if (PlayerSkin == 3)
				{
					inHand.Multiskins[i] = Texture'MiniCrossbowTex6Fem';
				}
				else if (PlayerSkin == 4)
				{
					inHand.Multiskins[i] = Texture'MiniCrossbowTex7Fem';
				}
            }
        }
    }
    
    Super.RenderOverlays(Canvas);
    
    if ((inHand != None) && (inHand.Mesh == inHand.PlayerViewMesh))
    {
        for (i=0;i<8;i++)
        {
            InHand.Multiskins[i] = OldMultiskins[i];
        }
    }
}


// ----------------------------------------------------------------------
// ShowInventoryWindow()
// ----------------------------------------------------------------------

exec function ShowInventoryWindow()
{
	local bool OldCheat;
	
	if (RestrictInput())
		return;
	
   	if ((Level.NetMode != NM_Standalone) && (bBeltIsMPInventory))
   	{
      		ClientMessage("Inventory screen disabled in multiplayer");
      		return;
   	}
	
	DeusExRootWindow(RootWindow).InvokeUIScreen(Class'PersonaScreenInventoryFemJC', False);
}

// ----------------------------------------------------------------------
// ShowSkillsWindow()
// ----------------------------------------------------------------------

exec function ShowSkillsWindow()
{
	if (RestrictInput())
		return;
	
   	if ((Level.NetMode != NM_Standalone) && (bBeltIsMPInventory))
   	{
      		ClientMessage("Skills screen disabled in multiplayer");
      		return;
   	}
	
   	InvokeUIScreen(Class'PersonaScreenSkillsFemJC');
}

// ----------------------------------------------------------------------
// ShowHealthWindow()
// ----------------------------------------------------------------------

exec function ShowHealthWindow()
{
	if (RestrictInput())
		return;
	
   	if ((Level.NetMode != NM_Standalone) && (bBeltIsMPInventory))
   	{
      		ClientMessage("Health screen disabled in multiplayer");
      		return;
   	}
	
   	InvokeUIScreen(Class'PersonaScreenHealthFemJC');
}

// ----------------------------------------------------------------------
// ShowImagesWindow()
// ----------------------------------------------------------------------

exec function ShowImagesWindow()
{
	if (RestrictInput())
		return;
	
   	if ((Level.NetMode != NM_Standalone) && (bBeltIsMPInventory))
   	{
      		ClientMessage("Images screen disabled in multiplayer");
      		return;
   	}
	
   	InvokeUIScreen(Class'PersonaScreenImagesFemJC');
}

// ----------------------------------------------------------------------
// ShowConversationsWindow()
// ----------------------------------------------------------------------

exec function ShowConversationsWindow()
{
	if (RestrictInput())
		return;
	
   	if ((Level.NetMode != NM_Standalone) && (bBeltIsMPInventory))
   	{
      		ClientMessage("Conversations screen disabled in multiplayer");
      		return;
   	}
   	
   	InvokeUIScreen(Class'PersonaScreenConversationsFemJC');
}

// ----------------------------------------------------------------------
// ShowAugmentationsWindow()
// ----------------------------------------------------------------------

exec function ShowAugmentationsWindow()
{
	if (RestrictInput())
		return;
	
   	if ((Level.NetMode != NM_Standalone) && (bBeltIsMPInventory))
   	{
      		ClientMessage("Augmentations screen disabled in multiplayer");
      		return;
   	}
	
   	InvokeUIScreen(Class'PersonaScreenAugmentationsFemJC');
}

// ----------------------------------------------------------------------
// ShowGoalsWindow()
// ----------------------------------------------------------------------

exec function ShowGoalsWindow()
{
	if (RestrictInput())
		return;
	
   	if ((Level.NetMode != NM_Standalone) && (bBeltIsMPInventory))
   	{
      		ClientMessage("Goals screen disabled in multiplayer");
      		return;
   	}
   	
   	InvokeUIScreen(Class'PersonaScreenGoalsFemJC');
}

// ----------------------------------------------------------------------
// ShowLogsWindow()
// ----------------------------------------------------------------------

exec function ShowLogsWindow()
{
	if (RestrictInput())
		return;
	
   	if ((Level.NetMode != NM_Standalone) && (bBeltIsMPInventory))
   	{
      		ClientMessage("Logs screen disabled in multiplayer");
      		return;
   	}
	
   	InvokeUIScreen(Class'PersonaScreenLogsFemJC');
}

// ----------------------------------------------------------------------
// ShowAugmentationAddWindow()
// ----------------------------------------------------------------------

exec function ShowAugmentationAddWindow()
{
	if (!bCheatsEnabled)
		return;

	if ((Level.NetMode != NM_Standalone) && (bBeltIsMPInventory))
	{
		ClientMessage("Screen disabled in multiplayer");
		return;
	}

	InvokeUIScreen(Class'HUDMedBotAddAugsScreenFemJC');
}

// ----------------------------------------------------------------------
// ShowMainMenu()
// ----------------------------------------------------------------------

exec function ShowMainMenu()
{
	local DeusExRootWindow root;
	local DeusExLevelInfo info;
	local MissionEndgame Script;

	if (bIgnoreNextShowMenu)
	{
		bIgnoreNextShowMenu = False;
		return;
	}

	info = GetLevelInfo();

	// Special case baby!
	// 
	// If the Intro map is loaded and we get here, that means the player
	// pressed Escape and we want to either A) start a new game 
	// or B) return to the dx.dx screen.  Either way we're going to 
	// abort the Intro by doing this. 
	//
	// If this is one of the Endgames (which have a mission # of 99)
	// then we also want to call the Endgame's "FinishCinematic" 
	// function

	// force the texture caches to flush
	ConsoleCommand("FLUSH");

	if ((info != None) && (info.MissionNumber == 98)) 
	{
		bIgnoreNextShowMenu = True;
		PostIntro();
	}
	else if ((info != None) && (info.MissionNumber == 99))
	{
		foreach AllActors(class'MissionEndgame', Script)
			break;

		if (Script != None)
			Script.FinishCinematic();
	}
	else
	{
		root = DeusExRootWindow(rootWindow);
		if (root != None)
			root.InvokeMenu(Class'MenuMainFemJC');
	}
}

// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------

defaultproperties
{
     CarcassType=Class'FemJC.JCDentonFemaleCarcass'
     JumpSound=Sound'FemJC.Player.FJCJump'
     BaseEyeHeight=38.000000
     HitSound1=Sound'FemJC.Player.FJCPainSmall'
     HitSound2=Sound'FemJC.Player.FJCPainMedium'
     Land=Sound'FemJC.Player.FJCLand'
     Die=Sound'FemJC.Player.FJCDeath'
     Mesh=LodMesh'DeusExCharacters.GFM_Trench'
     MultiSkins(0)=Texture'FemJC.Characters.JCDentonFemaleTex0'
     MultiSkins(1)=Texture'FemJC.Characters.JCDentonFemaleTex2'
     MultiSkins(2)=Texture'FemJC.Characters.JCDentonFemaleTex3'
     MultiSkins(3)=Texture'FemJC.Characters.JCDentonFemaleTex0'
     MultiSkins(4)=Texture'FemJC.Characters.JCDentonFemaleTex1'
     MultiSkins(5)=Texture'FemJC.Characters.JCDentonFemaleTex2'
     MultiSkins(6)=Texture'DeusExCharacters.Skins.FramesTex4'
     MultiSkins(7)=Texture'DeusExCharacters.Skins.LensesTex5'
     CollisionHeight=43.000000
}
