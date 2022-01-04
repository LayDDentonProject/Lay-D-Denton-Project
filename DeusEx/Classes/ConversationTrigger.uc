class ConversationTrigger injects ConversationTrigger;

// Lay D Denton compatibility
function Trigger(Actor Other, Pawn Instigator)
{
    local DeusExPlayer Player;
    local Name oldConTag;
    oldConTag = ConversationTag;
    
    Player = DeusExPlayer(Other);

    if ((BindName != "") && (ConversationTag != ''))
    {
        if (Player != None && Player.FlagBase != None && Player.FlagBase.GetBool('LDDPJCIsFemale'))
        {
            ConversationTag = Player.FlagBase.StringToName("FemJC"$string(ConversationTag));
        }
    }
    log(Self$" Trigger("$Other$", "$Instigator$"), oldConTag: "$oldConTag$", ConversationTag: "$ConversationTag);
    Super.Trigger(Other, Instigator);
    ConversationTag = oldConTag;
}

function Touch(Actor Other)
{
    local DeusExPlayer Player;
    local Name oldConTag;
    oldConTag = ConversationTag;
    Player = DeusExPlayer(Other);

    if ((BindName != "") && (ConversationTag != ''))
    {
        if (Player != None && Player.FlagBase != None && Player.FlagBase.GetBool('LDDPJCIsFemale'))
        {
            ConversationTag = Player.FlagBase.StringToName("FemJC"$string(ConversationTag));
        }
    }
    log(Self$" Touch("$Other$"), oldConTag: "$oldConTag$", ConversationTag: "$ConversationTag);
    Super.Touch(Other);
    ConversationTag = oldConTag;
}
