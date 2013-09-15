package statemachine.engine.api
{
import statemachine.engine.impl.State;

public class StateBuilder
{
    internal var state:State;

    public function StateBuilder( clientState:State ):void
    {
        state = clientState;
    }

    public function withEntryGuards( ...guards ):StateBuilder
    {
        for each ( var guard:* in guards )
            state.addEntryGuard( guard );

        return this;
    }

    public function withExitGuards( ...guards ):StateBuilder
    {
        for each ( var guard:* in guards )
            state.addExitGuard( guard );

        return this;
    }

    public function withTargets( ...states ):StateBuilder
    {
        for each ( var name:String in states )
        {
            state.addTarget( name );
        }

        return this;
    }


}
}
