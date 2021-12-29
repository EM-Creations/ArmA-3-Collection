// AUTHOR: StatusRed
#include "script_component.hpp"

//Example, to be run only once, SERVER ONLY: ["GAS_FIREMISSION",[position player,50,3,1,5,300]] call CBA_fnc_serverEvent;

params [
	"_target",
	"_dispersion",
	"_shotFreq",
	"_shotRounds",
	"_shotArea",
	["_timeOut", -1, [-1]]
];

private _timeOutStart = _timeOut;

/* private _shotCount = 0;
while {_shotCount < _shotRounds} do {
	if (_timeOut != -1) then {_timeOut = time + _timeOutStart};

	private _shotPos = [[[_target,_dispersion]],[]] call BIS_fnc_randomPos;

	//_gasLogic = "Sign_Sphere100cm_F" createVehicle _shotPos;
	private _gasLogic = "Land_HelipadEmpty_F" createVehicle _shotPos;
	_gasLogic setPosATL _shotPos;

	private _sound = selectRandom ["mortar1", "mortar2"];
	[_gasLogic, [_sound, 500]] remoteExec ["say3D"];

	sleep 2;

	"rhs_rpg7v2_pg7vl" createVehicle _shotPos;

	_gasLogic setVariable ["GAS_SHOTAREA", _shotArea, true];
	_gasLogic setVariable ["GAS_TIMEOUT", _timeOut, true];

	GVAR(GASLOGICS) set [count GVAR(GASLOGICS), _gasLogic];

	["GAS_GASZONES", _gasLogic] spawn CBA_fnc_globalEvent;
	["GAS_GASPARTICLES", _shotPos] spawn CBA_fnc_globalEvent;

	_shotCount = _shotCount + 1;

	sleep _shotFreq;
}; */

GVAR(shotCount) = 0;

[{
	params ["_args", "_idPFH"];
	_args params ["_shotRounds", "_timeOutStart", "_target", "_dispersion", "_shotArea"];

	if (GVAR(shotCount) >= _shotRounds) exitWith {
		[_idPFH] call CBA_fnc_removePerFrameHandler;
	};

	if (GVAR(timeOut) != -1) then {GVAR(timeOut) = CBA_missionTime + _timeOutStart};

	private _shotPos = [[[_target, _dispersion]], []] call BIS_fnc_randomPos;

	//_gasLogic = "Sign_Sphere100cm_F" createVehicle _shotPos;
	private _gasLogic = "Land_HelipadEmpty_F" createVehicle _shotPos;
	_gasLogic setPosATL _shotPos;

	private _sound = selectRandom ["mortar1", "mortar2"];
	[_gasLogic, [_sound, 500]] remoteExec ["say3D"];

	private _delay = 2;
	[{
		params ["_shotPos", "_gasLogic", "_shotArea"];

		"rhs_rpg7v2_pg7vl" createVehicle _shotPos;

		_gasLogic setVariable ["GAS_SHOTAREA", _shotArea, true];
		_gasLogic setVariable ["GAS_TIMEOUT", GVAR(timeOut), true];

		GVAR(GASLOGICS) pushBack _gasLogic;

		["GAS_GASZONES", _gasLogic] spawn CBA_fnc_globalEvent;
		["GAS_GASPARTICLES", _shotPos] spawn CBA_fnc_globalEvent;

		GVAR(shotCount) = GVAR(shotCount) + 1;
	}, [_shotPos, _gasLogic, _shotArea], _delay] call CBA_fnc_waitAndExecute;
}, _shotFreq, [_shotRounds, _timeOutStart, _target, _dispersion, _shotArea]] call CBA_fnc_addPerFrameHandler;
