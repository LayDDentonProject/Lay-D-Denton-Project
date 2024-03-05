//=============================================================================
// DeusExRootWindowFemJC.
//=============================================================================
class DeusExRootWindowFemJC expands DeusExRootWindow;

// ----------------------------------------------------------------------
// InitWindow()
// ----------------------------------------------------------------------

event InitWindow()
{
	Super(RootWindow).InitWindow();

	// Initialize variables
	winCount = 0;

	actorDisplay = ActorDisplayWindow(NewChild(Class'ActorDisplayWindow'));
	actorDisplay.SetWindowAlignments(HALIGN_Full, VALIGN_Full);

	hud = DeusExHUDFemJC(NewChild(Class'DeusExHUDFemJC'));
	hud.UpdateSettings(DeusExPlayer(parentPawn));
	hud.SetWindowAlignments(HALIGN_Full, VALIGN_Full, 0, 0);

	scopeView = DeusExScopeView(NewChild(Class'DeusExScopeView', False));
	scopeView.SetWindowAlignments(HALIGN_Full, VALIGN_Full, 0, 0);

	SetDefaultCursor(Texture'DeusExCursor1', Texture'DeusExCursor1_Shadow');

	scopeView.Lower();

	ConditionalBindMultiplayerKeys();
}

// ----------------------------------------------------------------------
// ----------------------------------------------------------------------

defaultproperties
{
     DataVaultFunctions(0)=(winClass=Class'FemJC.PersonaScreenInventoryFemJC')
     DataVaultFunctions(1)=(winClass=Class'FemJC.PersonaScreenHealthFemJC')
     DataVaultFunctions(2)=(winClass=Class'FemJC.PersonaScreenAugmentationsFemJC')
     DataVaultFunctions(3)=(winClass=Class'FemJC.PersonaScreenSkillsFemJC')
     DataVaultFunctions(4)=(winClass=Class'FemJC.PersonaScreenGoalsFemJC')
     DataVaultFunctions(5)=(winClass=Class'FemJC.PersonaScreenConversationsFemJC')
     DataVaultFunctions(6)=(winClass=Class'FemJC.PersonaScreenImagesFemJC')
     DataVaultFunctions(7)=(winClass=Class'FemJC.PersonaScreenLogsFemJC')
}
