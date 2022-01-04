class Mission01 injects Mission01;

function FirstFrame()
{
    local Female2 Shannon;
    local ScriptedPawn SP;
    
    Super.FirstFrame();
    //LDDP, 10/26/21: Get rid of shannon if Female and get rid of Chet if Male.

    if (localURL == "01_NYC_UNATCOHQ")
    {
        if (flags.GetBool('LDDPJCIsFemale'))
        {
                foreach AllActors(class'Female2', Shannon, 'Female2')
                    Shannon.Destroy();
        }
        else
        {
            foreach AllActors(class'ScriptedPawn', SP)
            {
                if (SP.IsA('LDDPChet'))
                {
                        SP.Destroy();
                }
            }
        }
    }
}
