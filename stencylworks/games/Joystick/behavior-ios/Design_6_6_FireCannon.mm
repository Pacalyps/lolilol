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



@interface Design_6_6_FireCannon : ActorScript 
{
	@public
		NSString* tempHolder;
		
ActorType* type;

float xPos;

float yPos;

float angle;

float power;

float maxPower;

SPSound* FiringSound;

float _XOffset;

float _YOffset;

}
@end

@implementation Design_6_6_FireCannon

-(void)load
{
	    
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_6_6_FireCannon* self = (Design_6_6_FireCannon*) theScript;
        if([self isKeyPressed:@"action2"])
{
            [self playSound:FiringSound];
            angle = SP_R2D([mActor getAngle]);
            power = maxPower;
            [self createRecycledActor:type x:([mActor getXCenter] - _XOffset) y:([mActor getYCenter] - _YOffset) layerConst:BACK];
            [[self getLastCreatedActor] setAngle:SP_D2R(SP_R2D([mActor getAngle]))];
            [[self getLastCreatedActor] setXVelocity:-((sin(SP_D2R(SP_R2D([mActor getAngle]))) * (power / 60)))];
            [[self getLastCreatedActor] setYVelocity:(cos(SP_D2R(SP_R2D([mActor getAngle]))) * (power / 40))];
}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end