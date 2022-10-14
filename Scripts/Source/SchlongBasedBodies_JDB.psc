scriptName SchlongBasedBodies_JDB
{
    JDB storage for Schlong-based Bodies
}

string function RootPath() global
    return ".schlongBasedBodies"
endFunction

string function BuildPath(string pathPart) global
    return RootPath() + "." + pathPart
endFunction

string function DeletePath(string path) global
    JDB.solveObjSetter(path, 0, createMissingKeys = true)
endFunction

string function PresetsByFilename_Path() global
    return BuildPath("presetsFromFilesystem")
endFunction

int function PresetsByFilename_Get() global
    return JDB.solveObj(PresetsByFilename_Path())
endFunction

function PresetsByFilename_Set(int obj) global
    JDB.solveObjSetter(PresetsByFilename_Path(), obj, createMissingKeys = true)
endFunction

function PresetsByFilename_Delete() global
    DeletePath(PresetsByFilename_Path())
endFunction

string function CurrentPreset_Path() global
    return BuildPath("currentlySelectedPreset")
endFunction

int function CurrentPreset_Get() global
    return JDB.solveObj(CurrentPreset_Path())    
endFunction

function CurrentPreset_Set(int obj) global
    JDB.solveObjSetter(CurrentPreset_Path(), obj, createMissingKeys = true)
endFunction

