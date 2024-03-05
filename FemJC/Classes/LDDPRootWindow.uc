//Me taking my coding discussions to other discords https://youtu.be/zk5_L11te1o
//=============================================================================
// LDDPHudShit
//=============================================================================
class LDDPRootWindow extends FemJCRootWindow;

// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------

event MutateNewChild(Window NewParent, out class<Window> DesignatedClass)
{
	local Name oldName;

	oldName = DesignatedClass.Name;

	switch (DesignatedClass.Name)
	{
		case 'HUDHitDisplay':        			DesignatedClass = Class'FemJC.LDDPHUDHitDisplay';	break;
		case 'MenuScreenNewGame':       		DesignatedClass = Class'FemJC.FemJCMenuScreenNewGame';	break;

		default:
			break;
	}	
	Super.MutateNewChild(NewParent, DesignatedClass);
}

event InitWindow()
{
	Super(RootWindow).InitWindow();

	// Initialize variables
	winCount = 0;

	actorDisplay = ActorDisplayWindow(NewChild(Class'ActorDisplayWindow'));
	actorDisplay.SetWindowAlignments(HALIGN_Full, VALIGN_Full);
	
	scopeView = DeusExScopeView(NewChild(Class'DeusExScopeView', False));
	scopeView.SetWindowAlignments(HALIGN_Full, VALIGN_Full, 0, 0);

	SetDefaultCursor(Texture'DeusExCursor1', Texture'DeusExCursor1_Shadow');

	scopeView.Lower();

	ConditionalBindMultiplayerKeys();
}

defaultproperties
{
}
