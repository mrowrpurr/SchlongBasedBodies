scriptName SchlongBasedBodies_Player extends ReferenceAlias

SchlongBasedBodies_Main property SchlongBasedBodies_Main_Quest auto

event OnInit()
    SchlongBasedBodies.Log("PLAYER ON INIT - adding cloak")
    GetActorReference().AddSpell(SchlongBasedBodies_Main_Quest.SchlongBasedBodies_Cloak_Ability)
endEvent

event OnPlayerLoadGame()
    SchlongBasedBodies.Log("PLAYER LOAD GAME")
endEvent
