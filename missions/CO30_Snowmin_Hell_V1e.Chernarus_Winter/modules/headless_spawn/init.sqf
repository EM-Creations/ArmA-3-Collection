["Headless Spawn", "1.0", "Spawn units on a connected headless client.", "StatusRed &amp; PiZZADOX"] call FNC_RegisterModule;

#include "settings.sqf"

private _hcPresent = if (isNil "HC_1") then {false} else {true};

doSpawn = {
  private _run = 1;
  while {True} do {
    private _group = nil;
    sleep (300); // Sleep for 5 minutes between waves

    {
      _crewGroup = nil;

      _group = _x call FNC_SpawnUnits;
      _group setBehaviour "AWARE";
      _group addWaypoint [(getMarkerPos "marker_wp1"), -1];
      _group addWaypoint [(getMarkerPos "marker_wp2"), -1];
      _group addWaypoint [(getMarkerPos "marker_wp3"), -1];
      _group addWaypoint [(getMarkerPos "marker_wp4"), -1];

      // Vehicle round
      private _veh = nil;
      if (((_run % 4) == 0) || ((_run % 2) == 0)) then {
        if ((_run % 4) == 0) then { // Every 4th time
          _veh = "rhs_bmp1_msv" createVehicle getMarkerPos "marker_wp1";

        } else { // Every other time
          _veh = "UK3CB_ARD_O_UAZ_MG" createVehicle getMarkerPos "marker_wp1";
        };

        sleep(5);

        _crewGroup = [(getMarkerPos "marker_spawn"), [["O_Soldier_F", "ROYAL_PL"], ["O_Soldier_F", "ROYAL_RF"]], opfor] call FNC_SpawnUnits;
        _crewGroup addVehicle _veh;
        _crewGroup setBehaviour "AWARE";

        private _wp = _crewGroup addWaypoint [(getMarkerPos "marker_wp1"), -1];
        _wp setWaypointType 'GETIN';
        _crewGroup addWaypoint [(getMarkerPos "marker_wp2"), -1];
        _crewGroup addWaypoint [(getMarkerPos "marker_wp3"), -1];
        _crewGroup addWaypoint [(getMarkerPos "marker_wp4"), -1];
      };

      // Ural spawning each time
      _veh = "UK3CB_ARD_O_Ural_Open" createVehicle getMarkerPos "marker_wp1";

      sleep(5);

      _crewGroup = [(getMarkerPos "marker_spawn"), [["O_Soldier_F", "ROYAL_PL"], ["O_Soldier_F", "ROYAL_RF"]], opfor] call FNC_SpawnUnits;
      _crewGroup addVehicle _veh;
      _crewGroup setBehaviour "AWARE";

      _wp = _crewGroup addWaypoint [(getMarkerPos "marker_wp1"), -1];
      _wp setWaypointType 'GETIN';
      _crewGroup addWaypoint [(getMarkerPos "marker_wp2"), -1];
      _crewGroup addWaypoint [(getMarkerPos "marker_wp3"), -1];
      _crewGroup addWaypoint [(getMarkerPos "marker_wp4"), -1];

    } forEach _groups;
    _run = _run + 1;
  };
};

if (_hcPresent && isMultiplayer) then { // If HC is connected
  if (!isServer && !hasInterface) then { // If this unit is the HC
    call doSpawn;
  } else {
    // Do nothing.
  };
} else {
  if (isServer) then { // If HC isn't connected and this is the server
    call doSpawn;
  } else {
    // Do nothing.
  };
};
