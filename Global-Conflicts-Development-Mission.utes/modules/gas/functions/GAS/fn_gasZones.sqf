#include "script_component.hpp"

//Example, to be run only once, SERVER ONLY: ["GAS_CREATEHOTZONE", [position player, 100, 300]] call CBA_fnc_serverEvent;

if (!isDedicated && hasInterface) then {
	params ["_gasLogic"];

	private _shotPos = getPosATL _gasLogic;
	private _gasTrig = objNull;

	[{private _test = _gasLogic getVariable "GAS_SHOTAREA"; !isNil "_test";}, {
		params ["_gasLogic", "_shotPos", "_gasTrig"];
		[{private _test = _gasLogic getVariable "GAS_TIMEOUT"; !isNil "_test";}, {
			params ["_gasLogic", "_shotPos", "_gasTrig"];

			private _shotArea = _gasLogic getVariable "GAS_SHOTAREA";
			private _timeOut = _gasLogic getVariable "GAS_TIMEOUT";

			if (_timeOut == -1 || _timeOut > CBA_missionTime) then {
				_gasTrig = createTrigger ["EmptyDetector", _shotPos, false];
				_gasTrig setTriggerArea [_shotArea, _shotArea, 0, false, _shotArea];
				_gasTrig setTriggerActivation ["ANYPLAYER", "PRESENT", true];
				_gasTrig setTriggerStatements ["player in thisList || (vehicle player) in thisList","GAS_AREALIST set [count GAS_AREALIST, thisTrigger];","GAS_AREALIST = GAS_AREALIST - [thisTrigger];"];
			};

			if (_timeOut != -1 && _timeOut > CBA_missionTime) then {
				[{(_this select 1) <= CBA_missionTime}, {
					GVAR(AREALIST) = GVAR(AREALIST) - [(_this select 0)];
					deleteVehicle (_this select 0);
				}, [_gasTrig, _timeOut]] call CBA_fnc_waitUntilAndExecute;
			};
		}, [_gasLogic, _shotPos, _gasTrig]] call CBA_fnc_waitUntilAndExecute;
	}, [_gasLogic, _shotPos, _gasTrig]] call CBA_fnc_waitUntilAndExecute;
};
