scriptName SchlongBasedBodies_Main extends Quest
{
    Startup Quest - Main mod initialization and global mod data storage
}

bool _initializing

Actor property Player auto

string property InstalledVersion auto

Spell property SchlongBasedBodies_Cloak_Ability auto  
Spell property SchlongBasedBodies_SchlongWatcher_Ability auto  

event OnInit()
    SchlongBasedBodies.Log("MAIN OnInit()")
    Initialize()
endEvent

function Initialize()
    if ! Player
        Player = Game.GetPlayer() 
    endIf
    SchlongBasedBodies.Log("MAIN INITIALIZE()")
    if _initializing
        return 
    endIf
    _initializing = true
    SchlongBasedBodies.Log("INITIALIZE")
    InstalledVersion = SchlongBasedBodies.Version()
    SchlongBasedBodies_JDB.InitializeDatabase()
    SchlongBasedBodies_Rules.LoadFromFileSystem()
    if ! Player.HasSpell(SchlongBasedBodies_Cloak_Ability)
        SchlongBasedBodies.Log("Adding cloak")
        Player.AddSpell(SchlongBasedBodies_Cloak_Ability)
        SchlongBasedBodies.Log("Added")
    endIf
    RegisterForModEvent("Schlongify", "OnSchlongify")
    RegisterForModEvent("ReSchlongify", "OnReSchlongify")
    _initializing = false
endFunction

event OnSchlongify(Form target, Form schlongAddon)
    SchlongBasedBodies.Log("DETECTED SCHLONGIFY")
    SchlongBasedBodies.Log("DETECTED SCHLONGIFY of " + (target as Actor).GetActorBase().GetName() + " with addon " + schlongAddon.GetName())
    if (target as Actor)
        SchlongBasedBodies.ProcessActor(target as Actor, changeDetected = true)
    endIf
endEvent

event OnReSchlongify(string _, string sosActionBeingTaken = "", float targetFormID = 0.0, Form sender)
    SchlongBasedBodies.Log("DETECTED re-SCHLONGIFY of target: " + targetFormID)
    if targetFormID
        Actor target = Game.GetForm(targetFormID as int) as Actor
        if target
            SchlongBasedBodies.Log("DETECTED re-SCHLONGIFY of " + target.GetActorBase().GetName())
            SchlongBasedBodies.ProcessActor(target, changeDetected = true)
        endIf
    endIf
    SchlongBasedBodies.Log("Oh and the Form is: " + sender)
endEvent
