scriptName SchlongBasedBodies_SchlongWatcher extends ActiveMagicEffect

SchlongBasedBodies_Main property SchlongBasedBodies_Main_Quest auto

event OnEffectStart(Actor target, Actor _)
    SchlongBasedBodies.Log("Schlong Manager started for " + target.GetActorBase().GetName())
    SchlongBasedBodies.ProcessActor(target)
EndEvent

event OnEffectFinish(Actor target, Actor _)
    SchlongBasedBodies.Log("Schlong Manager STOPPED for " + target.GetActorBase().GetName())
EndEvent
