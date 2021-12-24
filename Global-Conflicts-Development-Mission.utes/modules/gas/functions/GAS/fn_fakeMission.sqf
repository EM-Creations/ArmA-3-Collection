// AUTHOR: StatusRed
#include "script_component.hpp"

//Example, to be run only once, SERVER ONLY: ["FW_GAS_FAKEMISSION",[position player,50,3,1,5,300]] call CBA_fnc_serverEvent;

params [
	"_target",
	"_dispersion",
	"_shotFreq",
	"_shotRounds",
	"_shotArea",
	["_timeOut", -1, [-1]]
];

private _timeOutStart = _timeOut;

private _shotCount = 0;
while {_shotCount < _shotRounds} do {
	if (_timeOut != -1) then {_timeOut = time + _timeOutStart};

	private _shotPos = [[[_target, _dispersion]], []] call BIS_fnc_randomPos;

	//_gasLogic = "Sign_Sphere100cm_F" createVehicle _shotPos;
	private _gasLogic = "Land_HelipadEmpty_F" createVehicle _shotPos;
	_gasLogic setPosATL _shotPos;

	private _sound = selectRandom ["mortar1", "mortar2"];
	[_gasLogic, [_sound, 500]] remoteExec ["say3D"];

	sleep 2;

	"rhs_rpg7v2_pg7vl" createVehicle _shotPos;

	deleteVehicle _gasLogic;

	sleep _shotFreq;
};
