scriptName SchlongBasedBodies_Player extends ReferenceAlias

SchlongBasedBodies_Main property SchlongBasedBodies_Main_Quest auto

event OnInit()
    SchlongBasedBodies.Log("Player init")
    SchlongBasedBodies_Main_Quest.Initialize()
endEvent

event OnPlayerLoadGame()
    SchlongBasedBodies.Log("Loaded Game")
    SchlongBasedBodies_Main_Quest.Initialize()
endEvent
