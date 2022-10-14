scriptName SchlongBasedBodies_Main extends Quest
{Something}

ReferenceAlias property PlayerRef auto  

Spell property SchlongBasedBodies_Cloak_Ability auto  

Spell property SchlongBasedBodies_SchlongWatcher_Ability auto  

event OnInit()
    SchlongBasedBodies.Log("MAIN INIT")
    RegisterForModEvent("Schlongify", "OnSchlongify")
    RegisterForModEvent("ReSchlongify", "OnReSchlongify")
endEvent

event OnSchlongify(Form target, Form schlongAddon)
    SchlongBasedBodies.Log("DETECTED SCHLONGIFY")
    SchlongBasedBodies.Log("DETECTED SCHLONGIFY of " + (target as Actor).GetActorBase().GetName() + " with addon " + schlongAddon.GetName())
endEvent

event OnReSchlongify(string _, string sosActionBeingTaken = "", float targetFormID = 0.0, Form sender)
    SchlongBasedBodies.Log("DETECTED re-SCHLONGIFY of target: " + targetFormID)
    if targetFormID
        Actor target = Game.GetForm(targetFormID as int) as Actor
        if target
            SchlongBasedBodies.Log("DETECTED re-SCHLONGIFY of " + target.GetActorBase().GetName())
        endIf
    endIf
    SchlongBasedBodies.Log("Oh and the Form is: " + sender)
endEvent
