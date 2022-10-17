scriptName SchlongBasedBodies_MCM_Pages_General extends SchlongBasedBodies_MCM_Pages_Errors

string[] _generalPage_rule_names
int[] _generalPage_toggleIds_for_rules

int _generalPage_linkToRulesPage

function General()
    General_Setup()
    General_RenderPage()
endFunction

function General_Setup()
    _generalPage_rule_names = SchlongBasedBodies_Rules.AllRuleNames()
    _generalPage_toggleIds_for_rules = Utility.CreateIntArray(_generalPage_rule_names.Length)
endFunction

function General_RenderPage()
    AddHeaderOption("$SchlongBodies_General_Header")
    AddEmptyOption()
    General_RenderRulesList()
endFunction

function General_RenderRulesList()
    int i = 0
    while i < _generalPage_rule_names.Length
        string ruleName = _generalPage_rule_names[i]
        int optionId = AddToggleOption(ruleName, SchlongBasedBodies_Rules.RuleIsActive(ruleName))
        _generalPage_toggleIds_for_rules[i] = optionId
        AddEmptyOption()
        i += 1
    endWhile
endFunction

event General_OnOptionHighlight(int optionId)
    if _generalPage_toggleIds_for_rules.Find(optionId)
        SetInfoText("You highlighted a rule...")
    endIf
endEvent

event General_OnOptionSelect(int optionId)
    if _generalPage_toggleIds_for_rules.Find(optionId)
        Debug.MessageBox("You toggled a rule!")
    endIf
endEvent
