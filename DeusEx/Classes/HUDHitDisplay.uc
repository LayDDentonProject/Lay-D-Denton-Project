class HUDHitDisplay merges HUDHitDisplay;

//LDDP, 10/27/21: Store this now, so we can change its texture on the fly!
var Window BodyWin;

event InitWindow()
{
    Super(HUDBaseWindow).InitWindow();

    bTickEnabled = True;

    Hide();

    player = DeusExPlayer(DeusExRootWindow(GetRootWindow()).parentPawn);

    SetSize(84, 106);

    CreateBodyPart(head,     Texture'HUDHitDisplay_Head',     39, 17,  4,  7);
    CreateBodyPart(torso,    Texture'HUDHitDisplay_Torso',    36, 25, 10,  23);
    CreateBodyPart(armLeft,  Texture'HUDHitDisplay_ArmLeft',  46, 27, 10,  23);
    CreateBodyPart(armRight, Texture'HUDHitDisplay_ArmRight', 26, 27, 10,  23);
    CreateBodyPart(legLeft,  Texture'HUDHitDisplay_LegLeft',  41, 44,  8,  36);
    CreateBodyPart(legRight, Texture'HUDHitDisplay_LegRight', 33, 44,  8,  36);

    bodyWin = NewChild(Class'Window');
    bodyWin.SetBackground(Texture'HUDHitDisplay_Body');
    bodyWin.SetBackgroundStyle(DSTY_Translucent);
    bodyWin.SetConfiguration(24, 15, 34, 68);
    bodyWin.SetTileColor(colArmor);
    bodyWin.Lower();

    winEnergy = CreateProgressBar(15, 20);
    winBreath = CreateProgressBar(61, 20);

    damageFlash = 0.4;  // seconds
    healFlash   = 1.0;  // seconds
}

//LDDP, 10/26/21: Update textures on the fly. Easy one.
function UpdateAsFemale(bool NewbFemale)
{
    local Texture TTex;
    
    if (NewbFemale)
    {
        TTex = Texture(DynamicLoadObject("FemJC.HUDHitDisplay_HeadFem", class'Texture', false));
        if (TTex != None) Head.PartWindow.SetBackground(TTex);
        TTex = Texture(DynamicLoadObject("FemJC.HUDHitDisplay_TorsoFem", class'Texture', false));
        if (TTex != None) Torso.PartWindow.SetBackground(TTex);
        TTex = Texture(DynamicLoadObject("FemJC.HUDHitDisplay_ArmLeftFem", class'Texture', false));
        if (TTex != None) ArmLeft.PartWindow.SetBackground(TTex);
        TTex = Texture(DynamicLoadObject("FemJC.HUDHitDisplay_ArmRightFem", class'Texture', false));
        if (TTex != None) ArmRight.PartWindow.SetBackground(TTex);
        TTex = Texture(DynamicLoadObject("FemJC.HUDHitDisplay_LegLeftFem", class'Texture', false));
        if (TTex != None) LegLeft.PartWindow.SetBackground(TTex);
        TTex = Texture(DynamicLoadObject("FemJC.HUDHitDisplay_LegRightFem", class'Texture', false));
        if (TTex != None) LegRight.PartWindow.SetBackground(TTex);
    }
    else
    {
        Head.PartWindow.SetBackground(Texture'HUDHitDisplay_Head');
        Torso.PartWindow.SetBackground(Texture'HUDHitDisplay_Torso');
        ArmLeft.PartWindow.SetBackground(Texture'HUDHitDisplay_ArmLeft');
        ArmRight.PartWindow.SetBackground(Texture'HUDHitDisplay_ArmRight');
        LegLeft.PartWindow.SetBackground(Texture'HUDHitDisplay_LegLeft');
        LegRight.PartWindow.SetBackground(Texture'HUDHitDisplay_LegRight');
    }
    
    if (NewbFemale)
    {
        TTex = Texture(DynamicLoadObject("FemJC.HUDHitDisplay_BodyFem", class'Texture', false));
        if (TTex != None) bodyWin.SetBackground(TTex);
    }
    else
    {
        bodyWin.SetBackground(Texture'HUDHitDisplay_Body');
    }
}
