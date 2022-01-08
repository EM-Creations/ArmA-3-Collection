private _westCasualty = "USMC" call FUNC(CasualtyPercentage); //Gets the casualty percentage of team "USMC"
private _eastCasualty = "VDV" call FUNC(CasualtyPercentage); //Gets the casualty percentage of team "VDV"
private _extracted = ["USMC", "marker_capture", 0.1] call FUNC(hasExtracted);
/* diag_log format ["INFO: _extracted = %1", _extracted]; */
private _currentMoney = [player, true, true, true] call EFUNC(CURRENCY,getCurrencyText);
LOG_1("Money = %1", _currentMoney);
[player, 5] call EFUNC(CURRENCY,addCurrency);
[player, 2.5] call EFUNC(CURRENCY,deductCurrency);

if (_westCasualty >= 50) exitWith {
	/* "VDV VICTORY<br />USMC has retreated due to casualties." call FUNC(EndMission); */
};

if (_eastCasualty >= 75) exitWith {
	"USMC VICTORY<br />VDV has retreated due to casualties." call FUNC(EndMission);
};

if (hostage call FUNC(HOST_IsRescued)) exitWith {
		"Hostages Rescued" call FUNC(EndMission);
};

/* ["OPFOREliminated", true] call EFUNC(A3END,EndMission); */

/*
Alternative methods of counting casualties

	"USMC" call FUNC(casualtyCount);
		this will count how many members of a team died in the mission

	"USMC" call FUNC(countTeam);
		this will check how many players are remaining in a team
		be careful as using this method will end the mission instantly if
		not enough players are present in the team


Adding extraction

	["USMC", "ExtractionAreaMarker", 0.8] call FUNC(hasExtracted);
		this will check if at least 80% of remaining forces are present in extraction area
*/
