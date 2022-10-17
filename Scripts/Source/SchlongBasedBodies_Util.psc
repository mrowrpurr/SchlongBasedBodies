scriptName SchlongBasedBodies_Util

bool function AllDependenciesInstalled() global
    return SchlongBasedBodies_Adapter_SOS.IsInstalled() && SchlongBasedBodies_Adapter_BOSSE.IsInstalled() && JContainers.isInstalled()
endFunction

string[] function AvailableGameGenders() global
    string[] genders = new string[2]
    genders[0] = "Female"
    genders[1] = "Male"
    return genders
endFunction
