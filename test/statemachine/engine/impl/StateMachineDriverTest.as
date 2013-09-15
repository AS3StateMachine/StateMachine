package statemachine.engine.impl
{
import org.hamcrest.assertThat;
import org.hamcrest.object.equalTo;
import org.hamcrest.object.instanceOf;
import org.hamcrest.object.nullValue;
import org.hamcrest.object.strictlyEqualTo;

import statemachine.engine.api.FSMProperties;
import statemachine.engine.support.MockStateMachineEngine;
import statemachine.engine.support.MockStateProvider;
import statemachine.engine.support.StateName;

public class StateMachineDriverTest
{
    private var _provider:MockStateProvider;
    private var _engine:MockStateMachineEngine;
    private var _classUnderTest:StateMachineDriver;
    private var _props:StateMachineProperties;


    [Before]
    public function before():void
    {
        _engine = new MockStateMachineEngine();
        _provider = new MockStateProvider();
        _props = new StateMachineProperties();
        _classUnderTest = new StateMachineDriver( _engine, _provider, _props );
    }

    [Test]
    public function properties_returns_instanceOf_FSMProperties():void
    {
        assertThat( _classUnderTest.properties, instanceOf( FSMProperties ) );
    }

    [Test]
    public function properties_returns_StateMachineProperties_passed_in_constructor():void
    {
        assertThat( _classUnderTest.properties, strictlyEqualTo( _props ) );
    }

    [Test]
    public function when_changeState_called_driver_checks_state_exists():void
    {
        _classUnderTest.changeState( StateName.ONE );
        assertThat( _provider.targetChecked, equalTo( StateName.ONE ) );
    }

    [Test]
    public function when_state_exists__driver_gets_state():void
    {
        setHasState( true );
        _classUnderTest.changeState( StateName.ONE );
        assertThat( _provider.targetsGot, equalTo( StateName.ONE ) );
    }

    [Test]
    public function when_state_does_not_exists__driver_does_not_get_state():void
    {
        setHasState( false );
        _classUnderTest.changeState( StateName.ONE );
        assertThat( _provider.targetsGot, nullValue() );
    }

    [Test]
    public function when_state_exists__driver_calls_engine_changeState_with_target_State():void
    {
        const state:State = new State( StateName.TARGET );
        setHasState( true );
        setTargetState( state );
        _classUnderTest.changeState( StateName.ONE );
        assertThat( _engine.targetStateReceived, strictlyEqualTo( state ) );
    }

    private function setHasState( hasState:Boolean ):void
    {
        _provider.hasStateValue = hasState;
    }

    private function setTargetState( state:State ):void
    {
        _provider.stateValue = state;
    }
}
}
