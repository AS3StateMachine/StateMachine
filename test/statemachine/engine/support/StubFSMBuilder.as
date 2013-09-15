package statemachine.engine.support
{
import statemachine.engine.api.FSMBuilder;
import statemachine.engine.api.StateBuilder;

public class StubFSMBuilder extends FSMBuilder
{
    public function StubFSMBuilder()
    {
        super(null);
    }

    override public function configureState( stateName:String ):StateBuilder
    {
        return null;
    }
}
}
