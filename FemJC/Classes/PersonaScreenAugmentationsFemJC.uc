//=============================================================================
// PersonaScreenAugmentationsFemJC
//=============================================================================
class PersonaScreenAugmentationsFemJC extends PersonaScreenAugmentations;

// ----------------------------------------------------------------------
// CreateNavBarWindow()
// ----------------------------------------------------------------------

function CreateNavBarWindow()
{
	winNavBar = PersonaNavBarWindowFemJC(NewChild(Class'PersonaNavBarWindowFemJC'));
	winNavBar.SetPos(0, 0);
}

// ----------------------------------------------------------------------
// CreateBodyWindow()
// ----------------------------------------------------------------------

function CreateBodyWindow()
{
	winBody = PersonaAugmentationBodyWindowFemJC(winClient.NewChild(Class'PersonaAugmentationBodyWindowFemJC'));
	winBody.SetPos(72, 28);
	winBody.Lower();
}

// ----------------------------------------------------------------------
// CreateOverlaysWindow()
// ----------------------------------------------------------------------

function CreateOverlaysWindow()
{
	winOverlays = PersonaAugmentationOverlaysWindowFemJC(winClient.NewChild(Class'PersonaAugmentationOverlaysWindowFemJC'));
	winOverlays.SetPos(72, 28);
	winOverlays.Lower();
}

// ----------------------------------------------------------------------
// CreateAugmentationHighlights()
// ----------------------------------------------------------------------

function CreateAugmentationHighlights()
{
	augHighlightWindows[0] = CreateHighlight(augHighlightTextures[0], 142,  45, 16, 19);
	augHighlightWindows[1] = CreateHighlight(augHighlightTextures[1], 161,  63, 19, 12);
	augHighlightWindows[2] = CreateHighlight(augHighlightTextures[2], 157, 108, 34, 48);
	augHighlightWindows[3] = CreateHighlight(augHighlightTextures[3], 105, 110, 24, 43);
	augHighlightWindows[4] = CreateHighlight(augHighlightTextures[4], 165, 222, 32, 94);
	augHighlightWindows[5] = CreateHighlight(augHighlightTextures[5],  84, 160, 14, 36);
}

defaultproperties
{
     augHighlightTextures(0)=Texture'FemJC.UI.AugmentationsLocationCerebralFem'
     augHighlightTextures(1)=Texture'FemJC.UI.AugmentationsLocationEyesFem'
     augHighlightTextures(2)=Texture'FemJC.UI.AugmentationsLocationTorsoFem'
     augHighlightTextures(3)=Texture'FemJC.UI.AugmentationsLocationArmsFem'
     augHighlightTextures(4)=Texture'FemJC.UI.AugmentationsLocationLegsFem'
     augHighlightTextures(5)=Texture'FemJC.UI.AugmentationsLocationSubdermalFem'
}
