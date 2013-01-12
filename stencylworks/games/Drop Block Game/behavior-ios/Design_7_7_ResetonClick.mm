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



@interface Design_7_7_ResetonClick : ActorScript 
{
	@public
		NSString* tempHolder;
		
}
@end

@implementation Design_7_7_ResetonClick

    -(void)load
{

}

    -(void)update
{
        if(([mActor touchedActor] && !([self isTransitioning])))
{
            [self reloadCurrentScene:[self createFadeOut:((1000*.25)) color:0] enter:[self createFadeIn:((1000*1)) color:0]];
}

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