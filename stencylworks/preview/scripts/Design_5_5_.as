package scripts
{
	import flash.events.*;
	import flash.net.*;
	import flash.filters.*;
	import flash.display.BitmapData;
	
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
	
	public dynamic class Design_5_5_ extends ActorScript
	{		
		//Expose your attributes to StencylWorks like this
		[Attribute(id="1", name="Display Name", desc="An Attribute")]
		public var attributeName:String;
		//Then in the constructor or init(), add it to the nameMap like this
		//nameMap["Display Name"] = "attributeName";
		//This lets API calls using attribute names to use the display name
	
		//Do all actor initialization here
		override public function init():void
		{
			addWhenUpdatedListener(null, update);
			addWhenDrawingListener(null, draw);
			addCollisionListener(actor, handleCollision);
		}
		
		//This is executed every frame of the game
		public function update(list:Array):void
		{	
		}
		
		public function draw(list:Array, g:Graphics, x:Number, y:Number):void
		{
		}
		
		public function handleCollision(list:Array, event:Collision):void
		{
		}
		
		//Leave this alone. Do your initializing inside init()
		public function Design_5_5_(actor:Actor, scene:GameState)
		{
			super(actor, scene);
		}
	}
}