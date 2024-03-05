//=============================================================================
// HUDHitDisplayFemJC
//=============================================================================
class HUDHitDisplayFemJC expands HUDHitDisplay;

// ----------------------------------------------------------------------
// InitWindow()
// ----------------------------------------------------------------------

event InitWindow()
{
	local window bodyWin;

	Super(HUDBaseWindow).InitWindow();

	bTickEnabled = True;

	Hide();

	player = DeusExPlayer(DeusExRootWindow(GetRootWindow()).parentPawn);

	SetSize(84, 106);

	CreateBodyPart(head,     Texture'HUDHitDisplay_HeadFem',     39, 17,  4,  7);
	CreateBodyPart(torso,    Texture'HUDHitDisplay_TorsoFem',    36, 25, 10,  23);
	CreateBodyPart(armLeft,  Texture'HUDHitDisplay_ArmLeftFem',  46, 27, 10,  23);
	CreateBodyPart(armRight, Texture'HUDHitDisplay_ArmRightFem', 26, 27, 10,  23);
	CreateBodyPart(legLeft,  Texture'HUDHitDisplay_LegLeftFem',  41, 44,  8,  36);
	CreateBodyPart(legRight, Texture'HUDHitDisplay_LegRightFem', 33, 44,  8,  36);

	bodyWin = NewChild(Class'Window');
	bodyWin.SetBackground(Texture'HUDHitDisplay_BodyFem');
	bodyWin.SetBackgroundStyle(DSTY_Translucent);
	bodyWin.SetConfiguration(24, 15, 34, 68);
	bodyWin.SetTileColor(colArmor);
	bodyWin.Lower();

	winEnergy = CreateProgressBar(15, 20);
	winBreath = CreateProgressBar(61, 20);

	damageFlash = 0.4;  // seconds
	healFlash   = 1.0;  // seconds
}

// ----------------------------------------------------------------------
// ----------------------------------------------------------------------

defaultproperties
{
     texBackground=Texture'FemJC.UI.HUDHitDisplayBackground_1Fem'
}
