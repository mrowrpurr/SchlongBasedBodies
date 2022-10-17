scriptName SchlongBasedBodies

string function Version() global
    return "6.9.0"
endFunction

function ProcessActor(Actor target, bool changeDetected = false) global
    int custom1_BodyFactionRank = 6
    int beastAlt_BodyFactionRank = 5
    int vanilla_BodyFactionRank = 1
    bool changed

    ; BOSSE Body Faction
    Faction bosseBodyFaction = Game.GetFormFromFile(0xBDD99, "BOSSE.esm") as Faction

    Log(target + " - " + "PROCESS ACTOR " + target)
    Log(target + " - " + "ACTOR " + target.GetActorBase().GetName())
    
    ; Has schlong?
    Form addon = SOS_API.Get().GetSchlong(target)
    if addon && addon.GetName() != "No Schlong"
        Log(target + " - " + "ACTOR HAS " + addon + " " + addon.GetName())
        
        ; Is chick?
        bool isFemale = target.GetActorBase().GetSex();
        
        if isFemale
            Log(target + " - " + "ACTOR IS A WOMAN") 
            
            ; Is Argonian or Khajiit?
            Race theRace = target.GetActorBase().GetRace()
            if theRace.GetName() == "Khajiit" || theRace.GetName() == "Argonian"
                Log(target + " - " + "ACTOR IS a BEAST race")
                target.SetFactionRank(bosseBodyFaction, beastAlt_BodyFactionRank)
                changed = true
            else
                Log(target + " - " + "ACTOR IS a HUMAN race") 
                target.SetFactionRank(bosseBodyFaction, custom1_BodyFactionRank)
                changed = true
            endIf
            
        else
            Log(target + " - " + "ACTOR IS NOT A WOMAN") 
        endIf
        
    else
        Log(target + " - " + "ACTOR HAS NO SCHLONG")
    endIf
    
    if changeDetected && (! changed)
        Log(target + " - " + "REVERT TO VANILLA")
        target.SetFactionRank(bosseBodyFaction, vanilla_BodyFactionRank)
        changed = true
    endIf
    
    if changed
        Spell bossePlayerUpdateSpell = Game.GetFormFromFile(0x60F6, "BOSSE.esm") as Spell
        bossePlayerUpdateSpell.Cast(target, None)
    endIf
    
    ; BOSSE_BodyUpdated.SetValue(1 as Float)
    ; BOSSE_UpdateBodyPlayer.Cast(PlayerRef as objectreference, none)
endFunction

;;;;;;;;;;;;;;;;;;

function Log(string text) global
    Debug.Trace("[Schlong-based Bodies] " + text)
endFunction
