package statemachine.engine.impl
{
import statemachine.engine.api.FSM;

public class StateMachineDriver implements FSM
{
    private var _engine:StateMachineEngine;
    private var _provider:StateProvider;
    private var _props:StateMachineProperties;

    public function StateMachineDriver( engine:StateMachineEngine, provider:StateProvider, props:StateMachineProperties ):void
    {
        _engine = engine;
        _provider = provider;
        _props = props;

    }

    public function changeState( targetState:String ):Boolean
    {
        if ( _provider.hasState( targetState ) )
        {
            const target:State = _provider.getState( targetState );
            _engine.changeState(target, _props);
        }
        return true;
    }
}
}
