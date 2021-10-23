//AUTHOR: StatusRed

#define package "GUER_"

SET_GROUP(UNIFORM)
	["LOP_U_CHR_Woodlander_01", "LOP_U_CHR_Woodlander_02", "LOP_U_CHR_Woodlander_03", "LOP_U_CHR_Woodlander_04"] call FNC_AddItemRandom;
	["V_BandollierB_oli", "V_BandollierB_blk", "V_BandollierB_rgr", "V_BandollierB_khk"] call FNC_AddItemRandom;
	["rhs_sidor"] call FNC_AddItem;

END_GROUP;

SET_GROUP(UNIFORM_SL)
	["CUP_U_O_RUS_Ratnik_Winter"] call FNC_AddItem;
	["V_BandollierB_oli", "V_BandollierB_blk", "V_BandollierB_rgr", "V_BandollierB_khk"] call FNC_AddItemRandom;
	["H_ShemagOpen_khk", "LOP_H_Shemag_GRE", "LOP_H_Shemag_BLU", "LOP_H_Shemag_OLV"] call FNC_AddItemRandom;
	["rhs_sidor"] call FNC_AddItem;

END_GROUP;

SET_GROUP(UNIFORM_MEDIC)
	["U_C_Uniform_Scientist_01_F"] call FNC_AddItem;
	["V_BandollierB_oli", "V_BandollierB_blk", "V_BandollierB_rgr", "V_BandollierB_khk"] call FNC_AddItemRandom;
	["UK3CB_CHC_C_B_MED"] call FNC_AddItem;
	["fow_h_us_m1_medic"] call FNC_AddItem;

END_GROUP;

SET_GROUP(MEDS)
	["ACE_splint", 1] call FNC_AddItem;
	["ACE_bloodIV_250", 1] call FNC_AddItem;
	["ACE_fieldDressing", 3] call FNC_AddItem;
	["ACE_elasticBandage", 3] call FNC_AddItem;
	["ACE_packingBandage", 3] call FNC_AddItem;
	["ACE_quikclot", 3] call FNC_AddItem;
	["ACE_morphine", 1] call FNC_AddItem;
	["ACE_epinephrine", 1] call FNC_AddItem;
	["ACE_tourniquet", 1] call FNC_AddItem;
END_GROUP;

SET_GROUP(ITEMS)
	["ItemMap"] call FNC_AddItem;
	["ItemCompass"] call FNC_AddItem;
	["ItemWatch"] call FNC_AddItem;
	["ACE_MapTools"] call FNC_AddItem;
	["ACE_earplugs"] call FNC_AddItem;
END_GROUP;

SET_GROUP(GUN)
[_unit, _type, 6,
["uk3cb_ak47", "UK3CB_Enfield", "CUP_srifle_M14_DMR", "rhs_weap_m92", "rhs_30Rnd_762x39mm_Savz58_tracer", "CUP_smg_Mac10",
 "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M", "UK3CB_Enfield_10rnd_Mag_GT", "CUP_30Rnd_45ACP_MAC10_M", "CUP_20Rnd_TE1_Green_Tracer_762x51_DMR", "rhs_30Rnd_762x39mm_Savz58_tracer"]] call FNC_WepHelper;
END_GROUP;

case (package + "SL"): {
	ADD_GROUP(UNIFORM_SL);
	ADD_GROUP(MEDS);
	ADD_GROUP(ITEMS);

	["Binocular"] call FNC_AddItem;
	["ACRE_PRC343"] call FNC_AddItem;
	["ACE_Fortify"] call FNC_AddItem;

	["rhs_mag_rdg2_white", 2] call FNC_AddItem; // White smoke
	["rhs_mag_rgd5", 1] call FNC_AddItem; // Frag grenade

	ADD_GROUP(GUN);
};

case (package + "MEDIC"): {
	ADD_GROUP(UNIFORM_MEDIC);
	ADD_GROUP(MEDS);
	ADD_GROUP(ITEMS);

	["ACE_salineIV", 1] call FNC_AddItem;
	["ACE_salineIV_250", 5] call FNC_AddItem;
	["ACE_salineIV_500", 4] call FNC_AddItem;
	["ACE_surgicalKit", 1] call FNC_AddItem;
	["ACE_morphine", 6] call FNC_AddItem;
	["ACE_epinephrine", 6] call FNC_AddItem;
	["ACE_splint", 3] call FNC_AddItem;
	["ACE_tourniquet", 3] call FNC_AddItem;

	["rhs_mag_rdg2_white", 3] call FNC_AddItem; // White smoke

	["CUP_30Rnd_45ACP_MAC10_M", 2] call FNC_AddItem;

	["CUP_smg_Mac10"] call FNC_AddItem; // Primary rifle

};


case (package + "R"): {
	ADD_GROUP(UNIFORM);
	ADD_GROUP(MEDS);
	ADD_GROUP(ITEMS);
	ADD_GROUP(GUN);
	["ACE_EntrenchingTool"] call FNC_AddItem;
};

case (package + "ASSET"): {
	ADD_GROUP(UNIFORM);
	ADD_GROUP(MEDS);
	ADD_GROUP(ITEMS);

	[_unit, _type, 6,
	["rhs_weap_t5000", "optic_LRPS", "CUP_srifle_M14_DMR", "rhs_5Rnd_338lapua_t5000", "rhs_weap_maaws", "rhs_optic_maaws",
	 "rhs_mag_maaws_HEAT", "launch_NLAW_F"]] call FNC_WepHelper;

};
