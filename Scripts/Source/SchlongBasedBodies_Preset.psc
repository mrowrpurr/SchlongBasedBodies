scriptName SchlongBasedBodies_Preset
{
    Global script for reading/writing .json preset files
}

string function GetName(int preset) global
    return JMap.getStr(preset, "name")
endFunction

string function PresetsFolderPath() global
    return "Data\\Config\\SchlongBasedBodies\\Presets"
endFunction

string function PresetFilePath(string presetName) global
    return PresetsFolderPath() + "/" + presetName + ".json"
endFunction

function ResetPresetsCache() global
    SchlongBasedBodies_JDB.PresetsByFilename_Delete()
endFunction

function ReloadPresetsCache() global
    ResetPresetsCache()
    LoadPresetsCache()
endFunction

function LoadPresetsCache() global
    SchlongBasedBodies_JDB.PresetsByFilename_Set(JValue.readFromDirectory(PresetsFolderPath()))
endFunction

int function PresetsByFilename() global
    int presets = SchlongBasedBodies_JDB.PresetsByFilename_Get()
    if ! presets
        LoadPresetsCache()
        presets = SchlongBasedBodies_JDB.PresetsByFilename_Get()
    endIf
    return presets
endFunction

string[] function GetAllPresetNames() global
    int presets = PresetsByFilename()
    string[] keys = JMap.allKeysPArray(presets)
    string[] presetNames = Utility.CreateStringArray(keys.Length)
    int i = 0
    while i < keys.Length
        int preset = JMap.getObj(presets, keys[i])
        presetNames[i] = GetName(preset)
        i += 1
    endWhile
    return presetNames
endFunction

int function GetPresetByName(string name) global
    int presets = PresetsByFilename()
    string[] keys = JMap.allKeysPArray(presets)
    int i = 0
    while i < keys.Length
        int preset = JMap.getObj(presets, keys[i])
        if GetName(preset) == name
            return preset
        endIf
        i += 1
    endWhile
    return 0
endFunction

int function GetCurrentPreset() global
    int preset = SchlongBasedBodies_JDB.CurrentPreset_Get()
    if ! preset
        preset = GetPresetByName(GetAllPresetNames()[0])
        SetCurrentPreset(preset)
    endIf
    return preset
endFunction

function SetCurrentPreset(int preset) global
    SchlongBasedBodies_JDB.CurrentPreset_Set(preset)
endFunction

string function GetCurrentPresetName() global
    return GetName(GetCurrentPreset())
endFunction
