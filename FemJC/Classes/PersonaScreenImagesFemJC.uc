//=============================================================================
// PersonaScreenImagesFemJC
//=============================================================================
class PersonaScreenImagesFemJC extends PersonaScreenImages;

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
