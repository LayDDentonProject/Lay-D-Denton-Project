//=============================================================================
// PersonaNavBarWindowFemJC
//=============================================================================
class PersonaNavBarWindowFemJC extends PersonaNavBarWindow;

// ----------------------------------------------------------------------
// ButtonActivated()
// ----------------------------------------------------------------------

function bool ButtonActivated( Window buttonPressed )
{
	local bool bHandled;
	local Class<PersonaScreenBaseWindow> winClass;

	bHandled = True;

	switch(buttonPressed)
	{
		case btnInventory:
			winClass = Class'PersonaScreenInventoryFemJC';
			break;

		case btnHealth:
			winClass = Class'PersonaScreenHealthFemJC';
			break;

		case btnAugs:
			winClass = Class'PersonaScreenAugmentationsFemJC';
			break;

		case btnSkills:
			winClass = Class'PersonaScreenSkillsFemJC';
			break;

		case btnGoals:
			winClass = Class'PersonaScreenGoalsFemJC';
			break;

		case btnCons:
			winClass = Class'PersonaScreenConversationsFemJC';
			break;

		case btnImages:
			winClass = Class'PersonaScreenImagesFemJC';
			break;

		case btnLogs:
			winClass = Class'PersonaScreenLogsFemJC';
			break;

		default:
			bHandled = False;
			break;
	}

	if (bHandled)
	{
		PersonaScreenBaseWindow(GetParent()).SaveSettings();
		root.InvokeUIScreen(winClass);
		return bHandled;
	}
	else
	{
		return Super(PersonaNavBarBaseWindow).ButtonActivated(buttonPressed);
	}
}

// ----------------------------------------------------------------------
// ----------------------------------------------------------------------

defaultproperties
{
}
