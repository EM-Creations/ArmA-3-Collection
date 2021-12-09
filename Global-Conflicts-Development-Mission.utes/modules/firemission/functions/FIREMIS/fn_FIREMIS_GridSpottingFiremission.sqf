#include "script_component.hpp"

_this spawn
{
  /* diag_log format ["INFO: Grid spotting firemission! _this =  %1", _this]; */
  private _unit = _this select 0;
  private _target = _this select 1;
  private	_roundType = _this select 2;
  private	_fireRate = _unit call FUNC(FIREMIS_ArtGetFireRate);
  [_unit , true] call FUNC(FIREMIS_Dia_SetArtyReadyStatus);

  /* private	_rounds = ((_unit call FUNC(FIREMIS_Dia_GetArtyAmmo)) select _roundType); */
  _unit setVariable [VAR_SART_ARTFMTEXT,_this call FUNC(FIREMIS_GetGridSpottingFiremissionText),true];

  sleep((_unit call FUNC(FIREMIS_Dia_GetArtyAimTime)));
  private _randomPos = [[[_target, _unit getVariable [VAR_SART_ARTSPOTACCURACY,MEANSPOTTINGACCURACY]]],[]] call BIS_fnc_randomPos;
  /* private _eta = [_unit,_randomPos, ((_unit call FUNC(FIREMIS_Dia_GetArtyAmmo)) select _roundType) select 0] call FUNC(FIREMIS_Dia_GetArtyEta); */
  _unit commandArtilleryFire [_randomPos,  ((_unit call FUNC(FIREMIS_Dia_GetArtyAmmo)) select _roundType) select 0, 1];
  private _waitTime = (_fireRate * (_unit getVariable [VAR_SART_ARTFIRERATE,MEANFIRERATE]));

  [{
    /* diag_log format ["INFO: Wait and execute _this =  %1", _this]; */
    _this params ["_unit", "_target", "_roundType"];
    [_unit, objNULL] call FUNC(FIREMIS_Dia_SetArtyCaller);
    [_unit, false] call FUNC(FIREMIS_Dia_SetArtyReadyStatus);
    private _roundClassName = ((_unit call FUNC(FIREMIS_Dia_GetArtyAmmo)) select _roundType) select 0;

    [_unit, _target, _roundClassName] call FUNC(FIREMIS_InternalSpottingFiremission);
  }, [_unit, _target, _roundType], _waitTime] call CBA_fnc_waitAndExecute;

};
