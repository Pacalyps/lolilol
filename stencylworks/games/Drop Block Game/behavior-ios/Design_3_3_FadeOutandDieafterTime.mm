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



@interface Design_3_3_FadeOutandDieafterTime : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _StartFadingAfter;

float _FadeTime;

}
@end

@implementation Design_3_3_FadeOutandDieafterTime

    -(void)load
{
        [self doLater:1000 * _StartFadingAfter task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_3_3_FadeOutandDieafterTime* self = (Design_3_3_FadeOutandDieafterTime*) theScript;
                    [mActor fadeTo:0 time:_FadeTime transition:SP_TRANSITION_LINEAR];
                    [self doLater:1000 * _FadeTime task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_3_3_FadeOutandDieafterTime* self = (Design_3_3_FadeOutandDieafterTime*) theScript;
                                [mActor die];
}]];
}]];
}

    -(void)update
{

}

    -(void)handleCollision:(Collision*)c
{

}

    -(void)render:(SPRenderSupport*)g x:(int)x y:(int)y
{
[super render:g x:x y:y];

}



-(void)forwardMessage:(NSString*)msg
{
	
}

@end