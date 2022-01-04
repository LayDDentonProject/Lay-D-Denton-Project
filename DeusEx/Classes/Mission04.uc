class Mission04 injects Mission04;

function Timer()
{
    local ScriptedPawn pawn;
    local PaulDenton Paul;
    
    if (localURL == "04_NYC_HOTEL")
	{
        if (!flags.GetBool('M04RaidTeleportDone') &&
			flags.GetBool('ApartmentEntered'))
		{
			if (flags.GetBool('NSFSignalSent'))
			{
				foreach AllActors(class'ScriptedPawn', pawn)
				{
					if (pawn.IsA('UNATCOTroop') || pawn.IsA('MIB'))
						pawn.EnterWorld();
					else if (pawn.IsA('SandraRenton') || pawn.IsA('GilbertRenton') || pawn.IsA('HarleyFilben'))
						pawn.LeaveWorld();
				}

				foreach AllActors(class'PaulDenton', Paul)
				{
	//LDDP, 11/3/2021 Call the FemJC version of the convo if JC is female	
					if (flags.GetBool('LDDPJCIsFemale'))
					{
						Player.StartConversationByName('FemJCTalkedToPaulAfterMessage', Paul, False, False);
					}
					else
					{
						Player.StartConversationByName('TalkedToPaulAfterMessage', Paul, False, False);
					}
					break;
				}

				flags.SetBool('M04RaidTeleportDone', True,, 5);
			}
		}
    }

    Super.Timer();
}
