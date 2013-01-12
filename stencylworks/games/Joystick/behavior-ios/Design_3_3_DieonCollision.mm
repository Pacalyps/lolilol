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



@interface Design_3_3_DieonCollision : ActorScript 
{
	@public
		NSString* tempHolder;
		
}
@end

@implementation Design_3_3_DieonCollision

-(void)load
{
	    [self handlesCollisions];
        [mActor makeAlwaysSimulate];
    [self addCollisionListener:mActor func:^(Collision* c, NSMutableArray* list, Script* theScript){
Design_3_3_DieonCollision* self = (Design_3_3_DieonCollision*) theScript;
        if([Collision collidedWithActor:c actor:mActor])
{
            [[mActor getLastCollidedActor] shout:@"explode"];
            [[mActor getLastCollidedActor] die];
}

        [mActor shout:@"explode"];
        [mActor die];
        if([Collision collidedWithTile:c actor:mActor])
{
            [self playSound:[self getSound:26]];
}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end