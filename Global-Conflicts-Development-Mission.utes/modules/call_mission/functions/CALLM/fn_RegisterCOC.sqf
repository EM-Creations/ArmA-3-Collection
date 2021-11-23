#include "script_component.hpp"

params [
	["_side", sideUnknown, [sideUnknown]],
	["_coc", [], [[]]]
];

GVAR(COC) set [count GVAR(COC), [_side, _coc]];
