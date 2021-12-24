#include "script_component.hpp"

GVAR(GASLOGICS) apply {
	["FW_GAS_GASZONES", _x] spawn CBA_fnc_globalEvent;
	sleep 0.25;
};
