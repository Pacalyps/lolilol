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



@interface Design_12_12_BitsBehaviour : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _Timebeforefade;

float _FadeTime;

}
@end

@implementation Design_12_12_BitsBehaviour

    -(void)load
{
        [mActor makeAlwaysSimulate];
        [self doLater:1000 * _Timebeforefade task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_12_12_BitsBehaviour* self = (Design_12_12_BitsBehaviour*) theScript;
                    if([Actor isAlive:mActor])
{
                        [mActor fadeTo:0 time:_FadeTime transition:SP_TRANSITION_LINEAR];
                        [self doLater:1000 * _FadeTime task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_12_12_BitsBehaviour* self = (Design_12_12_BitsBehaviour*) theScript;
                                    if([Actor isAlive:mActor])
{
                                        [mActor die];
}

}]];
}

}]];
}

    -(void)update
{
        [mActor killSelfAfterLeavingScreen];
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