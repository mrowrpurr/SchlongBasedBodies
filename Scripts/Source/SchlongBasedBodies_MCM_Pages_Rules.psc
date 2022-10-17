scriptName SchlongBasedBodies_MCM_Pages_Rules extends SchlongBasedBodies_MCM_Pages_General

string _rulesPage_currently_selected_rule_name

string[] _rulesPage_body_names
string[] _rulesPage_playable_race_names

int property RulesPage_SelectedRule
    int function get()
        return SchlongBasedBodies_Rules.GetByName(_rulesPage_currently_selected_rule_name)
    endFunction
endProperty

string property RulesPage_SelectedRuleName
    string function get()
        return _rulesPage_currently_selected_rule_name
    endFunction
endProperty

string property RulesPage_SelectedBodyName
    string function get()
        return SchlongBasedBodies_Rules.GetBody(RulesPage_SelectedRule)
    endFunction
    function set(string bodyName)
        SchlongBasedBodies_Rules.SetBody(RulesPage_SelectedRule, bodyName)
        SchlongBasedBodies_Rules.Save(RulesPage_SelectedRule)
    endFunction
endProperty

string property RulesPage_SelectedGender
    string function get()
        return SchlongBasedBodies_Rules.GetGender(RulesPage_SelectedRule)
    endFunction
    function set(string genderName)
        SchlongBasedBodies_Rules.SetGender(RulesPage_SelectedRule, genderName)
        SchlongBasedBodies_Rules.Save(RulesPage_SelectedRule)
    endFunction
endProperty

bool property RulesPage_SelectedAnySchlong
    bool function get()
        return SchlongBasedBodies_Rules.GetAnySchlong(RulesPage_SelectedRule) 
    endFunction
endProperty

string property RulesPage_SelectedSchlongsText
    string function get()
        return SchlongBasedBodies_Rules.GetSchlongNamesText(RulesPage_SelectedRule)
    endFunction
endProperty

function Rules()
    Rules_Setup()
    Rules_RenderPage()
endFunction

function Rules_Setup()
    SchlongBasedBodies_Rules.LoadFromFileSystem()

    _rulesPage_body_names = SchlongBasedBodies_Adapter_BOSSE.BodyNames()
    ; _rulesPage_playable_race_names
    
    if ! RulesPage_SelectedRuleName
        _rulesPage_currently_selected_rule_name = SchlongBasedBodies_Rules.AllRuleNames()[0]
    endIf
endFunction

function Rules_RenderPage()
    SetCursorFillMode(TOP_TO_BOTTOM)
    SetCursorPosition(0)
    Rules_LeftColumn()
    SetCursorPosition(1)
    Rules_RightColumn()
endFunction

function Rules_LeftColumn()
    if SchlongBasedBodies_Rules.AnyRules()
        ; Choose Rule
        AddHeaderOption("$SchlongBodies_Rules_Select_Text")
        AddMenuOptionST("Rules_Option_ChooseRule", "", RulesPage_SelectedRuleName)
        AddEmptyOption()
        ; Choose Body
        AddHeaderOption("$SchlongBodies_Rules_Body_Header")
        AddMenuOptionST("Rules_Option_ChooseBody", "$SchlongBodies_Rules_Body_Choose", RulesPage_SelectedBodyName)
        AddEmptyOption()
        ; Choose Conditions
        AddHeaderOption("$SchlongBodies_Rules_Conditions_Header")
        AddToggleOptionST("Rules_Option_AnySchlong", "$SchlongBodies_Rules_Conditions_Schlongs_Any", RulesPage_SelectedAnySchlong)
        AddMenuOptionST("Rules_Options_ChooseSchlongs", "$SchlongBodies_Rules_Conditions_Schlongs_Choose", "")
        AddMenuOptionST("Rules_Options_ChooseGender", "$SchlongBodies_Rules_Conditions_Gender_Choose", RulesPage_SelectedGender)
    else
        AddTextOption("$SchlongBodies_Rules_No_Rules", "", OPTION_FLAG_DISABLED)
    endIf
endFunction

function Rules_RightColumn()
    AddTextOptionST("Rules_Option_NewRule", "", "$SchlongBodies_Rules_Actions_New")
    if RulesPage_SelectedRuleName
        AddTextOptionST("Rules_Option_RenameRule", "", "$SchlongBodies_Rules_Actions_Rename")
        AddTextOptionST("Rules_Option_DeleteRule", "", "$SchlongBodies_Rules_Actions_Delete")
        AddEmptyOption() ; Body Chooser
        AddEmptyOption() ; Conditions
        AddEmptyOption() ; Any Schlong
        AddTextOption("", RulesPage_SelectedSchlongsText)
    endIf
endFunction

state Rules_Option_ChooseRule
    event OnHighlightST()
        SetInfoText("HI!")
    endEvent
    event OnMenuOpenST()
        SetMenuDialogOptions(SchlongBasedBodies_Rules.AllRuleNames())
        int index = SchlongBasedBodies_Rules.AllRuleNames().Find(RulesPage_SelectedRuleName)
        SetMenuDialogStartIndex(index)
        SetMenuDialogDefaultIndex(index)
    endEvent
    event OnMenuAcceptST(int index)
        _rulesPage_currently_selected_rule_name = SchlongBasedBodies_Rules.AllRuleNames()[index]
        ForcePageReset()
    endEvent
endState

state Rules_Option_ChooseBody
    event OnHighlightST()
        SetInfoText("HI!")
    endEvent
    event OnMenuOpenST()
        SetMenuDialogOptions(SchlongBasedBodies_Adapter_BOSSE.BodyNames())
        ; SetMenuDialogStartIndex()
        ; SetMenuDialogDefaultIndex()
    endEvent
    event OnMenuAcceptST(int index)
        if index > -1
            string bodyName = SchlongBasedBodies_Adapter_BOSSE.BodyNames()[index]
            RulesPage_SelectedBodyName = bodyName
            SetMenuOptionValueST(bodyName)
        endIf
    endEvent
endState

state Rules_Options_ChooseSchlongs
    event OnHighlightST()
        SetInfoText("HI!")
    endEvent
    event OnMenuOpenST()
        SetMenuDialogOptions(SchlongBasedBodies_Adapter_SOS.AddonNames())
        ; SetMenuDialogStartIndex()
        ; SetMenuDialogDefaultIndex()
    endEvent
    event OnMenuAcceptST(int a_index)
        
    endEvent
endState

state Rules_Options_ChooseGender
    event OnHighlightST()
        SetInfoText("HI!")
    endEvent
    event OnMenuOpenST()
        string[] genderNames = SchlongBasedBodies_Util.AvailableGameGenders()
        SetMenuDialogOptions(genderNames)
        int index = genderNames.Find(RulesPage_SelectedGender)
        SetMenuDialogStartIndex(index)
        SetMenuDialogDefaultIndex(index)
    endEvent
    event OnMenuAcceptST(int index)
        if index > -1
            string genderName = SchlongBasedBodies_Util.AvailableGameGenders()[index]
            RulesPage_SelectedGender = genderName
            SetMenuOptionValueST(genderName)
        endIf
    endEvent
endState
