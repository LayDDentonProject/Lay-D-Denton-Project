class Mission06 injects Mission06;

function FirstFrame()
{
    local Hooker1 Mercedes;
    local LowerClassFemale Tessa;
    local ScriptedPawn SP;

    if (localURL == "06_HONGKONG_WANCHAI_UNDERWORLD")
    {
        //LDDP, 11/01/21: Get rid of Russ if JC is Male.  Get rid of Mercedes & Tessa if JC is feamle and hasn't restored original interactions 
        if (flags.GetBool('LDDPJCIsFemale') && !flags.GetBool('LDDPMaleCont4FJC'))
        {
            foreach AllActors(class'Hooker1', Mercedes, 'ClubMercedes')
                Mercedes.Destroy();
            foreach AllActors(class'LowerClassFemale', Tessa, 'ClubTessa')
                Tessa.Destroy();
        }

        if (flags.GetBool('LDDPJCIsFemale') == False)
        {
            foreach AllActors(class'ScriptedPawn', SP)
            {
                if (SP.IsA('LDDPRuss'))
                {
                    SP.Destroy();
                }
            }
        }
    }

    Super.FirstFrame();
}
