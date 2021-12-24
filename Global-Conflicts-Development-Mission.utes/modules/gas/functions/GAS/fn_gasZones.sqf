#include "script_component.hpp"

//Example, to be run only once, SERVER ONLY: ["FW_GAS_CREATEHOTZONE",[position player,100,300]] call CBA_fnc_serverEvent;

if (!isDedicated && hasInterface) then {
	params ["_gasLogic"];

	private _shotPos = getPosATL _gasLogic;
	private _gasTrig = objNull;

	waitUntil {_test = _gasLogic getVariable "FW_GAS_SHOTAREA"; !isNil "_test";};
	waitUntil {_test = _gasLogic getVariable "FW_GAS_TIMEOUT"; !isNil "_test";};

	private _shotArea = _gasLogic getVariable "FW_GAS_SHOTAREA";
	private _timeOut = _gasLogic getVariable "FW_GAS_TIMEOUT";

	if (_timeOut == -1 || _timeOut > time) then {
		_gasTrig = createTrigger ["EmptyDetector",_shotPos,false];
		_gasTrig setTriggerArea [_shotArea,_shotArea,0,false,_shotArea];
		_gasTrig setTriggerActivation ["ANYPLAYER","PRESENT",true];
		_gasTrig setTriggerStatements ["player in thisList || (vehicle player) in thisList","FW_GAS_AREALIST set [count FW_GAS_AREALIST,thisTrigger];","FW_GAS_AREALIST = FW_GAS_AREALIST - [thisTrigger];"];
	};

	if (_timeOut != -1 && _timeOut > CBA_missionTime) then {
		[{
			(_this select 1) <= time
		}, {
			GVAR(AREALIST) = GVAR(AREALIST) - [(_this select 0)];
			deleteVehicle (_this select 0);
		}, [_gasTrig, _timeOut]] call CBA_fnc_waitUntilAndExecute;
	};
};
