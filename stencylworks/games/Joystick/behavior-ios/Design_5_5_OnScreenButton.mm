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



@interface Design_5_5_OnScreenButton : ActorScript 
{
	@public
		NSString* tempHolder;
		
NSString* _NormalAnimation;

NSString* _PressedAnimation;

NSString* _Control;

BOOL _touching;

}
@end

@implementation Design_5_5_OnScreenButton

-(void)load
{
	            [mActor makeAlwaysSimulate];
        [mActor anchorToScreen];
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_5_5_OnScreenButton* self = (Design_5_5_OnScreenButton*) theScript;
        if([mActor touchedActor])
{
            _touching = TRUE;
            [mActor setAnimation:_PressedAnimation];
             
                            [self simulateKeyPress:_Control];
}

        if([[Game game] releasedTouch])
{
            _touching = FALSE;
            [mActor setAnimation:_NormalAnimation];
             
                            [self simulateKeyRelease:_Control];
}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end