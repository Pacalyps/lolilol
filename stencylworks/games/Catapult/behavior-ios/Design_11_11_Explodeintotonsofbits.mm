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



@interface Design_11_11_Explodeintotonsofbits : ActorScript 
{
	@public
		NSString* tempHolder;
		
SPSound* _Explosionnoise;

ActorType* _ExplosionGraphic;

}
@end

@implementation Design_11_11_Explodeintotonsofbits

-(void)load
{
	            [mActor makeAlwaysSimulate];
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_11_11_Explodeintotonsofbits* self = (Design_11_11_Explodeintotonsofbits*) theScript;
        if((0 > [self asNumber:[mActor getAttributeForBehavior:@"Lose Health On Collision" att:@"_Health"]]))
{
            [self playSound:_Explosionnoise];
            [self createActor:_ExplosionGraphic x:[mActor getXCenter] y:[mActor getYCenter] layerConst:FRONT];
            [mActor die];
}

        if(([mActor getX] > [self getSceneWidth]))
{
            [self doLater:1000 * 1 task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_11_11_Explodeintotonsofbits* self = (Design_11_11_Explodeintotonsofbits*) theScript;
                        if([Actor isAlive:mActor])
{
                            [mActor die];
}

}]];
}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end