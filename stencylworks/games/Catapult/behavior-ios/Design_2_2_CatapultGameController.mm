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



@interface Design_2_2_CatapultGameController : SceneScript 
{
	@public
		NSString* tempHolder;
		
BOOL _CanShoot;

float _Timelookingatconstruct;

float _ConstructXposition;

float _StartingProjectiles;

BOOL _InitEndofGame;

float _Timetowaitbeforeendgame;

float _WaitBeforeWin;

float _enemycount;

SPDisplayObjectContainer* _EnemyGroup;

BOOL _ShowEndgame;

BOOL _Won;

SPSound* _LoseSound;

SPSound* _WinSound;

SPSound* _AmbienceMusic;

Scene* _NextScene;

BOOL _startcam;

Actor* _lastshot;

Actor* _YouWinLabel;

Actor* _ProjectilesLabel;

BOOL _SpawnLabels;

}
@end

@implementation Design_2_2_CatapultGameController

-(void)load
{
	            [self stopAllSounds];
        [self loopSound:_AmbienceMusic];
        _CanShoot = FALSE;
        _startcam = TRUE;
        _SpawnLabels = TRUE;
        [[self getCamera] setLocation:_ConstructXposition y:0];
        [self doLater:1000 * _Timelookingatconstruct task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_2_2_CatapultGameController* self = (Design_2_2_CatapultGameController*) theScript;
                    [self abletoshoot];
}]];
        [self setGameAttribute:@"Projectiles Left" value:[NSNumber numberWithFloat:_StartingProjectiles]];
        [self createActor:[self getActorType:58] x:20 y:15 layerConst:FRONT];
        _ProjectilesLabel = [self getLastCreatedActor];
        [self createActor:[self getActorType:56] x:50 y:15 layerConst:FRONT];
        [[self getLastCreatedActor] anchorToScreen];
        [[self getLastCreatedActor] makeAlwaysSimulate];
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_2_2_CatapultGameController* self = (Design_2_2_CatapultGameController*) theScript;
        if(!(_CanShoot))
{
            if((!(_startcam) && ((_lastshot != nil) && [Actor isAlive:_lastshot])))
{
                [[self getCamera] setLocation:MIN([_lastshot getXCenter], _ConstructXposition) y:[_lastshot getYCenter]];
}

}

        else
{
            [[self getCamera] setLocation:(([self getScreenX] + ([self getScreenWidth] / 2)) + ((([self getScreenWidth] / 2) - ([self getScreenX] + ([self getScreenWidth] / 2))) / 10)) y:0];
}

        if(!(_InitEndofGame))
{
            if((_CanShoot && ([self asNumber:[NSNumber numberWithFloat:[[self getGameAttribute:@"Projectiles Left"] floatValue]]] <= 0)))
{
                _InitEndofGame = TRUE;
                [self doLater:1000 * _Timetowaitbeforeendgame task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_2_2_CatapultGameController* self = (Design_2_2_CatapultGameController*) theScript;
                            [self loseinit];
}]];
}

            else
{
                _enemycount = 0;
                
{
 NSEnumerator *groupEnumerator = [_EnemyGroup objectEnumerator];
id collectionMemberObject;
while(collectionMemberObject = [groupEnumerator nextObject])
{
Actor* actorInGroup = (Actor*) collectionMemberObject;
if(actorInGroup != NULL && !actorInGroup.dead){
                    _enemycount += 1;
}
}
 }

                if((1 > _enemycount))
{
                    _InitEndofGame = TRUE;
                    [self doLater:1000 * _WaitBeforeWin task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_2_2_CatapultGameController* self = (Design_2_2_CatapultGameController*) theScript;
                                [self win];
}]];
}

}

}

        [_ProjectilesLabel sayToBehavior:@"Label" msg:@"SetLabelText" withArgs:[NSArray arrayWithObjects:[[NSString stringWithFormat:@"%@", [NSNumber numberWithFloat:[[self getGameAttribute:@"Projectiles Left"] floatValue]]] stringByAppendingString:@"x"],nil]];
        if(_ShowEndgame)
{
            if(_SpawnLabels)
{
                _SpawnLabels = FALSE;
                [self createActor:[self getActorType:58] x:0 y:130 layerConst:FRONT];
                if(_Won)
{
                    [[self getLastCreatedActor] sayToBehavior:@"Label" msg:@"SetLabelText" withArgs:[NSArray arrayWithObjects:@"YOU WIN!",nil]];
}

                else
{
                    [[self getLastCreatedActor] sayToBehavior:@"Label" msg:@"SetLabelText" withArgs:[NSArray arrayWithObjects:@"YOU LOSE!",nil]];
}

                [[self getLastCreatedActor] sayToBehavior:@"Label" msg:@"SetLabelFont" withArgs:[NSArray arrayWithObjects:[ self getFont:53],nil]];
                [[self getLastCreatedActor] sayToBehavior:@"Label" msg:@"SetLabelWidth" withArgs:[NSArray arrayWithObjects:[NSNumber numberWithFloat:[self getScreenWidth]],nil]];
                [[self getLastCreatedActor] sayToBehavior:@"Label" msg:@"SetLabelAlignmentCenter" withArgs:nil];
                [self createActor:[self getActorType:58] x:0 y:165 layerConst:FRONT];
                [[self getLastCreatedActor] sayToBehavior:@"Label" msg:@"SetLabelText" withArgs:[NSArray arrayWithObjects:@"Click Anywhere to Continue!",nil]];
                [[self getLastCreatedActor] sayToBehavior:@"Label" msg:@"SetLabelFont" withArgs:[NSArray arrayWithObjects:[ self getFont:52],nil]];
                [[self getLastCreatedActor] sayToBehavior:@"Label" msg:@"SetLabelWidth" withArgs:[NSArray arrayWithObjects:[NSNumber numberWithFloat:[self getScreenWidth]],nil]];
                [[self getLastCreatedActor] sayToBehavior:@"Label" msg:@"SetLabelAlignmentCenter" withArgs:nil];
}

            if(([[Game game] beganTouch] && !([self isTransitioning])))
{
                if(_Won)
{
                    [self switchScene:1 leave:[self createFadeOut:((1000*0.5)) color:0] enter:[self createFadeIn:((1000*1)) color:0]];
}

                else
{
                    [self reloadCurrentScene:[self createFadeOut:((1000*0.5)) color:0] enter:[self createFadeIn:((1000*1)) color:0]];
}

}

}

}];

} 

    -(void)loseinit
{
        _enemycount = 0;
        
{
 NSEnumerator *groupEnumerator = [_EnemyGroup objectEnumerator];
id collectionMemberObject;
while(collectionMemberObject = [groupEnumerator nextObject])
{
Actor* actorInGroup = (Actor*) collectionMemberObject;
if(actorInGroup != NULL && !actorInGroup.dead){
            _enemycount += 1;
}
}
 }

        if((_enemycount > 0))
{
            _Won = FALSE;
            [self playSound:_LoseSound];
            _ShowEndgame = TRUE;
}

        else
{
            [self win];
}

}

    -(void)abletoshoot
{
        _CanShoot = TRUE;
        _startcam = FALSE;
}

    -(void)win
{
        _Won = TRUE;
        [self playSound:_WinSound];
        _ShowEndgame = TRUE;
}



-(void)forwardMessage:(NSString*)msg
{
	
}

@end