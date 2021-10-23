#include "core\vehGearCore.sqf" // DO NOT REMOVE

// Call this with [this, "LOADOUT"] call FNC_VehicleGearScript; in the Init field of the vehile
// Example:
// [this, "HUMMVEE"] call FNC_VehicleGearScript;

switch (_type) do {
	case "EMPTY": {
		_vehicle call FNC_RemoveAllVehicleGear;

	};

	case "IND_URAL": {
		_vehicle call FNC_RemoveAllVehicleGear;

		// Weapons / equipment
		["Binocular", 1] call FNC_AddItemVehicle;
		["launch_RPG7_F", 1] call FNC_AddItemVehicle;
		["CUP_Mine_M", 1] call FNC_AddItemVehicle;

		// Magazines
		["CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M", 10] call FNC_AddItemVehicle;
		["UK3CB_Enfield_10rnd_Mag_GT", 6] call FNC_AddItemVehicle;
		["rhs_30Rnd_762x39mm_Savz58_tracer", 7] call FNC_AddItemVehicle;
		["CUP_20Rnd_TE1_Green_Tracer_762x51_DMR", 3] call FNC_AddItemVehicle;
		["rhs_mag_762x25_8", 3] call FNC_AddItemVehicle;
		["rhs_weap_rshg2", 2] call FNC_AddItemVehicle;
		["RPG7_F", 3] call FNC_AddItemVehicle; // HEAT
		["rhs_rpg7_OG7V_mag", 2] call FNC_AddItemVehicle; // Anti-personnel

		// Medical
		["ACE_fieldDressing", 15] call FNC_AddItemVehicle;
		["ACE_elasticBandage", 20] call FNC_AddItemVehicle;
		["ACE_packingBandage", 20] call FNC_AddItemVehicle;
		["ACE_quikclot", 15] call FNC_AddItemVehicle;
		["ACE_atropine", 12] call FNC_AddItemVehicle;
		["ACE_morphine", 8] call FNC_AddItemVehicle;
		["ACE_epinephrine", 8] call FNC_AddItemVehicle;
		["ACE_tourniquet", 5] call FNC_AddItemVehicle;
		["ACE_bloodIV_500", 1] call FNC_AddItemVehicle;
		["ACE_surgicalKit", 2] call FNC_AddItemVehicle;
		["ACE_personalAidKit", 2] call FNC_AddItemVehicle;
		["ACE_salineIV", 2] call FNC_AddItemVehicle;
		["ACE_salineIV_250", 6] call FNC_AddItemVehicle;
		["ACE_salineIV_500", 10] call FNC_AddItemVehicle;

		// Additional
		["HandGrenade", 2] call FNC_AddItemVehicle;
		["SmokeShell", 3] call FNC_AddItemVehicle;
		["SmokeShellYellow", 1] call FNC_AddItemVehicle;
		["SmokeShellRed", 1] call FNC_AddItemVehicle;
		["SmokeShellPurple", 1] call FNC_AddItemVehicle;
		["SmokeShellOrange", 1] call FNC_AddItemVehicle;
		["SmokeShellGreen", 1] call FNC_AddItemVehicle;
		["SmokeShellBlue", 1] call FNC_AddItemVehicle;

	};

};
