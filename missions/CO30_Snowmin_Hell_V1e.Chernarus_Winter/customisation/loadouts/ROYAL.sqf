//AUTHOR: StatusRed
//

#define package "ROYAL_"

SET_GROUP(uniform)
	["UK3CB_TKP_O_H_Patrolcap_Blk"] call FNC_AddItem;
	["U_BG_Guerilla2_1", "U_BG_Guerilla2_3"] call FNC_AddItemRandom;
	["UK3CB_TKP_O_B_ASS_BLK"] call FNC_AddItem; //Backpack
END_GROUP;

SET_GROUP(uniform_officer)
	["UK3CB_TKP_I_U_Officer_BLK"] call FNC_AddItem;
	["UK3CB_H_Beret_Officer"] call FNC_AddItem;
	["UK3CB_TKP_O_B_ASS_BLK"] call FNC_AddItem; //Backpack
END_GROUP;

SET_GROUP(IFAK)
	["ACE_fieldDressing", 3] call FNC_AddItem;
	["ACE_elasticBandage", 3] call FNC_AddItem;
	["ACE_packingBandage", 3] call FNC_AddItem;
	["ACE_quikclot", 3] call FNC_AddItem;
	["ACE_morphine", 1] call FNC_AddItem;
	["ACE_epinephrine", 1] call FNC_AddItem;
	["ACE_tourniquet", 1] call FNC_AddItem;
END_GROUP;

SET_GROUP(items)
	["ItemMap"] call FNC_AddItem;
	["ItemCompass"] call FNC_AddItem;
	["ItemWatch"] call FNC_AddItem;
	["ACE_MapTools"] call FNC_AddItem;
	["ACE_earplugs"] call FNC_AddItem;
END_GROUP;

case (package + "PL"): { //Platoon Leader
	["Binocular"] call FNC_AddItem;

	ADD_GROUP(uniform_officer);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);

	["rhs_mag_an_m8hc",2] call FNC_AddItem; //Smoke Grenade

	["CUP_16Rnd_9x19_cz75", 4] call FNC_AddItem; //Magazines

	["CUP_hgun_CZ75"] call FNC_AddItem;

};

case (package + "RF"): { //Rifleman
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);

	["rhs_mag_m67", 1] call FNC_AddItem; //Frag Grenade

	["CUP_30Rnd_TE1_Red_Tracer_545x39_AK74M_M", 4] call FNC_AddItem; //Magazines

	["rhs_weap_aks74"] call FNC_AddItem; //Primary Rifle

};

case (package + "MG"): { //Machine Gunner
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);

	["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M", 2] call FNC_AddItem; //M60 Belts

	["CUP_lmg_PKM"] call FNC_AddItem; //Primary MG

};
