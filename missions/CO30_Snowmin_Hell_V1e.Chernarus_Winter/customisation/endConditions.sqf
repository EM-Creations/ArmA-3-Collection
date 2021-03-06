private _bluForCasualty = "ROYAL" call FNC_CasualtyPercentage; // Gets the casualty percentage of team "BLUFOR"
private _opForCasualty = "BLAVAKS" call FNC_CasualtyPercentage; // Gets the casualty percentage of team "OPFOR"

//systemChat "End condition checks..";

/* if (_bluForCasualty >= 95) exitWith {
	"BLAVAKS VICTORY<br />Royalist Forces have retreated due to casualties." call FNC_EndMission;

}; */

if (_opForCasualty >= 90) exitWith {
	["Royalist VICTORY<br />Blavaks have retreated due to casualties."] remoteExec ["systemChat", 0, true];

};

/*
Alternative methods of counting casualties

	"BLUFOR" call FNC_casualtyCount;
		this will count how many members of a team died in the mission

	"BLUFOR" call FNC_countTeam;
		this will check how many players are remaining in a team
		be careful as using this method will end the mission instantly if
		not enough players are present in the team


Adding extraction

	["BLUFOR", "ExtractionAreaMarker", 0.8] call FNC_hasExtracted;
		this will check if at least 80% of remaining forces are present in extraction area
*/

sleep (10); // This determines how frequently the end conditions should be checked in seconds
