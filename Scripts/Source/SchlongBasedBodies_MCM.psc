scriptName SchlongBasedBodies_MCM extends SKI_ConfigBase

SchlongBasedBodies_Main property SchlongBasedBodies_Main_Quest auto

int _currentlyEditingPreset

event OnConfigInit()
    ModName = "$SchlongBodies_ModPageName"
    Pages = new string[1]
    Pages[0] = "$SchlongBodies_MainPageName"
    _currentlyEditingPreset = SchlongBasedBodies_Preset.GetCurrentPreset()
    SchlongBasedBodies.Log("MCM Loaded and the current preset is: " + _currentlyEditingPreset)
    SchlongBasedBodies.Log("The name of it is: " + SchlongBasedBodies_Preset.Getname(_currentlyEditingPreset))
endEvent

event OnPageReset(string page)
    if page
        UnloadCustomContent()
        RenderGeneralPage()
    else
        LoadCustomContent("SchlongBasedBodies/SchlongBasedBodies_MCM_Logo.dds")
    endIf
endEvent

function RenderGeneralPage()
    SchlongBasedBodies.Log("Render general " + _currentlyEditingPreset)
    SchlongBasedBodies.Log("Name: " + SchlongBasedBodies_Preset.GetName(_currentlyEditingPreset))
    AddMenuOptionST("Option_ChoosePreset", "$SchlongBodies_Option_PresetsMenu", SchlongBasedBodies_Preset.GetName(_currentlyEditingPreset))
endFunction

state Option_ChoosePreset
    event OnHighlightST()
        SetInfoText("HELLO!")
    endEvent
    event OnMenuOpenST()
        string[] presetNames = SchlongBasedBodies_Preset.GetAllPresetNames()
        string currentPresetName = SchlongBasedBodies_Preset.GetCurrentPresetName()
        int currentIndex = presetNames.Find(currentPresetName)
        int defaultIndex = presetNames.Find("Default")
        SetMenuDialogOptions(presetNames)
        SetMenuDialogStartIndex(currentIndex)
        SetMenuDialogDefaultIndex(defaultIndex)
    endEvent
    event OnMenuAcceptST(int index)
        SchlongBasedBodies.Log("Menu Accept: " + index)
        if index > -1
            string selectedPresetName = SchlongBasedBodies_Preset.GetAllPresetNames()[index]
            SchlongBasedBodies.Log("NAME of Selected: " + selectedPresetName)
            _currentlyEditingPreset = SchlongBasedBodies_Preset.GetPresetByName(selectedPresetName)
            SchlongBasedBodies.Log("Setup the currently editing preset as: " + _currentlyEditingPreset)
            SetMenuOptionValueST(selectedPresetName)
        endIf
    endEvent
    event OnDefaultST()
        _currentlyEditingPreset = SchlongBasedBodies_Preset.GetPresetByName("Default")
    endEvent
endState
