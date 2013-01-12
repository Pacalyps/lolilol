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



@interface Design_2_2_CreateParticlesonClick : ActorScript 
{
	@public
		NSString* tempHolder;
		
ActorType* _Particle;

float _NumberofParticles;

float _Velocity;

BOOL _CreatingParticles;

}
@end

@implementation Design_2_2_CreateParticlesonClick

    -(void)load
{

}

    -(void)update
{
        if([mActor touchedActor])
{
            if(!(_CreatingParticles))
{
                _CreatingParticles = TRUE;
                for(int index0 = 0; index0 < _NumberofParticles; index0++)
{
                    [self createActor:_Particle x:([mActor getXCenter] - 4) y:([mActor getYCenter] - 4) layerConst:FRONT];
                    [[self getLastCreatedActor] setVelocityAtAngle:[Script randomIntBetween:(int)180 to:(int)360] withSpeed:_Velocity];
                    if([self sameAs:[NSNumber numberWithFloat:index0] two:[NSNumber numberWithFloat:_NumberofParticles]])
{
                        _CreatingParticles = FALSE;
}

}

}

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