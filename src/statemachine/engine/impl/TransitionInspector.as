package statemachine.engine.impl
{
import org.swiftsuspenders.Injector;

import statemachine.engine.api.CancellationReason;

public class TransitionInspector
{
    private var _injector:Injector;


    public function TransitionInspector( injector:Injector )
    {
        _injector = injector;
    }

    public function inspect( props:StateMachineProperties ):Approval
    {
        const current:State = props.current;
        const target:State = props.target;
        if ( !current.hasTarget( target.name ) )
            return new Approval( false, getUndeclaredTargetReason( current, target ) );

        const exitApproval:Approval = approveGuards( current.exitGuards, _injector );
        if ( !exitApproval.approved ) return exitApproval;

        const entryApproval:Approval = approveGuards( target.entryGuards, _injector );
        if ( !entryApproval.approved ) return entryApproval;


        return new Approval();
    }

    private static function approveGuards( exitGuards:Vector.<Class>, injector:Injector ):Approval
    {
        for each( var guardClass:Class in exitGuards )
        {
            const guard:* = injector.instantiateUnmapped( guardClass );
            if ( !guard.approve() )
            {
                return new Approval( false, getReason( guard ) );
            }
        }
        return new Approval();
    }

    private static function getReason( guard:* ):CancellationReason
    {
        if ( guard.hasOwnProperty( "getReason" ) && guard.getReason is Function )
        {
            return guard.getReason();
        }
        return CancellationReason.NULL;
    }

    private static function getUndeclaredTargetReason( current:State, target:State ):CancellationReason
    {
        return new UndeclaredTarget( "state " + target.name + "is undeclared in " + current.name );
    }
}
}
