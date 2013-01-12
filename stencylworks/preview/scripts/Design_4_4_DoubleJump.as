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

	
	
	public dynamic class Design_4_4_DoubleJump extends ActorScript
	{          	
	  
public var _JumpKey:String;

public var _JumpForce:Number = 25.0;

public var _JumpSound:SoundClip;

public var _JumpRightAnimation:String;

public var _JumpLeftAnimation:String;

public var _AirJumped:Boolean = false;

public var _AirJumpForce:Number = 30.0;

     
    override public function init():void
    {
                  actor.setActorValue("On Ground?", false);
    addWhenUpdatedListener(null, function(list:Array):void {
if(wrapper.enabled){
        print("" + actor.getCurrentFrame());
        /* "Jump" */
        if((isKeyPressed(_JumpKey) && sameAs(actor.getActorValue("On Ground?"), true)))
{
            playSound(_JumpSound);
            actor.applyImpulse(0, -1, _JumpForce);
            /* "Give the Actor a chance to get off the ground" */
            runLater(1000 * 0.075, function(timeTask:TimedTask):void {
                        if(actor.isAlive())
{
                            actor.setActorValue("On Ground?", false);
}

}, actor);
}

        if(((sameAs(_AirJumped, false) && sameAs(actor.getActorValue("On Ground?"), false)) && isKeyPressed(_JumpKey)))
{
            playSound(_JumpSound);
            actor.setVelocity(0, 0);
            actor.applyImpulse(0, -1, _AirJumpForce);
            _AirJumped = true;
propertyChanged("_AirJumped", _AirJumped);
}

        /* "Switch to jumping animations" */
        if(sameAs(actor.getActorValue("On Ground?"), false))
{
            if(sameAs(actor.getActorValue("Facing Right?"), true))
{
                actor.setAnimation(_JumpRightAnimation.toString());
                actor.setCurrentFrame(0);
}

            else
{
                actor.setAnimation(_JumpLeftAnimation.toString());
                actor.setCurrentFrame(0);
}

}

}
});
    addCollisionListener(actor, function(list:Array, event:Collision):void {
if(wrapper.enabled){
        /* "Has the Actor collided with the ground?" */
        if(event.thisCollidedWithTile)
{
            for each(var point:CollisionPoint in event.points)
{
                if((Math.abs(Math.round(GameState.toPixelUnits(point.normal.y))) > 0.1))
{
                    actor.setActorValue("On Ground?", true);
}

}

}

        if(event.thisFromBottom)
{
            _AirJumped = false;
propertyChanged("_AirJumped", _AirJumped);
}

}
});

    }	      	
		
		public function Design_4_4_DoubleJump(actor:Actor, scene:GameState)
		{
			super(actor, scene);
			nameMap["Jump Key"] = "_JumpKey";
nameMap["Jump Force"] = "_JumpForce";
nameMap["Jump Sound"] = "_JumpSound";
nameMap["Jump Right Animation"] = "_JumpRightAnimation";
nameMap["Jump Left Animation"] = "_JumpLeftAnimation";
nameMap["Air Jumped?"] = "_AirJumped";
nameMap["AirJump Force"] = "_AirJumpForce";
nameMap["Actor"] = "actor";

		}
		
		override public function forwardMessage(msg:String):void
		{
			
		}
	}
}