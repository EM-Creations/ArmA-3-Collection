#include "script_component.hpp"

_this spawn
{
  private _unit = _this select 0;
  private _target = _this select 1;
  private _mils = _this select 2;
  private _distance = _this select 3;
  private	_roundType = _this select 4;
  private	_loc = [_target,true] call CBA_fnc_mapGridToPos;
  private	_degrees = MILSPERROUND / _mils * 360.0;
  private _dir = [cos _degrees,sin _degrees,0];
  private _target =  _loc vectorAdd (_dir vectorMultiply _distance);

  private	_fireRate = _unit call FUNC(FIREMIS_ArtGetFireRate);
  [_unit , true] call FUNC(FIREMIS_Dia_SetArtyReadyStatus);

  /* private	_rounds = ((_unit call FUNC(FIREMIS_Dia_GetArtyAmmo)) select _roundType); */
  _unit setVariable [VAR_SART_ARTFMTEXT,_this call FUNC(FIREMIS_GetPolarSpottingFiremissionText),true];

  sleep((_unit call FUNC(FIREMIS_Dia_GetArtyAimTime)));
  private _randomPos = [[[_target, _unit getVariable [VAR_SART_ARTSPOTACCURACY,MEANSPOTTINGACCURACY]]],[]] call BIS_fnc_randomPos;
  /* private _eta = [_unit,_randomPos, ((_unit call FUNC(FIREMIS_Dia_GetArtyAmmo)) select _roundType) select 0] call FUNC(FIREMIS_Dia_GetArtyEta); */
  _unit commandArtilleryFire [_randomPos,  ((_unit call FUNC(FIREMIS_Dia_GetArtyAmmo)) select _roundType) select 0, 1];
  private _waitTime = (_fireRate * (_unit getVariable [VAR_SART_ARTFIRERATE,MEANFIRERATE]));

  [{
    [_this, objNULL] call FUNC(FIREMIS_Dia_SetArtyCaller);
    [_this, false] call FUNC(FIREMIS_Dia_SetArtyReadyStatus);
  }, _unit, _waitTime] call CBA_fnc_waitAndExecute;
};
