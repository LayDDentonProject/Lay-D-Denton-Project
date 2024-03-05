//My code be like: https://youtu.be/YkaMPgoUjdE
//=============================================================================
// JCDentonFemaleCarcass.
//=============================================================================
class JCDentonFemaleCarcass extends DeusExCarcass;

// ----------------------------------------------------------------------
// PostPostBeginPlay()
// ----------------------------------------------------------------------

function PostPostBeginPlay()
{
	local DeusExPlayer player;

	Super.PostPostBeginPlay();

	foreach AllActors(class'DeusExPlayer', player)
		break;

	SetSkin(player);
	
	
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
				MultiSkins[4]=Texture'FemJC.JCDentonFemaleTex1';
				MultiSkins[5]=Texture'JCDentonFemaleTex2';
				MultiSkins[6]=Texture'DeusExCharacters.Skins.FramesTex4';
				MultiSkins[7]=Texture'DeusExCharacters.Skins.LensesTex5';
				Mesh = LodMesh'DeusExCharacters.GFM_Trench_Carcass';
				Mesh2 = LodMesh'DeusExCharacters.GFM_Trench_CarcassB';
				Mesh3 = LodMesh'DeusExCharacters.GFM_Trench_CarcassC';
				break;
			case 1:	
				MultiSkins[0] = Texture'JCDentonFemaleTex4';
				MultiSkins[1]=Texture'JCDentonFemaleTex2';
				MultiSkins[2]=Texture'JCDentonFemaleTex3';
				MultiSkins[3]=Texture'JCDentonFemaleTex0';
				MultiSkins[4]=Texture'FemJC.JCDentonFemaleTex1';
				MultiSkins[5]=Texture'JCDentonFemaleTex2';
				MultiSkins[6]=Texture'DeusExCharacters.Skins.FramesTex4';
				MultiSkins[7]=Texture'DeusExCharacters.Skins.LensesTex5';	
				Mesh = LodMesh'DeusExCharacters.GFM_Trench_Carcass';
				Mesh2 = LodMesh'DeusExCharacters.GFM_Trench_CarcassB';
				Mesh3 = LodMesh'DeusExCharacters.GFM_Trench_CarcassC';
				break;
			case 2:	
				MultiSkins[0] = Texture'JCDentonFemaleTex5';
				MultiSkins[1]=Texture'JCDentonFemaleTex2';
				MultiSkins[2]=Texture'JCDentonFemaleTex3';
				MultiSkins[3]=Texture'JCDentonFemaleTex0';
				MultiSkins[4]=Texture'FemJC.JCDentonFemaleTex1';
				MultiSkins[5]=Texture'JCDentonFemaleTex2';
				MultiSkins[6]=Texture'DeusExCharacters.Skins.FramesTex4';
				MultiSkins[7]=Texture'DeusExCharacters.Skins.LensesTex5';		
				Mesh = LodMesh'DeusExCharacters.GFM_Trench_Carcass';
				Mesh2 = LodMesh'DeusExCharacters.GFM_Trench_CarcassB';
				Mesh3 = LodMesh'DeusExCharacters.GFM_Trench_CarcassC';
				break;
			case 3:
				MultiSkins[0] = Texture'JCDentonFemaleTex6';
				MultiSkins[1]=Texture'JCDentonFemaleTex2';
				MultiSkins[2]=Texture'JCDentonFemaleTex3';
				MultiSkins[3]=Texture'JCDentonFemaleTex0';
				MultiSkins[4]=Texture'FemJC.JCDentonFemaleTex1';
				MultiSkins[5]=Texture'JCDentonFemaleTex2';
				MultiSkins[6]=Texture'DeusExCharacters.Skins.FramesTex4';
				MultiSkins[7]=Texture'DeusExCharacters.Skins.LensesTex5';		
				Mesh = LodMesh'DeusExCharacters.GFM_Trench_Carcass';
				Mesh2 = LodMesh'DeusExCharacters.GFM_Trench_CarcassB';
				Mesh3 = LodMesh'DeusExCharacters.GFM_Trench_CarcassC';
				break;
			case 4:			
				MultiSkins[0] = Texture'JCDentonFemaleTex7';
				MultiSkins[1]=Texture'JCDentonFemaleTex2';
				MultiSkins[2]=Texture'JCDentonFemaleTex3';
				MultiSkins[3]=Texture'JCDentonFemaleTex0';
				MultiSkins[4]=Texture'FemJC.JCDentonFemaleTex1';
				MultiSkins[5]=Texture'JCDentonFemaleTex2';
				MultiSkins[6]=Texture'DeusExCharacters.Skins.FramesTex4';
				MultiSkins[7]=Texture'DeusExCharacters.Skins.LensesTex5';
				Mesh = LodMesh'DeusExCharacters.GFM_Trench_Carcass';
				Mesh2 = LodMesh'DeusExCharacters.GFM_Trench_CarcassB';
				Mesh3 = LodMesh'DeusExCharacters.GFM_Trench_CarcassC';
				break;
		}
	}
}

// ----------------------------------------------------------------------
// ----------------------------------------------------------------------

defaultproperties
{
     Mesh2=LodMesh'DeusExCharacters.GFM_Trench_CarcassB'
     Mesh3=LodMesh'DeusExCharacters.GFM_Trench_CarcassC'
     Mesh=LodMesh'DeusExCharacters.GFM_Trench_Carcass'
     MultiSkins(0)=Texture'FemJC.Characters.JCDentonFemaleTex0'
     MultiSkins(1)=Texture'FemJC.Characters.JCDentonFemaleTex2'
     MultiSkins(2)=Texture'FemJC.Characters.JCDentonFemaleTex3'
     MultiSkins(3)=Texture'FemJC.Characters.JCDentonFemaleTex0'
     MultiSkins(4)=Texture'FemJC.Characters.JCDentonFemaleTex1'
     MultiSkins(5)=Texture'FemJC.Characters.JCDentonFemaleTex2'
     MultiSkins(6)=Texture'DeusExCharacters.Skins.FramesTex4'
     MultiSkins(7)=Texture'DeusExCharacters.Skins.LensesTex5'
     CollisionRadius=40.000000
}
