//=============================================================================
// PersonaScreenGoalsFemJC
//=============================================================================
class PersonaScreenGoalsFemJC extends PersonaScreenGoals;

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
