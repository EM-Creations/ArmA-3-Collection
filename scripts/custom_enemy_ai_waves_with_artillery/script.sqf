// Set synchronized groups on game logics named as per set in "kobold_attackLogics"
// Place two AO checker marker shapes (square, rectangle, circle, whatever) on the map named "aoEast" and "aoWest"
// Edit the private variables to change some of the behaviour of the script
// Somewhere in the framework use ----- '' call compile preprocessFileLineNumbers "script.sqf"  ----- to CALL this script

diag_log "INFO: In custom_waves.sqf";

private _waitTimeBeforeFirstWave = 5; // How long to wait before the first wave is spawned
opfor_rivereastFlag = false;
opfor_riverwestFlag = false;

// Wait some time before setting the variable to enable spawning of the waves
[{
	missionNamespace setVariable ["var_spawnpeople",true,true];
},[],_waitTimeBeforeFirstWave] call CBA_fnc_waitAndExecute;

// Define an array to store which logics have wave groups synchronised with them
kobold_attackLogics = [];

// Define an array of logics to queue up spawning
kobold_attackQueue = [];

[{
	private _targetNumber = 30; // Currently unused

	// Check if the conditions are correct to trigger a spawning of a wave
	private _waitTimeCheck = 10; // How long to wait between checking which logics to queue up waves spawning from
	kobold_attackHandle = [{
		/* params ["_targetNumber","_handle"]; // Currently unused */
		private _bluforTriggerCount = 0; // How many remaining blufor need to be in the area for it to be considered overrun

		private _bluEast = {_x inArea "aoEast" && {side _x isEqualTo blufor}} count allUnits; // Number of blufor left in aoEast
		private _bluWest = {_x inArea "aoWest" && {side _x isEqualTo blufor}} count allUnits; // Number of blufor left in aoWest

		diag_log format ["INFO: Blufor east: %1 | Blufor west: %2", _bluEast, _bluWest];

		// Has the east position been overrun?
		if (_bluforTriggerCount >= _bluEast) then {
			opfor_rivereastFlag = true;
		};

		// Has the west position been overrun?
		if (_bluforTriggerCount >= _bluWest) then {
			opfor_riverwestFlag = true;
		};

		// If neither positions have been overrun
		if ((!opfor_rivereastFlag && !opfor_riverwestFlag) && (missionNamespace getVariable ["var_spawnpeople",false])) then {
			// Populate which synchronised game logics should be added to the queue
			kobold_attackLogics = [
			"WAVEEAST","WAVEWEST"
			];

			// Pick (randomly) one of the game logics to spawn a group from
			private _selection = selectRandom kobold_attackLogics;
			kobold_attackQueue pushBack _selection;
		};

		diag_log format ["INFO: (Checker) kobold_attackQueue = %1", kobold_attackQueue];

	}, _waitTimeCheck, _targetNumber] call CBA_fnc_addPerFrameHandler;

	// Handle spawning a wave and firing artillery
	private _waitTimeWaveInterval = 20; // How long to wait between waves spawning
	kobold_attackQueueHandle = [{
		// If there's a queued up wave to spawn
		if ((count kobold_attackQueue > 0)) then {
			private _selection = selectRandom kobold_attackQueue;
			_selection call PZAI_fnc_spawnArray;

			kobold_attackQueue = kobold_attackQueue - [_selection];

			["60MM",(position ARTY1)] call tin_fnc_ai_callFires;
			["80MM",(position ARTY1)] call tin_fnc_ai_callFires;
			["60MM",(position ARTY2)] call tin_fnc_ai_callFires;
			["80MM",(position ARTY2)] call tin_fnc_ai_callFires;
			["60MM",(position ARTY3)] call tin_fnc_ai_callFires;
			["80MM",(position ARTY3)] call tin_fnc_ai_callFires;
			["60MM",(position ARTY4)] call tin_fnc_ai_callFires;
			["80MM",(position ARTY4)] call tin_fnc_ai_callFires;
			["60MM",(position ARTY5)] call tin_fnc_ai_callFires;
			["80MM",(position ARTY5)] call tin_fnc_ai_callFires;
			["60MM",(position ARTY6)] call tin_fnc_ai_callFires;
			["80MM",(position ARTY6)] call tin_fnc_ai_callFires;
			["60MM",(position ARTY7)] call tin_fnc_ai_callFires;
			["80MM",(position ARTY7)] call tin_fnc_ai_callFires;
			["60MM",(position ARTY8)] call tin_fnc_ai_callFires;
			["80MM",(position ARTY8)] call tin_fnc_ai_callFires;
		};

		diag_log format ["INFO: (Handler) kobold_attackQueue = %1", kobold_attackQueue];
	}, _waitTimeWaveInterval, []] call CBA_fnc_addPerFrameHandler;
},[],5] call CBA_fnc_waitAndExecute;
