package statemachine.engine.api
{
import statemachine.engine.impl.StateRegistry;

public class FSMBuilder
{
    private var stateRegistry:StateRegistry;

    public function FSMBuilder( stateRegistry:StateRegistry )
    {
        this.stateRegistry = stateRegistry;
    }

    public function configureState( stateName:String ):StateBuilder
    {
        return  new StateBuilder(
                stateRegistry.getState( stateName )
        );
    }


}
}
