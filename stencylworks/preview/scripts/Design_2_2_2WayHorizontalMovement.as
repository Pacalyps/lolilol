package scripts
{
	import flash.display.BlendMode;
	import flash.events.*;
	import flash.net.*;
	import flash.filters.*;
	
	import Box2DAS.Collision.*;
	import Box2DAS.Collision.Shapes.*;
	import Box2DAS.Common.*;
	import Box2DAS.Dynamics.*;
	import Box2DAS.Dynamics.Contacts.*;
	import Box2DAS.Dynamics.Joints.*;

	import stencyl.api.data.*;
	import stencyl.api.engine.*;
	import stencyl.api.engine.actor.*;
	import stencyl.api.engine.behavior.*;
	import stencyl.api.engine.bg.*;
	import stencyl.api.engine.font.*;
	import stencyl.api.engine.scene.*;
	import stencyl.api.engine.sound.*;
	import stencyl.api.engine.tile.*;
	import stencyl.api.engine.utils.*;
	
	import org.flixel.*;
	import mochi.as3.*;
	import flash.ui.Mouse;

	
	
	public dynamic class Design_2_2_2WayHorizontalMovement extends ActorScript
	{          	
	  
public var _RightControl:String;

public var _LeftControl:String;

public var _UseControls:Boolean = true;

public var _PreventVerticalMovement:Boolean = false;

public var _MoveX:Number = 0.0;

public var _LeftAnimation:String;

public var _RightAnimationIdle:String;

public var _StartY:Number = 0.0;

public var _Speed:Number = 30.0;

public var _LeftAnimationIdle:String;

public var _StopTurning:Boolean = true;

public var _RightAnimation:String;

public var _UseAnimations:Boolean = true;
    public function MoveLeft():void
{
        _MoveX = -1;
propertyChanged("_MoveX", _MoveX);
}

    public function MoveRight():void
{
        _MoveX = 1;
propertyChanged("_MoveX", _MoveX);
}


     
    override public function init():void
    {
                  _StartY = actor.getY();
propertyChanged("_StartY", _StartY);
    addWhenUpdatedListener(null, function(list:Array):void {
if(wrapper.enabled){
        if(_UseControls)
{
            _MoveX = (Number(isKeyDown(_RightControl)) - Number(isKeyDown(_LeftControl)));
propertyChanged("_MoveX", _MoveX);
}

        actor.setXVelocity((_MoveX * _Speed));
        if(_PreventVerticalMovement)
{
            actor.setY(_StartY);
            actor.setYVelocity(0);
}

        if((_StopTurning && !sameAs(_MoveX, 0)))
{
            actor.setAngularVelocity(Util.toRadians(0));
}

        _MoveX = 0;
propertyChanged("_MoveX", _MoveX);
        if(_UseAnimations)
{
            if(sameAs(actor.getXVelocity(), 0))
{
                if(sameAs(actor.getAnimation(), _LeftAnimation))
{
                    actor.setAnimation(_LeftAnimationIdle.toString());
}

                else if(sameAs(actor.getAnimation(), _RightAnimation))
{
                    actor.setAnimation(_RightAnimationIdle.toString());
}

}

            else if((actor.getXVelocity() < 0))
{
                actor.setAnimation(_LeftAnimation.toString());
}

            else if((actor.getXVelocity() > 0))
{
                actor.setAnimation(_RightAnimation.toString());
}

}

}
});

    }	      	
		
		public function Design_2_2_2WayHorizontalMovement(actor:Actor, scene:GameState)
		{
			super(actor, scene);
			nameMap["Right Control"] = "_RightControl";
nameMap["Left Control"] = "_LeftControl";
nameMap["Use Controls"] = "_UseControls";
nameMap["Prevent Vertical Movement"] = "_PreventVerticalMovement";
nameMap["Move X"] = "_MoveX";
nameMap["Left Animation"] = "_LeftAnimation";
nameMap["Right Animation (Idle)"] = "_RightAnimationIdle";
nameMap["Start Y"] = "_StartY";
nameMap["Speed"] = "_Speed";
nameMap["Left Animation (Idle)"] = "_LeftAnimationIdle";
nameMap["Stop Turning"] = "_StopTurning";
nameMap["Right Animation"] = "_RightAnimation";
nameMap["Use Animations"] = "_UseAnimations";
nameMap["Actor"] = "actor";

		}
		
		override public function forwardMessage(msg:String):void
		{
			
		}
	}
}