scriptName SchlongBasedBodies_Adapter_SOS

bool function IsInstalled() global
	return Game.GetModByName("Schlongs of Skyrim.esp") != 255
endFunction

string[] function AddonNames() global
	int count = SOS_Data.CountAddons()
	string[] names = Utility.CreateStringArray(count)
	int i = 0
	while i < count
		names[i] = SOS_Data.GetAddon(i).GetName()
		i += 1
	endWhile
	return names
endFunction
