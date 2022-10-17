scriptName SchlongBasedBodies_MCM extends SchlongBasedBodies_MCM_Pages_Rules

SchlongBasedBodies_Main property SchlongBasedBodies_Main_Quest auto

event OnConfigInit()
    ModName = "$SchlongBodies_ModPageName"
endEvent

Event OnConfigOpen()
    Pages = new string[2]
    Pages[0] = "$SchlongBodies_General_PageName"
    Pages[1] = "$SchlongBodies_Rules_PageName"
EndEvent

event OnPageReset(string page)
    if page
        UnloadCustomContent()
        if SchlongBasedBodies_Util.AllDependenciesInstalled()
            if page == "$SchlongBodies_General_PageName"
                General()
            elseIf page == "$SchlongBodies_Rules_PageName"
                Rules()
            endIf
        else
            MissingDependencies()
        endIf
    else
        LoadCustomContent("SchlongBasedBodies/SchlongBasedBodies_MCM_Logo.dds")
    endIf
endEvent

event OnOptionHighlight(int optionId)
    General_OnOptionHighlight(optionId)
endEvent

event OnOptionSelect(int optionId)
    General_OnOptionSelect(optionId)    
endEvent












    ; _currentlyEditingPreset = SchlongBasedBodies_Preset.GetCurrentPreset()

    ; _option_preset_action_names = new string[4]
    ; _option_preset_action_names[0] = "$SchlongBodies_Option_Preset_Actions_Add"
    ; _option_preset_action_names[1] = "$SchlongBodies_Option_Preset_Actions_Use"
    ; _option_preset_action_names[2] = "$SchlongBodies_Option_Preset_Actions_Delete"
    ; _option_preset_action_names[3] = "$SchlongBodies_Option_Preset_Actions_Rename"

; int _currentlyEditingPreset
; string[] _option_preset_action_names

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ; Helpers
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; string function CurrentlySelectedPresetName()
;     return SchlongBasedBodies_Preset.GetName(_currentlyEditingPreset)
; endFunction


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ; Rendering
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; function RenderDependenciesMissingPage()
;     AddHeaderOption("Missing Required Dependencies")
;     AddEmptyOption()
;     ;
;     if SchlongBasedBodies_Adapter_SOS.IsInstalled()
;         AddTextOption("Schlongs of Skyrim", "Installed")
;     else
;         AddTextOption("Schlongs of Skyrim", "MISSING")
;     endIf
;     ;
;     if SchlongBasedBodies_Adapter_BOSSE.IsInstalled()
;         AddTextOption("BOSSE", "Installed")
;     else
;         AddTextOption("BOSSE", "MISSING")
;     endIf
;     ;
;     if JContainers.isInstalled()
;         AddTextOption("JContainers", "Installed")
;     else
;         AddTextOption("JContainers", "MISSING")
;     endIf
; endFunction

; function RenderGeneralPage()
;     AddHeaderOption("$SchlongBodies_MainPageHeader")
;     AddTextOption("$SchlongBodies_GameUsingPreset", SchlongBasedBodies_Preset.GetCurrentPresetName(), OPTION_FLAG_DISABLED)
;     ;
;     AddMenuOptionST("Option_Preset_Select", "$SchlongBodies_Option_Preset_Select", CurrentlySelectedPresetName())
;     AddEmptyOption()
;     ;
;     AddMenuOptionST("Option_Preset_Actions", "$SchlongBodies_Option_Preset_Actions", "$SchlongBodies_Option_Preset_Actions_Add")
;     AddEmptyOption()
;     ;
;     AddEmptyOption()
;     AddEmptyOption()
;     ;
;     AddHeaderOption("$SchlongBodies_ActionsHeader")
;     AddEmptyOption()
;     ;
;     AddMenuOption("$SchlongBodies_Actions_BOSSE_Body", "")
;     AddEmptyOption()
;     ;
;     AddHeaderOption("$SchlongBodies_ConditionsHeader")
;     AddEmptyOption()
;     ;
;     AddEmptyOption()
;     AddEmptyOption()
;     ;
;     AddMenuOption("$SchlongBodies_Condition_Schlong", "")
;     AddEmptyOption()
;     ;
;     AddMenuOption("$SchlongBodies_Condition_Sex", "")
;     AddEmptyOption()
;     ;
;     AddMenuOption("$SchlongBodies_Condition_Sexlab_Sex", "")
;     AddEmptyOption()
;     ;
;     AddMenuOption("$SchlongBodies_Condition_Race", "")
;     AddEmptyOption()
;     ;
; endFunction

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ; Options
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; state Option_Preset_Select
;     event OnHighlightST()
;         SetInfoText("HELLO!")
;     endEvent
;     event OnMenuOpenST()
;         string[] presetNames = SchlongBasedBodies_Preset.GetAllPresetNames()
;         string currentPresetName = SchlongBasedBodies_Preset.GetCurrentPresetName()
;         int currentIndex = presetNames.Find(currentPresetName)
;         int defaultIndex = presetNames.Find("Default")
;         SetMenuDialogOptions(presetNames)
;         SetMenuDialogStartIndex(currentIndex)
;         SetMenuDialogDefaultIndex(defaultIndex)
;     endEvent
;     event OnMenuAcceptST(int index)
;         SchlongBasedBodies.Log("Menu Accept: " + index)
;         if index > -1
;             string selectedPresetName = SchlongBasedBodies_Preset.GetAllPresetNames()[index]
;             SchlongBasedBodies.Log("NAME of Selected: " + selectedPresetName)
;             _currentlyEditingPreset = SchlongBasedBodies_Preset.GetPresetByName(selectedPresetName)
;             SchlongBasedBodies.Log("Setup the currently editing preset as: " + _currentlyEditingPreset)
;             SetMenuOptionValueST(selectedPresetName)
;         endIf
;     endEvent
;     event OnDefaultST()
;         _currentlyEditingPreset = SchlongBasedBodies_Preset.GetPresetByName("Default")
;     endEvent
; endState

; state Option_Preset_Actions
;     event OnHighlightST()
;         SetInfoText("HELLO! this menu...")
;     endEvent
;     event OnMenuOpenST()
;         SetMenuDialogOptions(_option_preset_action_names)
;         SetMenuDialogStartIndex(0)
;         SetMenuDialogDefaultIndex(-1)
;     endEvent
;     event OnMenuAcceptST(int index)
;     endEvent
; endState

; state Option_Actions_BOSSE_Body
;     event OnHighlightST()
;         SetInfoText("HELLO!")
;     endEvent
;     event OnMenuOpenST()
;         ; SetMenuDialogOptions(presetNames)
;         ; SetMenuDialogStartIndex(currentIndex)
;         ; SetMenuDialogDefaultIndex(defaultIndex)
;     endEvent
;     event OnMenuAcceptST(int index)
;     endEvent
;     event OnDefaultST()
;     endEvent
; endState

; state Option_Conditions_Schlong
;     event OnHighlightST()
;         SetInfoText("HELLO!")
;     endEvent
;     event OnMenuOpenST()
;         ; SetMenuDialogOptions(presetNames)
;         ; SetMenuDialogStartIndex(currentIndex)
;         ; SetMenuDialogDefaultIndex(defaultIndex)
;     endEvent
;     event OnMenuAcceptST(int index)
;     endEvent
;     event OnDefaultST()
;     endEvent
; endState

; state Option_Conditions_Game_Sex
;     event OnHighlightST()
;         SetInfoText("HELLO!")
;     endEvent
;     event OnMenuOpenST()
;         ; SetMenuDialogOptions(presetNames)
;         ; SetMenuDialogStartIndex(currentIndex)
;         ; SetMenuDialogDefaultIndex(defaultIndex)
;     endEvent
;     event OnMenuAcceptST(int index)
;     endEvent
;     event OnDefaultST()
;     endEvent
; endState

; state Option_Conditions_SexLab_Sex
;     event OnHighlightST()
;         SetInfoText("HELLO!")
;     endEvent
;     event OnMenuOpenST()
;         ; SetMenuDialogOptions(presetNames)
;         ; SetMenuDialogStartIndex(currentIndex)
;         ; SetMenuDialogDefaultIndex(defaultIndex)
;     endEvent
;     event OnMenuAcceptST(int index)
;     endEvent
;     event OnDefaultST()
;     endEvent
; endState

; state Option_Conditions_Race
;     event OnHighlightST()
;         SetInfoText("HELLO!")
;     endEvent
;     event OnMenuOpenST()
;         ; SetMenuDialogOptions(presetNames)
;         ; SetMenuDialogStartIndex(currentIndex)
;         ; SetMenuDialogDefaultIndex(defaultIndex)
;     endEvent
;     event OnMenuAcceptST(int index)
;     endEvent
;     event OnDefaultST()
;     endEvent
; endState
