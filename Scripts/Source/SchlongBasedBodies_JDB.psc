scriptName SchlongBasedBodies_JDB
{
    JDB storage for Schlong-based Bodies
}

;;;;;;;;;;

function InitializeDatabase() global
   InitializeRulesDatabase() 
endFunction

function InitializeRulesDatabase() global
    if ! EnabledRules()
        SetObject(EnabledRules(), JMap.object())
    endIf
endFunction

;;;;;;;;;;

function SetObject(string path, int obj) global
    JDB.solveObjSetter(path, obj, createMissingKeys = true)
endFunction

;;;;;;;;;;

string function RootPath() global
    return ".schlongBasedBodies"
endFunction

string function Path(string pathPart) global
    return RootPath() + "." + pathPart
endFunction

;;;;;;;;;;

string function RulesPath(string pathPart) global
    return Path("rules." + pathPart)
endFunction

string function EnabledRulesPath() global
    return RulesPath("enabled")
endFunction

string function RulesCachePath() global
    return RulesPath("cache")
endFunction

int function EnabledRules() global
    return JDB.solveObj(EnabledRulesPath())
endFunction

int function RulesCache() global
    return JDB.solveObj(RulesCachePath())
endFunction

function UpdateRulesCache(int obj) global
    SetObject(RulesCachePath(), obj)
endFunction

;;;;;;;;;;
