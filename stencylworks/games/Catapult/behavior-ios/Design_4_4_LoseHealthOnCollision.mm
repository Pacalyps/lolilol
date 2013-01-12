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



@interface Design_4_4_LoseHealthOnCollision : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _oldxv;

float _oldyv;

float _MinimumHealthLost;

float _DamageMultiplier;

float _Damage;

BOOL _PlaySound;

SPSound* _SoundtoPlay;

float _MinimumSoundThreshold;

float _Timedelaybetweensounds;

BOOL _CanPlay;

float _Health;

}
@end

@implementation Design_4_4_LoseHealthOnCollision

-(void)load
{
	    [self handlesCollisions];

    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_4_4_LoseHealthOnCollision* self = (Design_4_4_LoseHealthOnCollision*) theScript;
        _oldxv = [mActor getXVelocity];
        _oldyv = [mActor getYVelocity];
}];
    [self addCollisionListener:mActor func:^(Collision* c, NSMutableArray* list, Script* theScript){
Design_4_4_LoseHealthOnCollision* self = (Design_4_4_LoseHealthOnCollision*) theScript;
        _Damage = (sqrt((pow(([mActor getXVelocity] - _oldxv), 2) + pow(([mActor getYVelocity] - _oldyv), 2))) * _DamageMultiplier);
        if((_Damage > _MinimumHealthLost))
{
            _Health = (_Health - _Damage);
}

        if((_CanPlay && (_PlaySound && (_Damage > _MinimumSoundThreshold))))
{
            [self playSound:_SoundtoPlay];
            _CanPlay = FALSE;
            [self doLater:1000 * _Timedelaybetweensounds task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_4_4_LoseHealthOnCollision* self = (Design_4_4_LoseHealthOnCollision*) theScript;
                        [self canplay];
}]];
}

}];

} 

    -(void)canplay
{
        _CanPlay = TRUE;
}



-(void)forwardMessage:(NSString*)msg
{
	
}

@end