#import <Box2D/Box2D.h>
#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioServices.h>
#import "SceneScript.h"

#import "Script.h"

#import "Actor.h"
#import "ActorType.h"
#import "Assets.h"
#import "Behavior.h"
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



@interface Design_4_4_BallGoalZone : SceneScript 
{
	@public
		NSString* tempHolder;
		
Actor* _Ball;

Region* _GoalZone;

Scene* _NextScene;

}
@end

@implementation Design_4_4_BallGoalZone

    -(void)load
{

}

    -(void)update
{
        if(([self isInRegion:_Ball r:_GoalZone] && !([self isTransitioning])))
{
            [self playSound:[self getSound:14]];
            [self switchScene:_NextScene.ID leave:[self createFadeOut:((1000*1)) color:0] enter:[self createFadeIn:((1000*1)) color:0]];
}

}

    -(void)render:(SPRenderSupport*)g x:(int)x y:(int)y
{
[super render:g x:x y:y];

}



-(void)forwardMessage:(NSString*)msg
{
	
}

@end