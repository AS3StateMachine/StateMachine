package statemachine.engine.impl
{
import statemachine.engine.api.*;

public class IllegalTransitionInPhase extends  CancellationReason
{
    public function IllegalTransitionInPhase(  desc:String = "" )
    {
        super( "reason/illegalTransitionInPhase", desc );
    }

}
}
