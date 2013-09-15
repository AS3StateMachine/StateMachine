package statemachine.engine.api
{
import statemachine.engine.impl.TransitionPhase;

public interface FSMProperties
{
    function get currentStateName():String;

    function get currentPhase():TransitionPhase;
}
}
