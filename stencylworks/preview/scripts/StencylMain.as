package scripts
{
	import org.flixel.*;
	import stencyl.api.engine.*;
	import stencyl.api.engine.utils.*;
	import flash.events.Event;
	import mochi.as3.*;
	import com.newgrounds.API;
	
	[SWF(width="640", height="480", backgroundColor="#121212")]
	[Frame(factoryClass="scripts.Preloader")]
	
	public dynamic class StencylMain extends FlxGame
	{
		MyScripts;
	
		public function StencylMain()
		{
			super(640, 480, GameState, 1.0);

			GameState.gameID = -1;
			GameState.gameName = "Lolilol Knight";
			
			GameState.username = "jojva";GameState.password = "860d795f2adf93a62d59001f5ad67c3e96651375";
	
			GameState.numLeft = 13;
			GameState.initSceneID = -1;
			Profiler.init(stage, this);
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
        {
        	GameState.mochiID = "";
        	GameState.ngID = "";
        	GameState.ngKey = "";
        	
        	if(GameState.ngID != "")
        	{
        		API.connect(root, GameState.ngID, GameState.ngKey);
        	}
        	
        	if(GameState.mochiID != "")
        	{
            	MochiServices.connect( GameState.mochiID, this.parent );
            }
        }
	}
}
