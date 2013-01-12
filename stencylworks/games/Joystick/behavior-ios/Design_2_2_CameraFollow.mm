#import <Box2D/Box2D.h>
#import <AudioToolbox/AudioServices.h>
#import <Foundation/Foundation.h>
#import "ActorScript.h"

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



@interface Design_2_2_CameraFollow : ActorScript 
{
	@public
		NSString* tempHolder;
		
}
@end

@implementation Design_2_2_CameraFollow

-(void)load
{
	    
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_2_2_CameraFollow* self = (Design_2_2_CameraFollow*) theScript;
        [[Game game] cameraFollow:mActor lockX:TRUE lockY:TRUE];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end