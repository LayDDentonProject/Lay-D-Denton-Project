//=============================================================================
// PersonaScreenSkillsFemJC
//=============================================================================
class PersonaScreenSkillsFemJC extends PersonaScreenSkills;

// ----------------------------------------------------------------------
// CreateNavBarWindow()
// ----------------------------------------------------------------------

function CreateNavBarWindow()
{
	winNavBar = PersonaNavBarWindowFemJC(NewChild(Class'PersonaNavBarWindowFemJC'));
	winNavBar.SetPos(0, 0);
}

defaultproperties
{
}
