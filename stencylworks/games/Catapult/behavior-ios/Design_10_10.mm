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



@interface Design_10_10 : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _oldxv;

float _oldyv;

float _Damage;

SPSound* _SoundtoPlay;

float _MinimumSoundThreshold;

float _Timedelaybetweensounds;

BOOL _CanPlay;

float _NumberofsoundstoPlay;

SPSound* _SoundtoPlay2;

SPSound* _SoundtoPlay3;

float _randsound;

}
@end

@implementation Design_10_10

-(void)load
{
	    [self handlesCollisions];

    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_10_10* self = (Design_10_10*) theScript;
        _oldxv = [mActor getXVelocity];
        _oldyv = [mActor getYVelocity];
}];
    [self addCollisionListener:mActor func:^(Collision* c, NSMutableArray* list, Script* theScript){
Design_10_10* self = (Design_10_10*) theScript;
        _Damage = sqrt((pow(([mActor getXVelocity] - _oldxv), 2) + pow(([mActor getYVelocity] - _oldyv), 2)));
        if((_CanPlay && (_Damage > _MinimumSoundThreshold)))
{
            _randsound = [Script randomIntBetween:(int)1 to:(int)3];
            if([self sameAs:[NSNumber numberWithFloat:_randsound] two:[NSNumber numberWithFloat:1]])
{
                [self playSound:_SoundtoPlay];
}

            if([self sameAs:[NSNumber numberWithFloat:_randsound] two:[NSNumber numberWithFloat:2]])
{
                [self playSound:_SoundtoPlay2];
}

            if([self sameAs:[NSNumber numberWithFloat:_randsound] two:[NSNumber numberWithFloat:3]])
{
                [self playSound:_SoundtoPlay3];
}

            _CanPlay = FALSE;
            [self doLater:1000 * _Timedelaybetweensounds task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_10_10* self = (Design_10_10*) theScript;
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