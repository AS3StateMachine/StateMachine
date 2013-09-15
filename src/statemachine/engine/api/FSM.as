package statemachine.engine.api
{
public interface FSM
{
    function changeState( targetState:String ):Boolean;

}
}
