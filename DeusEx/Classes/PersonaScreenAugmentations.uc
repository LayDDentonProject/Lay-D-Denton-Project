class PersonaScreenAugmentations merges PersonaScreenAugmentations;

var Texture AugHighlightTexturesFemale[6]; //LDDP, 10/28/21: Load these during InitWindow, please.

//LDDP, 10/28/21: Store this assessment for later.
var bool bFemale;

event InitWindow()
{
	local int i;
	local Texture TTex;
	
	Super.InitWindow();
	
	//Emergency fallback.
	for (i=0; i<ArrayCount(AugHighlightTextures); i++)
	{
		AugHighlightTexturesFemale[i] = AugHighlightTextures[i];
	}
	
	TTex = Texture(DynamicLoadObject("FemJC.AugmentationsLocationCerebralFem", class'Texture', false));
	if (TTex != None) AugHighlightTexturesFemale[0] = TTex;
	TTex = Texture(DynamicLoadObject("FemJC.AugmentationsLocationEyesFem", class'Texture', false));
	if (TTex != None) AugHighlightTexturesFemale[1] = TTex;
	TTex = Texture(DynamicLoadObject("FemJC.AugmentationsLocationTorsoFem", class'Texture', false));
	if (TTex != None) AugHighlightTexturesFemale[2] = TTex;
	TTex = Texture(DynamicLoadObject("FemJC.AugmentationsLocationArmsFem", class'Texture', false));
	if (TTex != None) AugHighlightTexturesFemale[3] = TTex;
	TTex = Texture(DynamicLoadObject("FemJC.AugmentationsLocationLegsFem", class'Texture', false));
	if (TTex != None) AugHighlightTexturesFemale[4] = TTex;
	TTex = Texture(DynamicLoadObject("FemJC.AugmentationsLocationSubdermalFem", class'Texture', false));
	if (TTex != None) AugHighlightTexturesFemale[5] = TTex;
	
	EnableButtons();
}

function CreateControls()
{
	local DeusExPlayer DXP;
	
	DXP = DeusExPlayer(GetPlayerPawn());
	if ((DXP != None) && (DXP.FlagBase != None) && (DXP.FlagBase.GetBool('LDDPJCIsFemale')))
	{
		bFemale = true;
	}

    _CreateControls();
}

function CreateAugmentationHighlights()
{
	if (bFemale)
	{
		AugHighlightWindows[0] = CreateHighlight(augHighlightTexturesFemale[0], 142,  45, 16, 19);
		AugHighlightWindows[1] = CreateHighlight(augHighlightTexturesFemale[1], 161,  63, 19, 12);
		AugHighlightWindows[2] = CreateHighlight(augHighlightTexturesFemale[2], 157, 108, 34, 48);
		AugHighlightWindows[3] = CreateHighlight(augHighlightTexturesFemale[3], 105, 110, 24, 43);
		AugHighlightWindows[4] = CreateHighlight(augHighlightTexturesFemale[4], 165, 222, 32, 94);
		AugHighlightWindows[5] = CreateHighlight(augHighlightTexturesFemale[5],  84, 160, 14, 36);
	}
	else
	{
		AugHighlightWindows[0] = CreateHighlight(augHighlightTextures[0], 142,  45, 16, 19);
		AugHighlightWindows[1] = CreateHighlight(augHighlightTextures[1], 161,  63, 19, 12);
		AugHighlightWindows[2] = CreateHighlight(augHighlightTextures[2], 157, 108, 34, 48);
		AugHighlightWindows[3] = CreateHighlight(augHighlightTextures[3], 105, 110, 24, 43);
		AugHighlightWindows[4] = CreateHighlight(augHighlightTextures[4], 165, 222, 32, 94);
		AugHighlightWindows[5] = CreateHighlight(augHighlightTextures[5],  84, 160, 14, 36);
	}
}

