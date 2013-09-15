package statemachine.engine.impl
{
import statemachine.engine.api.*;

public class UndeclaredTarget extends  CancellationReason
{
    public function UndeclaredTarget(  desc:String = "" )
    {
        super( "reason/undeclaredTarget", desc );
    }

}
}
