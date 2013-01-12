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



@interface Design_8_8_DieAfterTime : ActorScript 
{
	@public
		NSString* tempHolder;
		
}
@end

@implementation Design_8_8_DieAfterTime

-(void)load
{
	            [self doLater:1000 * 1 task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_8_8_DieAfterTime* self = (Design_8_8_DieAfterTime*) theScript;
                    [mActor die];
}]];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end