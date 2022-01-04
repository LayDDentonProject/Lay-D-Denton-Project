class Cigarettes injects Cigarettes;

state Activated
{
	function Activate()
	{
		// can't turn it off
	}

	function BeginState()
	{
		local Pawn P;
		local vector loc;
		local rotator rot;
		local SmokeTrail puff;
		
		local Sound CoughSound;
		local DeusExPlayer Player;
		
		Super(DeusExPickup).BeginState();

		P = Pawn(Owner);
		if (P != None)
		{
			P.TakeDamage(5, P, P.Location, vect(0,0,0), 'PoisonGas');
			loc = Owner.Location;
			rot = Owner.Rotation;
			loc += 2.0 * Owner.CollisionRadius * vector(P.ViewRotation);
			loc.Z += Owner.CollisionHeight * 0.9;
			puff = Spawn(class'SmokeTrail', Owner,, loc, rot);
			if (puff != None)
			{
				puff.DrawScale = 1.0;
				puff.origScale = puff.DrawScale;
			}
			
			//LDDP, 10/25/21: Load cough sound dynamically.
			Player = DeusExPlayer(Owner);
			if ((Player != None) && (Player.FlagBase != None) && (Player.FlagBase.GetBool('LDDPJCIsFemale')))
			{
				CoughSound = Sound(DynamicLoadObject("FemJC.FJCCough", class'Sound', false));
			}
			if (CoughSound == None) CoughSound = sound'MaleCough';
			
			PlaySound(CoughSound);
		}

		UseOnce();
	}
Begin:
}
