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



@interface Design_1_1_RollAround : ActorScript 
{
	@public
		NSString* tempHolder;
		
}
@end

@implementation Design_1_1_RollAround

-(void)load
{
	            [[Game game] enableThumbstick];
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_1_1_RollAround* self = (Design_1_1_RollAround*) theScript;
                    if((fabs([Game game].thumbstickDistance) > 0))
{
                [mActor setXVelocity:([mActor getXVelocity] + ((cos(SP_D2R([Game game].thumbstickDirection)) * [Game game].thumbstickDistance) * -1))];
                [mActor setYVelocity:([mActor getYVelocity] + ((sin(SP_D2R([Game game].thumbstickDirection)) * [Game game].thumbstickDistance) * -1))];
                [mActor setAngle:SP_D2R((SP_R2D(atan2([mActor getYVelocity], [mActor getXVelocity])) - 90))];
}

         
        [mActor setXVelocity:([mActor getXVelocity] * 0.95)];
        [mActor setYVelocity:([mActor getYVelocity] * 0.95)];
        [mActor setAngularVelocity:SP_D2R((SP_R2D([mActor getAngularVelocity]) * 0.95))];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end