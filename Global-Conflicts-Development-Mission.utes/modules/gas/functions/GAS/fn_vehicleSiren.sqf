// AUTHOR: StatusRed
#include "script_component.hpp"

if (!isServer) exitWith {};

sleep 0.5 + (random 5);

private _veh = _this select 0;
_veh setVariable ["FW_GAS_VEHALARM_ON", true, true];

while {alive _veh} do {
	GVAR(GASLOGICS) apply {
		private _shotArea = _x getVariable ["FW_GAS_SHOTAREA", 0];
		private _timeOut = _x getVariable ["FW_GAS_TIMEOUT", -1];

		if (_timeOut == -1 || _timeOut > time) then {
			if (_veh distance _x < _shotArea) then {
				if (_veh getVariable "FW_GAS_VEHALARM_ON") then {
					[_veh, ["ABCA_M42", 50]] remoteExec ["say3D"];
				};

				sleep 0.75;
			};
		};
	};
};
