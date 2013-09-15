package statemachine.engine.impl
{
public class NestedTransitionError extends Error
{
    public function NestedTransitionError( props:StateMachineProperties )
    {
        super( "State change attempted from phase "
                + props.phase
                + " of an currently executing transition from state "
                + props.current
                + " to state "
                + props.target );
    }

}
}
