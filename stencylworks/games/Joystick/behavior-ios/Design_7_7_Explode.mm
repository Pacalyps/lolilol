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



@interface Design_7_7_Explode : ActorScript 
{
	@public
		NSString* tempHolder;
		
NSString* _ParticleAnimation;

}
@end

@implementation Design_7_7_Explode

-(void)load
{
	    

} 

    -(void)explode
{
        [self playSound:[self getSound:25]];
        for(int index0 = 0; index0 < 4; index0++)
{
            [self createActor:[self getActorType:22] x:[mActor getXCenter] y:[mActor getYCenter] layerConst:FRONT];
            [[self getLastCreatedActor] setAnimation:[NSString stringWithFormat:@"%@", _ParticleAnimation]];
            [[self getLastCreatedActor] setXPosition:([[self getLastCreatedActor] getX] - [[self getLastCreatedActor] getWidth]/2)];
            [[self getLastCreatedActor] setYPosition:([[self getLastCreatedActor] getY] - [[self getLastCreatedActor] getHeight]/2)];
            [[self getLastCreatedActor] fadeTo:0 time:1 transition:SP_TRANSITION_LINEAR];
            [[self getLastCreatedActor] setAngularVelocity:SP_D2R([Script randomIntBetween:(int)-100 to:(int)100])];
            [[self getLastCreatedActor] setXVelocity:[Script randomIntBetween:(int)-3 to:(int)3]];
            [[self getLastCreatedActor] setYVelocity:[Script randomIntBetween:(int)-3 to:(int)3]];
}

}



-(void)forwardMessage:(NSString*)msg
{
	
}

@end