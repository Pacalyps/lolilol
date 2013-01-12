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



@interface Design_9_9_ResetGame : SceneScript 
{
	@public
		NSString* tempHolder;
		
float _Count;

BOOL _AlreadyFadingout;

}
@end

@implementation Design_9_9_ResetGame

-(void)load
{
	            _AlreadyFadingout = FALSE;
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_9_9_ResetGame* self = (Design_9_9_ResetGame*) theScript;
        _Count = 0;
        for(Actor* actorOfType in [self getActorsOfType:[self getActorType:9]])
{
if(actorOfType != nil && !actorOfType.dead){
            _Count += 1;
}
}

        for(Actor* actorOfType in [self getActorsOfType:[self getActorType:20]])
{
if(actorOfType != nil && !actorOfType.dead){
            _Count += 1;
}
}

        if(([self sameAs:[NSNumber numberWithFloat:_Count] two:[NSNumber numberWithFloat:0]] && !(_AlreadyFadingout)))
{
            _AlreadyFadingout = TRUE;
            [self playSound:[self getSound:27]];
            [self doLater:1000 * 1 task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_9_9_ResetGame* self = (Design_9_9_ResetGame*) theScript;
                        [self reloadCurrentScene:[self createFadeOut:((1000*1)) color:0] enter:[self createFadeIn:((1000*1)) color:0]];
}]];
}

        _Count = 0;
        for(Actor* actorOfType in [self getActorsOfType:[self getActorType:28]])
{
if(actorOfType != nil && !actorOfType.dead){
            _Count += 1;
}
}

        if(([self sameAs:[NSNumber numberWithFloat:_Count] two:[NSNumber numberWithFloat:0]] && !(_AlreadyFadingout)))
{
            _AlreadyFadingout = TRUE;
            [self doLater:1000 * 1 task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_9_9_ResetGame* self = (Design_9_9_ResetGame*) theScript;
                        [self reloadCurrentScene:[self createFadeOut:((1000*1)) color:0] enter:[self createFadeIn:((1000*1)) color:0]];
}]];
}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end