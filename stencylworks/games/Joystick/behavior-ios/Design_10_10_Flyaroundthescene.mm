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



@interface Design_10_10_Flyaroundthescene : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _WaypointX;

float _WaypointY;

}
@end

@implementation Design_10_10_Flyaroundthescene

-(void)load
{
	            _WaypointX = [Script randomIntBetween:(int)100 to:(int)([self getSceneWidth] - 100)];
        _WaypointY = [Script randomIntBetween:(int)100 to:(int)([self getSceneHeight] - 100)];
        [mActor makeAlwaysSimulate];
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_10_10_Flyaroundthescene* self = (Design_10_10_Flyaroundthescene*) theScript;
        if((9216 > (pow((_WaypointX - [mActor getXCenter]), 2) + pow((_WaypointY - [mActor getYCenter]), 2))))
{
            _WaypointX = [Script randomIntBetween:(int)100 to:(int)([self getSceneWidth] - 100)];
            _WaypointY = [Script randomIntBetween:(int)100 to:(int)([self getSceneHeight] - 100)];
}

        [mActor setXVelocity:([mActor getXVelocity] + (cos(atan2((_WaypointY - [mActor getYCenter]), (_WaypointX - [mActor getXCenter]))) * 0.07))];
        [mActor setYVelocity:([mActor getYVelocity] + (sin(atan2((_WaypointY - [mActor getYCenter]), (_WaypointX - [mActor getXCenter]))) * 0.07))];
        [mActor setAngle:SP_D2R((SP_R2D(atan2([mActor getYVelocity], [mActor getXVelocity])) + 90))];
        [mActor setXVelocity:([mActor getXVelocity] * 0.995)];
        [mActor setYVelocity:([mActor getYVelocity] * 0.995)];
        [mActor setAngularVelocity:SP_D2R((SP_R2D([mActor getAngularVelocity]) * 0.995))];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end