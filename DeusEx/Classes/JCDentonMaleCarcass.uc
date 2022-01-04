class JCDentonMaleCarcass injects JCDentonMaleCarcass;

function SetSkin(DeusExPlayer player)
{
	local int i;
	local bool bFemale;
	local Texture TTex;
	
	if (Player != None)
	{	
		//LDDP, load and update our female flag accordingly.
		if ((Player.FlagBase != None) && (Player.FlagBase.GetBool('LDDPJCIsFemale')))
		{
			bFemale = true;
		}
		
		//LDDP, 10/26/21: A bunch of annoying bullshit with branching appearance for JC... But luckily, it works well.
		if (bFemale)
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
			if (Mesh == Mesh2)
			{
				Mesh = LodMesh'DeusExCharacters.GM_Trench_CarcassB';
			}
			else if (Mesh == Mesh3)
			{
				Mesh = LodMesh'DeusExCharacters.GM_Trench_CarcassC';
			}
			else
			{
				Mesh = LodMesh'DeusExCharacters.GM_Trench_Carcass';
			}
			
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
