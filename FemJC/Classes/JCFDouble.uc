//Deus Ex Dark Age Ending https://www.youtube.com/watch?v=4IovBIfcg5U
//=============================================================================
// JCFDouble.
//=============================================================================
class JCFDouble extends HumanMilitary;


function ImpartMomentum(Vector momentum, Pawn instigatedBy)
{
	// to ensure JC's understudy doesn't get impact momentum from damage...
}

function AddVelocity( vector NewVelocity)
{
}

// ----------------------------------------------------------------------
// SetSkin()
// ----------------------------------------------------------------------

function SetSkin(DeusExPlayer player)
{
	if (player != None)
	{
		switch(player.PlayerSkin)
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
}



// ----------------------------------------------------------------------
// ----------------------------------------------------------------------

defaultproperties
{
     CarcassType=Class'FemJC.JCDentonFemaleCarcass'
     WalkingSpeed=0.120000
     bInvincible=True
     BaseAssHeight=-23.000000
     Mesh=LodMesh'DeusExCharacters.GFM_Trench'
     MultiSkins(0)=Texture'FemJC.Characters.JCDentonFemaleTex0'
     MultiSkins(1)=Texture'FemJC.Characters.JCDentonFemaleTex2'
     MultiSkins(2)=Texture'FemJC.Characters.JCDentonFemaleTex3'
     MultiSkins(3)=Texture'FemJC.Characters.JCDentonFemaleTex0'
     MultiSkins(4)=Texture'FemJC.Characters.JCDentonFemaleTex1'
     MultiSkins(5)=Texture'FemJC.Characters.JCDentonFemaleTex2'
     MultiSkins(6)=Texture'DeusExCharacters.Skins.FramesTex4'
     MultiSkins(7)=Texture'DeusExCharacters.Skins.LensesTex5'
     CollisionRadius=20.000000
     CollisionHeight=43.000000
     BindName="JCDenton"
     FamiliarName="JC Denton"
     UnfamiliarName="JC Denton"
}
