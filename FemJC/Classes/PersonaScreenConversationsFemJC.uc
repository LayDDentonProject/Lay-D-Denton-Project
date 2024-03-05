//=============================================================================
// PersonaScreenConversationsFemJC
//=============================================================================
class PersonaScreenConversationsFemJC extends PersonaScreenConversations;

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
