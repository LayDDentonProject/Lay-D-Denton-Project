class JCDouble injects JCDouble;

//LDDP, 10/26/21: New skin swap code stuff.
var(LDDP) bool bMadeFemale;

function float GetDefaultCollisionHeight()
{
	if (bMadeFemale) return (Default.CollisionHeight-9.0);
	
	return (Default.CollisionHeight-4.5);
}

//
// JC's cinematic stunt double!
//
function SetSkin(DeusExPlayer player)
{
	local int i;
	local Texture TTex;
	local class<DeusExCarcass> TCarc;
	
	if (Player != None)
	{	
		//LDDP, load and update our female flag accordingly.
		if ((Player.FlagBase != None) && (Player.FlagBase.GetBool('LDDPJCIsFemale')))
		{
			bMadeFemale = true;
		}
		
		//LDDP, 10/26/21: A bunch of annoying bullshit with branching appearance for JC... But luckily, it works well.
		if (bMadeFemale)
		{
			TTex = Texture(DynamicLoadObject("FemJC.JCDentonFemaleTex2", class'Texture', false));
			if (TTex != None) MultiSkins[1] = TTex;
			TTex = Texture(DynamicLoadObject("FemJC.JCDentonFemaleTex3", class'Texture', false));
			if (TTex != None) MultiSkins[2] = TTex;
			TTex = Texture(DynamicLoadObject("FemJC.JCDentonFemaleTex0", class'Texture', false));
			if (TTex != None) MultiSkins[3] = TTex;
			TTex = Texture(DynamicLoadObject("FemJC.JCDentonFemaleTex1", class'Texture', false));
			if (TTex != None) MultiSkins[4] = TTex;
			TTex = Texture(DynamicLoadObject("FemJC.JCDentonFemaleTex2", class'Texture', false));
			if (TTex != None) MultiSkins[5] = TTex;
			MultiSkins[6] = Texture'DeusExCharacters.Skins.FramesTex4';
			MultiSkins[7] = Texture'DeusExCharacters.Skins.LensesTex5';	
			Mesh = LodMesh'GFM_Trench';
			
			ResetBasedPawnSize();
			BaseEyeHeight = CollisionHeight - (GetDefaultCollisionHeight() - Default.BaseEyeHeight) - 2.0;
			bIsFemale = true;
			
			TCarc = class<DeusExCarcass>(DynamicLoadObject("FemJC.JCDentonFemaleCarcass", class'Class', false));
			if (TCarc != None) CarcassType = TCarc;
			
			switch(Player.PlayerSkin)
			{
				case 0:
					TTex = Texture(DynamicLoadObject("FemJC.JCDentonFemaleTex0", class'Texture', false));
					if (TTex != None) MultiSkins[0] = TTex;
				break;
				case 1:
					TTex = Texture(DynamicLoadObject("FemJC.JCDentonFemaleTex4", class'Texture', false));
					if (TTex != None) MultiSkins[0] = TTex;
				break;
				case 2:
					TTex = Texture(DynamicLoadObject("FemJC.JCDentonFemaleTex5", class'Texture', false));
					if (TTex != None) MultiSkins[0] = TTex;
				break;
				case 3:
					TTex = Texture(DynamicLoadObject("FemJC.JCDentonFemaleTex6", class'Texture', false));
					if (TTex != None) MultiSkins[0] = TTex;
				break;
				case 4:
					TTex = Texture(DynamicLoadObject("FemJC.JCDentonFemaleTex7", class'Texture', false));
					if (TTex != None) MultiSkins[0] = TTex;
				break;
			}
		}
		else
		{
			for (i=1; i<ArrayCount(Multiskins); i++)
			{
				MultiSkins[i] = Default.Multiskins[i];
			}
			Mesh = Default.Mesh;
			
			ResetBasedPawnSize();
			BaseEyeHeight = CollisionHeight - (GetDefaultCollisionHeight() - Default.BaseEyeHeight);
			bIsFemale = false;
			CarcassType = Default.CarcassType;
			
			switch(Player.PlayerSkin)
			{
				case 0:
					MultiSkins[0] = Texture'JCDentonTex0';
				break;
				case 1:
					MultiSkins[0] = Texture'JCDentonTex4';
				break;
				case 2:
					MultiSkins[0] = Texture'JCDentonTex5';
				break;
				case 3:
					MultiSkins[0] = Texture'JCDentonTex6';
				break;
				case 4:
					MultiSkins[0] = Texture'JCDentonTex7';
				break;
			}
		}
	}
}
