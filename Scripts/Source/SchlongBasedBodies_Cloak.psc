scriptName SchlongBasedBodies_Cloak extends ActiveMagicEffect

SchlongBasedBodies_Main property SchlongBasedBodies_Main_Quest auto

event OnEffectStart(Actor target, Actor _)
    SchlongBasedBodies.Log("ACTOR HIT - " + target.GetActorBase().GetName())
    if ! target.HasSpell(SchlongBasedBodies_Main_Quest.SchlongBasedBodies_SchlongWatcher_Ability)
        SchlongBasedBodies.Log("ACTOR ADD SPELL - " + target.GetActorBase().GetName())
        target.AddSpell(SchlongBasedBodies_Main_Quest.SchlongBasedBodies_SchlongWatcher_Ability)
    endIf
endEvent
