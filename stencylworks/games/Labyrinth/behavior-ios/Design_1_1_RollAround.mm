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



@interface Design_1_1_RollAround : ActorScript 
{
	@public
		NSString* tempHolder;
		
}
@end

@implementation Design_1_1_RollAround

-(void)load
{
	    
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_1_1_RollAround* self = (Design_1_1_RollAround*) theScript;
        [mActor setXVelocity:([Game game].accelY * -70)];
        [mActor setYVelocity:([Game game].accelX * -70)];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end