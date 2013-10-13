package statemachine.engine
{
import statemachine.engine.api.*;

import org.swiftsuspenders.Injector;

import statemachine.engine.impl.StateDispatcher;
import statemachine.engine.impl.StateMachineDriver;
import statemachine.engine.impl.StateMachineEngine;
import statemachine.engine.impl.StateMachineProperties;
import statemachine.engine.impl.StateProvider;
import statemachine.engine.impl.TransitionInspector;

public class FSMConfiguration
{
    internal var injector:Injector;

    public function FSMConfiguration( injector:Injector )
    {
        this.injector = injector.createChildInjector();
    }

    public function configure():void
    {
        injector.map( Injector ).toValue( injector );
        injector.map( StateProvider ).asSingleton();
        injector.map( StateMachineProperties ).asSingleton();
        injector.map( StateDispatcher ).asSingleton(  );
        injector.map( StateMachineEngine ).asSingleton();
        injector.map( TransitionInspector );

        const dispatcher:FSMDispatcher = injector.getOrCreateNewInstance( StateDispatcher );
        injector.parentInjector.map( FSMDispatcher ).toValue( dispatcher );

        const builder:FSMBuilder = injector.instantiateUnmapped( FSMBuilder );
        injector.parentInjector.map( FSMBuilder ).toValue( builder );

        const fsm:StateMachine = injector.instantiateUnmapped( StateMachineDriver );
        injector.parentInjector.map( StateMachine ).toValue( fsm );

    }


}
}
