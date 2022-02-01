/*
 * Author: StatusRed
 *
 * FW_fnc_refreshCO
 *
 * Provided with a side, this function will immediately refresh, determine who the Command Officer should be and return it for a specific side
 *
 * Arguments:
 * 0: side <side>
 *
 * Return Value:
 * Commanding Officer <unit>
 *
 * Public: Yes <Client-side only>
 */

#include "script_component.hpp"

params [
  ["_side", blufor, [blufor]]
];

private _co = objNull;

private _var = switch (_side) do {
    case west: {
        QGVAR(CO_Blufor)
    };
    case east: {
        QGVAR(CO_Opfor)
    };
    case independent: {
        QGVAR(CO_Indfor)
    };
    case civilian: {
        QGVAR(CO_Civfor)
    };
};

GVAR(CheckingCoC) = true;

TRACE_1("Triggering %1 event!", QGVAR(requestCOEvent));
[QGVAR(requestCOEvent), [_side, player]] call CBA_fnc_serverEvent;

[{GVAR(CheckingCoC) isEqualTo false},{
  params["_co", "_var"];
  _co = missionNamespace getVariable [_var, objNull];

  _co
}, [_co, _var]] call CBA_fnc_waitUntilAndExecute;
