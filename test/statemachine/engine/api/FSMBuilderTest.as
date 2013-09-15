package statemachine.engine.api
{
import org.hamcrest.assertThat;
import org.hamcrest.object.instanceOf;
import org.hamcrest.object.isTrue;

import statemachine.engine.impl.StateRegistry;
import statemachine.engine.support.StateName;

public class FSMBuilderTest
{
    private var _classUnderTest:FSMBuilder;
    private var _registry:StateRegistry;


    [Before]
    public function before():void
    {
        _registry = new StateRegistry();
        _classUnderTest = new FSMBuilder( _registry );
    }

    [Test]
    public function configureState_returns_instance_of_StateBuilder():void
    {
        assertThat( _classUnderTest.configureState( StateName.CLIENT ), instanceOf( StateBuilder ) );
    }

    [Test]
    public function configureState_creates_new_state():void
    {
        _classUnderTest.configureState( StateName.CLIENT );
        assertThat( _registry.hasState( StateName.CLIENT ), isTrue() );
    }



}
}
