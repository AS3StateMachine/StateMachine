package statemachine.engine.impl
{
import flash.events.Event;

import statemachine.engine.api.CancellationReason;

public class TransitionEvent extends Event
{

    public static const PHASE_CHANGED:String = "TransitionEvent/phaseChanged";
    private var _state:State;
    private var _phase:TransitionPhase;
    private var _reason:CancellationReason;

    public function TransitionEvent( state:State,
                                     phase:TransitionPhase,
                                     reason:CancellationReason = null )
    {
        _state = state;
        _phase = phase;
        _reason = reason || CancellationReason.NULL;
        super( PHASE_CHANGED, false, false );
    }


    public function get state():State
    {
        return _state;
    }

    public function get phase():TransitionPhase
    {
        return _phase;
    }

    public function get reason():CancellationReason
    {
        return _reason;
    }


    public override function clone():Event
    {
        return new TransitionEvent( state, phase, reason );
    }
}
}
