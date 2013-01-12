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



@interface Design_1_1_Projectile : ActorScript 
{
	@public
		NSString* tempHolder;
		
BOOL _attachedtocatapult;

BOOL _Lastfired;

float _firedcount;

float _counting;

float _one;

float _alsoone;

}
@end

@implementation Design_1_1_Projectile

-(void)load
{
	            [self setAttributeForSceneBehavior:@"Catapult Game Controller" att:@"_lastshot" withValue:mActor];
        [mActor disableActorDrawing];
        [mActor setIgnoreGravity:!FALSE];
        [mActor makeAlwaysSimulate];
        _firedcount = 0;
        
{
 NSEnumerator *groupEnumerator = [[self getActorGroup:4] objectEnumerator];
id collectionMemberObject;
while(collectionMemberObject = [groupEnumerator nextObject])
{
Actor* actorInGroup = (Actor*) collectionMemberObject;
if(actorInGroup != NULL && !actorInGroup.dead){
            _firedcount += 1;
}
}
 }

        _Lastfired = TRUE;
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_1_1_Projectile* self = (Design_1_1_Projectile*) theScript;
        _counting = 0;
        
{
 NSEnumerator *groupEnumerator = [[self getActorGroup:4] objectEnumerator];
id collectionMemberObject;
while(collectionMemberObject = [groupEnumerator nextObject])
{
Actor* actorInGroup = (Actor*) collectionMemberObject;
if(actorInGroup != NULL && !actorInGroup.dead){
            _counting += 1;
}
}
 }

        if(!([self sameAs:[NSNumber numberWithFloat:_counting] two:[NSNumber numberWithFloat:_firedcount]]))
{
            _Lastfired = FALSE;
}

        if(_attachedtocatapult)
{
            [mActor disableActorDrawing];
            [mActor setIgnoreGravity:!FALSE];
}

        else
{
            [mActor enableActorDrawing];
            [mActor setIgnoreGravity:!TRUE];
}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end