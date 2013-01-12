package scripts
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.IEventDispatcher;
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import stencyl.api.engine.GameState;
	import stencyl.api.data.AssetLoader;
	import stencyl.api.data.Assets;
	
	import org.flixel.FlxG;

	public dynamic class MyAssets implements AssetLoader
	{
		private var a:Assets;
		private var scope:Object = this;
		private var state:GameState;
		private var remote:Boolean;
	
		private var numLeft:int = 0;


		//*-----------------------------------------------
		//* Master XML Files
		//*-----------------------------------------------
		
		private var GameXML:ByteArray
private var SceneList:ByteArray
private var ResourceList:ByteArray
private var BehaviorList:ByteArray

		
		
		//*-----------------------------------------------
		//* Auto-Generated Static Resource Files
		//*-----------------------------------------------
		
		public var r0:Bitmap;
public var r2_0:Bitmap;
public var r2_1:Bitmap;
public var r2_2:Bitmap;
public var r2_3:Bitmap;
public var r2_4:Bitmap;
public var r3:Bitmap;

		
		
		//*-----------------------------------------------
		//* Auto-Generated Scene Files
		//*-----------------------------------------------
		
		
private var scene0:ByteArray;

private var scene0b:ByteArray;

		
		
		//*-----------------------------------------------
		//* Init
		//*-----------------------------------------------
		
		public function MyAssets(remote:Boolean)
		{
			super();
			
			this.remote = remote;
		}
		
		public function init(assets:Assets, numLeft:int = 0, state:GameState=null):void
		{
			this.a = assets;
			this.numLeft = numLeft;
			this.state = state;

			if(remote)
			{
				loadExternalResource("C:/Users/Anthony Teixeira/Desktop/git/lolilol/stencylworks/preview/game/game.xml", "GameXML");
loadExternalResource("C:/Users/Anthony Teixeira/Desktop/git/lolilol/stencylworks/preview/game/scenes.xml", "SceneList");
loadExternalResource("C:/Users/Anthony Teixeira/Desktop/git/lolilol/stencylworks/preview/game/behaviors.xml", "BehaviorList");
loadExternalResource("C:/Users/Anthony Teixeira/Desktop/git/lolilol/stencylworks/preview/game/resources.xml", "ResourceList");
loadExternalResource("C:/Users/Anthony Teixeira/Desktop/git/lolilol/stencylworks/preview/game/scenes/0.xml", "scene0");
loadExternalResource("C:/Users/Anthony Teixeira/Desktop/git/lolilol/stencylworks/preview/game/scenes/0.scn", "scene0b");
loadImage("C:/Users/Anthony Teixeira/Desktop/git/lolilol/stencylworks/preview/game/resources/0.png", "r0");
loadImage("C:/Users/Anthony Teixeira/Desktop/git/lolilol/stencylworks/preview/game/resources/2-0.png", "r2_0");
loadImage("C:/Users/Anthony Teixeira/Desktop/git/lolilol/stencylworks/preview/game/resources/2-1.png", "r2_1");
loadImage("C:/Users/Anthony Teixeira/Desktop/git/lolilol/stencylworks/preview/game/resources/2-2.png", "r2_2");
loadImage("C:/Users/Anthony Teixeira/Desktop/git/lolilol/stencylworks/preview/game/resources/2-3.png", "r2_3");
loadImage("C:/Users/Anthony Teixeira/Desktop/git/lolilol/stencylworks/preview/game/resources/2-4.png", "r2_4");
loadImage("C:/Users/Anthony Teixeira/Desktop/git/lolilol/stencylworks/preview/game/resources/3.png", "r3");

			}
			
			else
			{
				initAssets(a);
			}
		}
		
		private function loadExternalResource(path:String, identifier:String):void 
		{
			var loader:URLLoader = new URLLoader();
			var request:URLRequest = new URLRequest(path);	
			loader.dataFormat = URLLoaderDataFormat.BINARY;
			
			loader.addEventListener
			(
				Event.COMPLETE, 
				function(event:Event):void 
				{
					var l:URLLoader = URLLoader(event.target);
					scope[identifier] = l.data;
					scope.numLeft--;
					
					//FlxG.log("(G) NUM LEFT: " + scope.numLeft);
					//FlxG.log(path);
					
					if(scope.numLeft == 0)
					{
						scope.initAssets(scope.a);
						scope.state.begin();
					}
				}
			);
			
			loader.addEventListener
			(
				IOErrorEvent.IO_ERROR, 
				function(event:Event):void 
				{
					FlxG.log("(G) Had trouble loading: " + path);
					scope.numLeft--;
					
					if(scope.numLeft == 0)
					{
						scope.initAssets(scope.a);
						scope.state.begin();
					}
				}
			);
			
			try
			{
				loader.load(new URLRequest(path));
			}
			
			catch(error:Error)
			{
				FlxG.log("(G) Had trouble loading: " + path);
			}
		}
		
		private function loadImage(path:String, identifier:String):void 
		{
			var loader:URLLoader = new URLLoader();
			var request:URLRequest = new URLRequest(path);	
			loader.dataFormat = URLLoaderDataFormat.BINARY;
			FlxG.log("Path: " + path);
			loader.addEventListener
			(
				Event.COMPLETE, 
				function(event:Event):void 
				{
					var l:URLLoader = URLLoader(event.target);
					var bytes:* = l.data;
					
					var loader:Loader = new Loader();
					loader.contentLoaderInfo.addEventListener
					(
						Event.COMPLETE, 
						function(event2:Event):void
						{
							FlxG.log("Complete path: " + path);
							
							var bitmap:Bitmap = Bitmap(event2.target.content);	
							scope[identifier] = bitmap;

							scope.numLeft--;
							FlxG.log("NUMLEFT: " + scope.numLeft);
							
							if(scope.numLeft == 0)
							{
								scope.initAssets(scope.a);
								scope.state.begin();
							}
						}
					);
					
					loader.contentLoaderInfo.addEventListener
					(
						IOErrorEvent.IO_ERROR, 
						function(event:Event):void 
						{
							FlxG.log("(I-E2) Had trouble loading: " + path);
							scope.numLeft--;
							
							if(scope.numLeft == 0)
							{
								scope.initAssets(scope.a);
								scope.state.begin();
							}
						}
					);
					
					loader.contentLoaderInfo.addEventListener
					(
						Event.INIT, 
						function(event:Event):void 
						{
							FlxG.log("Init path: " + path);
						}
					)				
					
					try
					{
						loader.loadBytes(bytes);
					}
					
					catch(error:Error)
					{
						FlxG.log("(I-1) Had trouble loading: " + path);
					}
				}
			);
			
			loader.addEventListener
			(
				IOErrorEvent.IO_ERROR, 
				function(event:Event):void 
				{
					FlxG.log("(I-E1) Had trouble loading: " + path);
					scope.numLeft--;
					
					if(scope.numLeft == 0)
					{
						scope.initAssets(scope.a);
						scope.state.begin();
					}
				}
			);
			
			try
			{
				loader.load(new URLRequest(path));
			}
			
			catch(error:Error)
			{
				FlxG.log("(I) Had trouble loading: " + path);
			}
		}
		
		public function initAssets(assets:Assets):void
		{
			initMasterLists();
			a.loadAll();
		}
		
		public function loadResources():void
		{
			a.resourceAssets["0.png"] = r0;
a.resourceAssets["2-0.png"] = r2_0;
a.resourceAssets["2-1.png"] = r2_1;
a.resourceAssets["2-2.png"] = r2_2;
a.resourceAssets["2-3.png"] = r2_3;
a.resourceAssets["2-4.png"] = r2_4;
a.resourceAssets["3.png"] = r3;

		}
		
		private function initMasterLists():void
		{
			a.gameXML = Assets.toXML(GameXML);
a.sceneListXML = Assets.toXML(SceneList);
a.resourceListXML = Assets.toXML(ResourceList);
a.behaviorListXML = Assets.toXML(BehaviorList);

		}
		
		public function loadScenes():void
		{
			a.scenesXML = new Array();
			a.scenesTerrain = new Array();
			
			
a.scenesXML[0] = Assets.toXML(scene0);
a.scenesTerrain[0] = scene0b;

		}
	}
}