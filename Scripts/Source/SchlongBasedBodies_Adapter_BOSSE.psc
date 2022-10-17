scriptName SchlongBasedBodies_Adapter_BOSSE

; How does BOSSE work?
;
; Bodies
;   character.SetFactionRank(BOSSE_Body, x)
;
; Body Types
;   character.SetFactionRank(BOSSE_BodyType, x)
;

bool function IsInstalled() global
	return Game.GetModByName("BOSSE.esm") != 255
endFunction

string function ConfigFilePath() global
	return "Data\\SchlongBasedBodies\\BOSSE.json"
endFunction

int function Config() global
	return JValue.readFromFile(ConfigFilePath())
endFunction

string[] function BodyNames() global
	return JArray.asStringArray(JMap.getObj(Config(), "bodies"))
endFunction
