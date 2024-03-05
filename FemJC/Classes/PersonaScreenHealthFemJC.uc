//=============================================================================
// PersonaScreenHealthFemJC
//=============================================================================
class PersonaScreenHealthFemJC extends PersonaScreenHealth;

// ----------------------------------------------------------------------
// CreateNavBarWindow()
// ----------------------------------------------------------------------

function CreateNavBarWindow()
{
	winNavBar = PersonaNavBarBaseWindow(NewChild(Class'PersonaNavBarWindowFemJC'));
	winNavBar.SetPos(0, 0);
}

// ----------------------------------------------------------------------
// CreateBodyWindow()
// ----------------------------------------------------------------------

function CreateBodyWindow()
{
	winBody = PersonaHealthBodyWindow(winClient.NewChild(Class'PersonaHealthBodyWindowFemJC'));
	winBody.SetPos(24, 36);
	winBody.Lower();
}

// ----------------------------------------------------------------------
// CreateOverlaysWindow()
// ----------------------------------------------------------------------

function CreateOverlaysWindow()
{
	winOverlays = PersonaOverlaysWindow(winClient.NewChild(Class'PersonaHealthOverlaysWindowFemJC'));
	winOverlays.SetPos(24, 36);
	winOverlays.Lower();
}

// ----------------------------------------------------------------------
// ----------------------------------------------------------------------

defaultproperties
{
}
