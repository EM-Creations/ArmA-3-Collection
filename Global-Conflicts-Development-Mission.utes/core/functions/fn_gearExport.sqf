// Usage:
// If you wish to use this script from a trigger use the following trigger parameters:
// Activation: Select the side of your unit.
// Repeatedly
// On Activation: nul = (thisList select 0) call FW_fnc_gearExport;
//
// Now simply walk into the trigger and the script will export the gear of the unit to your clipboard.
//
// If you wish to use this script outside of a trigger use this:
// _unit call FW_fnc_gearExport;
//
// Where _unit is the unit the script will scan.

private ["_unit", "_items", "_script", "_addItem"];

_unit = _this;
_items = [];
_script = "";


// Clothings //

if (uniform _unit isNotEqualTo "") then {
	_script = _script + '["' + (uniform _unit) + '"] call FNC_AddItem;
	';
};

if (vest _unit isNotEqualTo "") then {
	_script = _script + '["' + (vest _unit) + '"] call FNC_AddItem;
	';
};

if (backpack _unit isNotEqualTo "") then {
	_script = _script + '["' + (backpack _unit) + '"] call FNC_AddItem;
	';
};

_script = _script + "
";

// Headgear //

if (headgear _unit isNotEqualTo "") then {
	_script = _script + '["' + (headgear _unit) + '"] call FNC_AddItem;
	';
};

if (goggles _unit isNotEqualTo "") then {
	_script = _script + '["' + (goggles _unit) + '"] call FNC_AddItem;
	';
};

_script = _script + "
";


// Assigned Items //

if (assignedItems _unit isNotEqualTo []) then {
	{
		if (_x == "ItemRadioAcreFlagged") then {
			_x = "ItemRadio";
		};

		_script = _script + '["' + _x + '"] call FNC_AddItem;
		';
	} forEach assignedItems _unit;
};

// Items //

_addItem = {
	private ["_item", "_slot", "_new"];

	_item = _this select 0;
	_slot = _this select 1;
	_new = true;

	{
		if ((_x select 0) == _item && (_x select 2) == _slot) exitWith {
			_x set [1, (_x select 1) + 1];
			_new = false;
		};
	} forEach _items;

	if (_new) then {
		_items set [count _items, [_item, 1, _slot]];
	};
};


{[_x, "uniform"] call _addItem} forEach uniformItems _unit;
{[_x, "vest"] call _addItem} forEach vestItems _unit;
{[_x, "backpack"] call _addItem} forEach backpackItems _unit;


_script = _script + "
";

{
	_script = _script + (str _x) + ' call FNC_AddItem;
	';
} forEach _items;


// Weapons / Attachments //

if (primaryWeapon _unit isNotEqualTo "") then {
	_script = _script + '
	["' + (primaryWeapon _unit) + '"] call FNC_AddItem;
	';
};

{
	if (_x isNotEqualTo "") then {
		_script = _script + '_unit addPrimaryWeaponItem "' + _x + '";
		';
	};
} forEach primaryWeaponItems _unit;

if (secondaryWeapon _unit isNotEqualTo "") then {
	_script = _script + '
	["' + (secondaryWeapon _unit) + '"] call FNC_AddItem;
	';
};

{
	if (_x isNotEqualTo "") then {
		_script = _script + '_unit addSecondaryWeaponItem "' + _x + '";
		';
	};
} forEach secondaryWeaponItems _unit;

if (handgunWeapon _unit isNotEqualTo "") then {
	_script = _script + '
	["' + (handgunWeapon _unit) + '"] call FNC_AddItem;
	';
};

{
	if (_x isNotEqualTo "") then {
		_script = _script + '_unit addHandgunItem "' + _x + '";';
	};
} forEach handgunItems _unit;


copyToClipboard _script;
hint "Gear script exported to the clipboard!";
