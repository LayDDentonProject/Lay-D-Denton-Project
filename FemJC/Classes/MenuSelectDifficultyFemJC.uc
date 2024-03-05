//=============================================================================
// MenuSelectDifficultyFemJC
//=============================================================================
class MenuSelectDifficultyFemJC expands MenuSelectDifficulty;

// ----------------------------------------------------------------------
// InvokeNewGameScreen()
// ----------------------------------------------------------------------

function InvokeNewGameScreen(float difficulty)
{
	local MenuScreenNewGameFemJC newGame;

	newGame = MenuScreenNewGameFemJC(root.InvokeMenuScreen(Class'MenuScreenNewGameFemJC'));

	if (newGame != None)
		newGame.SetDifficulty(difficulty);
}

// ----------------------------------------------------------------------
// ----------------------------------------------------------------------

defaultproperties
{
}
