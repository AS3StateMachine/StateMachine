package statemachine.engine.impl
{
import statemachine.engine.api.CancellationReason;
import statemachine.engine.api.FSMProperties;

public class StateMachineProperties implements FSMProperties
{
    internal var current:State = State.NULL;
    internal var target:State = State.NULL;
    internal var phase:TransitionPhase = TransitionPhase.NULL;
    internal var reason:CancellationReason = CancellationReason.NULL;

    public function get currentStateName():String
    {
        return current.name;
    }

    public function get currentPhase():TransitionPhase
    {
        return phase;
    }


}
}
