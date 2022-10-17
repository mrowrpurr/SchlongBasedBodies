scriptName SchlongBasedBodies_Rules

string function RulesFolder() global
    return "Data\\SchlongBasedBodies\\Rules"
endFunction

function Save(int ruleInfo) global
    string filename = GetFileName(GetName(ruleInfo))
    string filepath = RulesFolder() + "\\" + filename
    JValue.writeToFile(ruleInfo, filepath)
endFunction

string function GetName(int ruleInfo) global
    return JMap.getStr(ruleInfo, "Name")
endFunction
; function SetName(int ruleInfo, string name) global
;     JMap.setStr(ruleInfo, "Name", name)
; endFunction

string function GetBody(int ruleInfo) global
    return JMap.getStr(ruleInfo, "Body")
endFunction
function SetBody(int ruleInfo, string bodyName) global
    JMap.setStr(ruleInfo, "Body", bodyName)
endFunction

string function GetGender(int ruleInfo) global
    return JMap.getStr(ruleInfo, "Gender")
endFunction
string function SetGender(int ruleInfo, string genderName) global
    JMap.setStr(ruleInfo, "Gender", genderName)
endFunction

bool function GetAnySchlong(int ruleInfo) global
    return JMap.getInt(ruleInfo, "AnySchlong") 
endFunction

int function GetSchlongNamesArray(int ruleInfo) global
    return JMap.getObj(ruleInfo, "Schlongs")
endFunction

string function GetSchlongNamesText(int ruleInfo) global
    string names
    int schlongs = GetSchlongNamesArray(ruleInfo)
    int count = JArray.count(schlongs)
    int i
    while i < count
        names += JArray.getStr(schlongs, i)
        if i != count - 1
            names += ", " 
        endIf
        i += 1
    endWhile
    return names
endFunction

function LoadFromFileSystem() global
    SchlongBasedBodies_JDB.UpdateRulesCache(JValue.readFromDirectory(RulesFolder()))
endFunction

int function GetByName(string name) global
    int loadedRuleFiles = SchlongBasedBodies_JDB.RulesCache()
    string[] fileNames = JMap.allKeysPArray(loadedRuleFiles)
    int i = 0
    while i < fileNames.Length
        int ruleInfo = JMap.getObj(loadedRuleFiles, fileNames[i])
        if GetName(ruleInfo) == name
            return ruleInfo 
        endIf
        i += 1
    endWhile
endFunction

string function GetFileName(string name) global
    int loadedRuleFiles = SchlongBasedBodies_JDB.RulesCache()
    string[] fileNames = JMap.allKeysPArray(loadedRuleFiles)
    int i = 0
    while i < fileNames.Length
        int ruleInfo = JMap.getObj(loadedRuleFiles, fileNames[i])
        if GetName(ruleInfo) == name
            return fileNames[i]
        endIf
        i += 1
    endWhile
endFunction

bool function AnyRules() global
    return JMap.count(SchlongBasedBodies_JDB.RulesCache()) > 0
endFunction

int[] function AllRules() global
    int loadedRuleFiles = SchlongBasedBodies_JDB.RulesCache()
    int[] rules = Utility.CreateIntArray(JArray.count(loadedRuleFiles))
    string[] fileNames = JMap.allKeysPArray(loadedRuleFiles)
    int i = 0
    while i < fileNames.Length
        int ruleInfo = JMap.getObj(loadedRuleFiles, fileNames[i])
        rules[i] = ruleInfo
        i += 1
    endWhile
    return rules
endFunction

string[] function AllRuleNames() global
    SchlongBasedBodies.Log("ALL RULE NAMES - JDB SAVING...")
    JValue.writeToFile(JDB.solveObj(SchlongBasedBodies_JDB.RootPath()), "Data\\TESTING-SchlongBasedBodies.json")
    int loadedRuleFiles = SchlongBasedBodies_JDB.RulesCache()
    string[] fileNames = JMap.allKeysPArray(loadedRuleFiles)
    string[] ruleNames = Utility.CreateStringArray(fileNames.Length)
    int i = 0
    while i < fileNames.Length
        int ruleInfo = JMap.getObj(loadedRuleFiles, fileNames[i])
        ruleNames[i] = GetName(ruleInfo)
        i += 1
    endWhile
    return ruleNames
endFunction

function SetRuleActive(string ruleName, bool active) global
    JMap.setInt(SchlongBasedBodies_JDB.EnabledRules(), ruleName, active as int)
endFunction

bool function RuleIsActive(string ruleName) global
    return JMap.getInt(SchlongBasedBodies_JDB.EnabledRules(), ruleName)
endFunction
