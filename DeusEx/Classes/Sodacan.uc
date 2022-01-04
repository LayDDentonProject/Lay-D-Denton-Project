class Sodacan injects Sodacan;

state Activated
{
	function Activate()
	{
		// can't turn it off
	}

	function BeginState()
	{
		local DeusExPlayer player;
		local Sound BurpSound;
		
		Super(DeusExPickup).BeginState();

		player = DeusExPlayer(Owner);
		if (player != None)
		{
			player.HealPlayer(2, False);

			//LDDP, 10/25/21: Load sound for burping dynamically.
			if ((Player.FlagBase != None) && (Player.FlagBase.GetBool('LDDPJCIsFemale')))
			{
				BurpSound = Sound(DynamicLoadObject("FemJC.FJCBurp", class'Sound', false));
			}
		}
		
		if (BurpSound == None) BurpSound = sound'MaleBurp';
		
		PlaySound(BurpSound);
		UseOnce();
	}
Begin:
}
