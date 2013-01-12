#import <Box2D/Box2D.h>
#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioServices.h>
#import "SceneScript.h"

#import "Script.h"

#import "Actor.h"
#import "ActorType.h"
#import "Assets.h"
#import "Behavior.h"
#import "Collision.h"
#import "CollisionPoint.h"
#import "Game.h"
#import "GameModel.h"
#import "GroupDef.h"
#import "FadeInTransition.h"
#import "FadeOutTransition.h"
#import "Region.h"
#import "Runnable.h"
#import "Scene.h"
#import "SHThumbstick.h"
#import "Sparrow.h"
#import "Transition.h"



@interface Design_1_1_AtlasManager : SceneScript 
{
	@public
		NSString* tempHolder;
		
NSMutableArray* _ToUnload;

NSMutableArray* _ToLoad;

}
@end

@implementation Design_1_1_AtlasManager

-(void)load
{
	                        for(id item in _ToUnload)
{
                [[Assets get] unloadAtlas:[self asNumber:item]];
}

            for(id item in _ToLoad)
{
                [[Assets get] loadAtlas:[self asNumber:item]];
}


} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end