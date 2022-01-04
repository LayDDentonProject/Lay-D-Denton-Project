class MissionEndgame injects MissionEndgame;

var name TarEndgameConvo; //LDDP, 11/3/21: Store this so we can execute once flags are here and ready.
var float DelayTimer;

function FirstFrame()
{
	Super(MissionScript).FirstFrame();

	endgameTimer = 0.0;

	if (Player != None)
	{
		TarEndgameConvo = 'Barf';
		DelayTimer = 0.05;
		
		//LDDP, 11/3/21: Barf.
		//Player.StartConversationByName(UseConvo, Player, False, True);
		
		// Make sure all the flags are deleted.
		//DeusExRootWindow(Player.rootWindow).ResetFlags();
		
		// turn down the sound so we can hear the speech
		savedSoundVolume = SoundVolume;
		SoundVolume = 32;
		Player.SetInstantSoundVolume(SoundVolume);
	}
}

function Tick(float DT)
{
	local bool bFemale;
	local name UseConvo;
	
	Super.Tick(DT);
	
	//LDDP, 11/3/21: Barf, part 2.
	if (TarEndgameConvo == 'Barf')
	{
		if (DelayTimer > 0)
		{
			DelayTimer -= DT;
		}
		else
		{
			//LDDP, 10/26/21: Parse this on the fly, and reset flags AFTER playing the right conversation, NOT before.
			//if ((Player.FlagBase != None) && (Player.FlagBase.GetBool('LDDPJCIsFemale')))
			if ((Human(Player) != None) && (Human(Player).bMadeFemale))
			{
				bFemale = true;
			}
			
			// Start the conversation
			switch(LocalURL)
			{
				case "ENDGAME1":
					UseConvo = 'Endgame1';
					if (bFemale) UseConvo = 'FemJCEndgame1';
				break;
				case "ENDGAME2":
					UseConvo = 'Endgame2';
					if (bFemale) UseConvo = 'FemJCEndgame2';
				break;
				case "ENDGAME3":
					UseConvo = 'Endgame3';
					if (bFemale) UseConvo = 'FemJCEndgame3';
				break;
			}
			TarEndgameConvo = UseConvo;
			
			Player.StartConversationByName(TarEndgameConvo, Player, False, True);
			
			//LDDP, 11/3/21: Make sure all the flags are deleted, now that flags manager is here.
			DeusExRootWindow(Player.rootWindow).ResetFlags();
		}
	}
}

