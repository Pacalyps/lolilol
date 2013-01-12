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

	
	
	public dynamic class ActorEvents_1 extends ActorScript
	{          	
	  
     
    override public function init():void
    {
                  getCamera().setLocation(actor.getX(), actor.getY());
    addWhenUpdatedListener(null, function(list:Array):void {
if(wrapper.enabled){
        getCamera().setLocation(actor.getX(), actor.getY());
}
});

    }	      	
		
		public function ActorEvents_1(actor:Actor, scene:GameState)
		{
			super(actor, scene);
			
		}
		
		override public function forwardMessage(msg:String):void
		{
			
		}
	}
}