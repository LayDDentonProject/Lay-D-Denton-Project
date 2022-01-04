class InformationDevices injects InformationDevices;

var() name FemaleTextTag; //LDDP, 10/25/21: Added female equivalent text tag. Set automatically.

function CreateInfoWindow()
{
	local DeusExTextParser parser;
	local DeusExRootWindow rootWindow;
	local DeusExNote note;
	local DataVaultImage image;
	local bool bImageAdded;
	
	local name UseTextTag;
	local bool bWon;

	rootWindow = DeusExRootWindow(aReader.rootWindow);

	//LDDP, 10/25/21: Convert usage to female text flag when female.
	if ((aReader != None) && (aReader.FlagBase != None) && (aReader.FlagBase.GetBool('LDDPJCIsFemale')))
	{
		UseTextTag = FemaleTextTag;
	}
	if (!bool(UseTextTag)) UseTextTag = TextTag;
	
	// First check to see if we have a name
	if ( UseTextTag != '' )
	{
		// Create the text parser
		parser = new(None) Class'DeusExTextParser';
		
		// Attempt to find the text object
		if (aReader != None)
		{
			bWon = (parser.OpenText(UseTextTag,TextPackage));
			if (!bWon)
			{
				UseTextTag = TextTag;
				bWon = (parser.OpenText(UseTextTag,TextPackage));
			}
			
			if (bWon)
			{
				parser.SetPlayerName(aReader.TruePlayerName);
				
				infoWindow = rootWindow.hud.ShowInfoWindow();
				infoWindow.ClearTextWindows();
				
				vaultString = "";
				bFirstParagraph = True;
				
				while(parser.ProcessText())
					ProcessTag(parser);
				
				parser.CloseText();
				
				// Check to see if we need to save this string in the 
				// DataVault
				if (bAddToVault)
				{
					note = aReader.GetNote(UseTextTag);
					
					if (note == None)
					{
						note = aReader.AddNote(vaultString,, True);
						note.SetTextTag(UseTextTag);
					}
					
					vaultString = "";
				}
			}
		}
		CriticalDelete(parser);
	}

	// do we have any image data to give the player?
	if ((imageClass != None) && (aReader != None))
	{
		image = Spawn(imageClass, aReader);
		if (image != None)  
		{
			image.GiveTo(aReader);
			image.SetBase(aReader);
			bImageAdded = aReader.AddImage(image);

			// Display a note to the effect that there's an image here, 
			// but only if nothing else was displayed
			if (infoWindow == None)
			{
				infoWindow = rootWindow.hud.ShowInfoWindow();
				winText = infoWindow.AddTextWindow();
				winText.SetText(Sprintf(ImageLabel, image.imageDescription));
			}

			// Log the fact that the user just got an image.
			if (bImageAdded)
			{
				aReader.ClientMessage(Sprintf(AddedToDatavaultLabel, image.imageDescription));
			}
		}
	}
}

function PostBeginPlay()
{
	local string TS;
	
	Super.PostBeginPlay();
	
	//LDDP, 10/25/21: We now have a female text tag variable. Conjure one based off our base text flag, assuming it's not blank.
	if (bool(TextTag))
	{
		TS = "FemJC"$string(TextTag);
		SetPropertyText("FemaleTextTag", TS);
	}
}
