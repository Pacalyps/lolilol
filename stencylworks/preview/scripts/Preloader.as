package scripts
{
	import org.flixel.FlxPreloader;
	import stencyl.api.engine.*;
	import stencyl.api.data.*;
		
	public class Preloader extends FlxPreloader
	{
		
	
		public function Preloader():void
		{
			siteLock = false;
			lockURL = "";
			
			className = "scripts.StencylMain";
			super();
			postLoad = 1;
			
			gameScale = 1.0;
			backgroundColor = -15592942;
			barColor = -7829368;
			barBackgroundColor = -12303292;
			borderColor = -12303292;
			
			borderThickness = gameScale * 2;
			barWidth = gameScale * 120;
			barHeight = gameScale * 8;
			barX = stage.stageWidth / 2 - barWidth / 2;
			barY = stage.stageHeight / 2 - barHeight / 2;
			barOffsetX = gameScale * 0;
			barOffsetY = gameScale * 0;
			myURL = "";
			
			
		}
	}
}