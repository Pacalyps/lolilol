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



@interface Design_21_21_FadeAfterTime : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _FadeTime;

float _TimeToFadeAfter;

NSString* _EndAction;

BOOL _Fading;

}
@end

@implementation Design_21_21_FadeAfterTime

-(void)load
{
	            if((_TimeToFadeAfter >= 0))
{
            [self doLater:1000 * _TimeToFadeAfter task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_21_21_FadeAfterTime* self = (Design_21_21_FadeAfterTime*) theScript;
                        [self Fade];
}]];
}


} 

    -(void)Fade
{
        if(!(_Fading))
{
            _Fading = TRUE;
            [mActor fadeTo:0 time:_FadeTime transition:SP_TRANSITION_LINEAR];
            [self doLater:1000 * _FadeTime task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_21_21_FadeAfterTime* self = (Design_21_21_FadeAfterTime*) theScript;
                        if([self sameAs:_EndAction two:@"Kill"])
{
                            [mActor die];
}

                        else if([self sameAs:_EndAction two:@"Recycle"])
{
                            [self recycleActor:mActor];
}

}]];
}

}



-(void)forwardMessage:(NSString*)msg
{
	
}

@end