#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: CBA_statemachine_fnc_clockwork

Description:
    Clockwork which runs all state machines.

Parameters:
    None

Returns:
    Nothing

Author:
    BaerMitUmlaut & PIZZADOX
---------------------------------------------------------------------------- */


private _fnc_repeat = {
    params ["_stateMachine", "_list", "_skipNull", "_id"];
    private _tick = _stateMachine getVariable QGVAR(tick);

    // Skip to next non-null element or end of list
    if (_skipNull) then {
        while {(_tick < count _list) && {isNull (_list select _tick)}} do {
            _tick = _tick + 1;
        };
    };

    // When the list was iterated through, jump back to start and update it
    if (_tick >= count _list) then {
        private _updateCode = _stateMachine getVariable QGVAR(updateCode);
        _tick = 0;
        if (_updateCode isNotEqualTo {}) then {
            _list = [] call _updateCode;

            // Make sure list contains no null elements in case the code doesn't filter them
            // Else they wouldn't be skipped at this point which could cause errors
            if (_skipNull) then {
                _list = _list select {!isNull _x};
            };

            _stateMachine setVariable [QGVAR(list), _list];
        };
    };

    if (_list isNotEqualTo []) then {
        _stateMachine setVariable [QGVAR(tick), _tick + 1];

        private _current = _list select _tick;
        private _thisState = _current getVariable (QGVAR(state) + str _id);
        private _lastCheck = _current getVariable [(QGVAR(lastCheck) + str _id),CBA_missionTime];

        if (isNil "_thisState") then {
            // Item is new and gets set to the intial state, onStateEntered
            // function of initial state gets executed as well.
            _thisState = _stateMachine getVariable QGVAR(initialState);
            _current setVariable [QGVAR(state) + str _id, _thisState];
            _current setVariable [QGVAR(lastCheck) + str _id, CBA_missionTime];
            _current call (_stateMachine getVariable ONSTATEENTERED(_thisState));
        };

        // onState functions can use:
        //   _stateMachine - the state machine
        //   _this         - the current list item
        //   _thisState    - the current state
        _current call (_stateMachine getVariable ONSTATE(_thisState));

        private _thisOrigin = _thisState;
        {
            _x params ["_thisTransition", "_condition", "_thisTarget", "_onTransition", ["_condFrequency",0,[0]]];
            // Transition conditions, onTransition, onStateLeaving and
            // onStateEntered functions can use:
            //   _stateMachine   - the state machine
            //   _this           - the current list item
            //   _thisTransition - the current transition we're in
            //   _thisOrigin     - the state we're coming from
            //   _thisState      - same as _thisOrigin
            //   _thisTarget     - the state we're transitioning to
            // Note: onTransition and onStateLeaving functions can change
            //       the transition target by overwriting the passed
            //       _thisTarget variable.
            // Note: onStateEntered functions of initial states won't have
            //       some of these variables defined.
            if ((CBA_missionTime >= (_lastCheck + _condFrequency)) && {_current call _condition}) exitWith {
                _current call (_stateMachine getVariable ONSTATELEAVING(_thisOrigin));
                _current call _onTransition;
                _current setVariable [QGVAR(state) + str _id, _thisTarget];
                _current setVariable [QGVAR(lastCheck) + str _id, CBA_missionTime];
                _current call (_stateMachine getVariable ONSTATEENTERED(_thisTarget));
            };
        } forEach (_stateMachine getVariable TRANSITIONS(_thisState));
    };
};

GVAR(stateMachines) apply {
    #ifdef STATEMACHINE_PERFORMANCE_COUNTERS
    private _perfStartTime = diag_tickTime;
    #endif
    private _stateMachine = _x;
    private _list = _stateMachine getVariable QGVAR(list);
    private _skipNull = _stateMachine getVariable QGVAR(skipNull);
    private _id = _stateMachine getVariable QGVAR(ID);
    private _repeatPerFrame = _stateMachine getVariable QGVAR(repeatPerFrame);

    for "_t" from 0 to _repeatPerFrame step 1 do {
        [_stateMachine, _list, _skipNull, _id] call _fnc_repeat;
    };

    #ifdef STATEMACHINE_PERFORMANCE_COUNTERS
    private _perfRunTime = diag_tickTime - _perfStartTime;
    (GVAR(performanceCounters) select _id) pushBack _perfRunTime;
    #endif

};
