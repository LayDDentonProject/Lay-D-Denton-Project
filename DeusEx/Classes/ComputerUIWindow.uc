class ComputerUIWindow injects ComputerUIWindow;

function ProcessDeusExText(Name textName, optional TextWindow winText)
{
	local DeusExTextParser parser;
	local string TextPackage;
	
	local name OName;
	local bool bWon;
	
	fileIndex  = -1;
	emailIndex = -1;
	
	OName = TextName;
	//LDDP, 11/02/21: Convert usage to female text flag when female.
	if ((Player != None) && (bool(TextName)) && (Player.FlagBase != None) && (Player.FlagBase.GetBool('LDDPJCIsFemale')))
	{
		TextName = StringToName("FemJC"$String(TextName));
	}
	
	// First check to see if we have a name
	if ( textName != '' )
	{
		// Create the text parser
		parser = new(None) Class'DeusExTextParser';
		parser.SetPlayerName(player.TruePlayerName);

		if (CompOwner.IsA('Computers'))
			TextPackage = Computers(CompOwner).TextPackage;
		else
			TextPackage = "DeusExText";

		bWon = parser.OpenText(textName, TextPackage);
		if (!bWon)
		{
			bWon = parser.OpenText(OName, TextPackage);
		}
		
		// Attempt to find the text object
		if ( bWon )
		{
			while(parser.ProcessText())
				ProcessDeusExTextTag(parser, winText);

			parser.CloseText();
		}

		CriticalDelete(parser);
	}
}

