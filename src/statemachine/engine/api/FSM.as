package statemachine.engine.api
{
public interface FSM
{
    function get properties ():FSMProperties
    function changeState( targetState:String ):Boolean;

}
}
