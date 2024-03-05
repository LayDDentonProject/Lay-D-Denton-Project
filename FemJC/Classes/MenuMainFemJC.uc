//=============================================================================
// MenuMainFemJC
//=============================================================================
class MenuMainFemJC expands MenuMain;

// ----------------------------------------------------------------------
// StartNewGame()
// ----------------------------------------------------------------------

function StartNewGame()
{
	// Check to see if the player has already ran the training mission
	// or been prompted
	if (player.bAskedToTrain == False)
	{
		messageBoxMode = MB_AskToTrain;
		player.bAskedToTrain = True;		// Only prompt ONCE!
		player.SaveConfig();
		root.MessageBox(AskToTrainTitle, AskToTrainMessage, 0, False, Self);
	}
	else
	{
		root.InvokeMenuScreen(Class'MenuSelectDifficultyFemJC');
	}
}

// ----------------------------------------------------------------------
// ----------------------------------------------------------------------

defaultproperties
{
}
