//=============================================================================
// PersonaScreenLogsFemJC
//=============================================================================
class PersonaScreenLogsFemJC extends PersonaScreenLogs;

// ----------------------------------------------------------------------
// CreateNavBarWindow()
// ----------------------------------------------------------------------

function CreateNavBarWindow()
{
	winNavBar = PersonaNavBarWindowFemJC(NewChild(Class'PersonaNavBarWindowFemJC'));
	winNavBar.SetPos(0, 0);
}

// ----------------------------------------------------------------------
// ----------------------------------------------------------------------

defaultproperties
{
}
