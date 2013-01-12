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



@interface Design_5_5_DieinPit : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _FadeTime;

float _TimeBeforeReload;

}
@end

@implementation Design_5_5_DieinPit

    -(void)handleCollision:(Collision*)c
{

}

    -(void)update
{
        if(([mActor getYOnScreen] > [self getScreenHeight]))
{
            if(!([self isTransitioning]))
{
                [self reloadCurrentScene:[self createFadeOut:((1000*_FadeTime)) color:0] enter:[self createFadeIn:((1000*1)) color:0]];
                [mActor die];
}

}

}

    -(void)render:(SPRenderSupport*)g x:(int)x y:(int)y
{
[super render:g x:x y:y];

}

    -(void)load
{

}



-(void)forwardMessage:(NSString*)msg
{
	
}

@end