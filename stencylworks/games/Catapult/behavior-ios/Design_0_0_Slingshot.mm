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



@interface Design_0_0_Slingshot : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _FrontSlingOriginX;

float _FrontSlingOriginY;

float _FrontSlingThickness;

float _BackSlingOriginX;

float _BackSlingOriginY;

float _BackSlingThickness;

BOOL _gotaboulder;

Actor* _boulderthatsattached;

float _SlingMiddleX;

float _SlingMiddleY;

float _FiringDirection;

float _BoulderRadius;

BOOL _FiresinonlyoneDirection;

BOOL _expectationsmet;

BOOL _FiringDirectionModifier;

float _SlingX;

float _MaximumWidth;

float _MaximumPower;

float _SlingY;

BOOL _TieinwithCatapultKit;

float _FiringDelay;

SPSound* _FlingNoise;

BOOL _CanShootNoCatapultKit;

}
@end

@implementation Design_0_0_Slingshot

-(void)load
{
	    [self doesCustomDrawing];
        _SlingMiddleX = ((_BackSlingOriginX + _FrontSlingOriginX) / 2);
        _SlingMiddleY = ((_BackSlingOriginY + _FrontSlingOriginY) / 2);
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_0_0_Slingshot* self = (Design_0_0_Slingshot*) theScript;
        if([[Game game] draggedTouch])
{
            if(_gotaboulder)
{
                _FiringDirection = (SP_R2D(atan2((([mActor getYOnScreen] + _SlingMiddleY) - [self getTouchDragY]), (([mActor getXOnScreen] + _SlingMiddleX) - [self getTouchDragX]))) + 90);
}

            if((sqrt((pow(([self getTouchDragX] - ([mActor getXOnScreen] + _SlingMiddleX)), 2) + pow(([self getTouchDragY] - ([mActor getYOnScreen] + _SlingMiddleY)), 2))) > _MaximumWidth))
{
                _SlingX = (([mActor getXOnScreen] + _SlingMiddleX) + (cos(SP_D2R((_FiringDirection + 90))) * _MaximumWidth));
                _SlingY = (([mActor getYOnScreen] + _SlingMiddleY) + (sin(SP_D2R((_FiringDirection + 90))) * _MaximumWidth));
}

            else
{
                _SlingX = [self getTouchDragX];
                _SlingY = [self getTouchDragY];
}

}

        _expectationsmet = TRUE;
        if(([self asNumber:[NSNumber numberWithFloat:[[self getGameAttribute:@"Projectiles Left"] floatValue]]] <= 0))
{
            _expectationsmet = FALSE;
}

        if(_FiresinonlyoneDirection)
{
            if([[Game game] draggedTouch])
{
                if((_FiringDirectionModifier && ([self getTouchDragX] > ([mActor getXOnScreen] + _SlingMiddleX))))
{
                    _expectationsmet = FALSE;
}

                else if((!(_FiringDirectionModifier) && (([mActor getXOnScreen] + _SlingMiddleX) > [self getTouchDragX])))
{
                    _expectationsmet = FALSE;
}

}

}

        if(_TieinwithCatapultKit)
{
            if(([self asBoolean:[self getAttributeForSceneBehavior:@"Catapult Game Controller" att:@"_InitEndofGame"]] || !([self asBoolean:[self getAttributeForSceneBehavior:@"Catapult Game Controller" att:@"_CanShoot"]])))
{
                _expectationsmet = FALSE;
}

}

        else
{
            if(!(_CanShootNoCatapultKit))
{
                _expectationsmet = FALSE;
}

}

        if((([[Game game] draggedTouch] && _expectationsmet) && !(_gotaboulder)))
{
            _gotaboulder = TRUE;
            [self createRecycledActor:[self getActorType:0] x:0 y:0 layerConst:FRONT];
            _boulderthatsattached = [self getLastCreatedActor];
            [[self getLastCreatedActor] setAttributeForBehavior:@"Projectile" att:@"_attachedtocatapult" withValue:[NSNumber numberWithBool:TRUE]];
            _BoulderRadius = [_boulderthatsattached getWidth]/2;
}

        if(([[Game game] releasedTouch] && _gotaboulder))
{
            _gotaboulder = FALSE;
            [_boulderthatsattached setAttributeForBehavior:@"Projectile" att:@"_attachedtocatapult" withValue:[NSNumber numberWithBool:FALSE]];
            if(_TieinwithCatapultKit)
{
                [self setAttributeForSceneBehavior:@"Catapult Game Controller" att:@"_CanShoot" withValue:[NSNumber numberWithBool:FALSE]];
                [self doLater:1000 * _FiringDelay task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_0_0_Slingshot* self = (Design_0_0_Slingshot*) theScript;
                            [self setAttributeForSceneBehavior:@"Catapult Game Controller" att:@"_CanShoot" withValue:[NSNumber numberWithBool:TRUE]];
}]];
}

            else
{
                _CanShootNoCatapultKit = FALSE;
                [self doLater:1000 * _FiringDelay task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_0_0_Slingshot* self = (Design_0_0_Slingshot*) theScript;
                            [self NoCatapultTrue];
}]];
}

            [_boulderthatsattached setXPosition:((_SlingX - [_boulderthatsattached getWidth]/2) + (cos(SP_D2R((_FiringDirection - 90))) * _BoulderRadius))];
            [_boulderthatsattached setYPosition:((_SlingY - [_boulderthatsattached getHeight]/2) + (sin(SP_D2R((_FiringDirection - 90))) * _BoulderRadius))];
            [_boulderthatsattached setXVelocity:(cos(SP_D2R((_FiringDirection - 90))) * (_MaximumPower * (sqrt((pow((_SlingX - ([mActor getXOnScreen] + _SlingMiddleX)), 2) + pow((_SlingY - ([mActor getYOnScreen] + _SlingMiddleY)), 2))) / _MaximumWidth)))];
            [_boulderthatsattached setYVelocity:(sin(SP_D2R((_FiringDirection - 90))) * (_MaximumPower * (sqrt((pow((_SlingX - ([mActor getXOnScreen] + _SlingMiddleX)), 2) + pow((_SlingY - ([mActor getYOnScreen] + _SlingMiddleY)), 2))) / _MaximumWidth)))];
            [self playSound:_FlingNoise];
            [self setGameAttribute:@"Projectiles Left" value:[NSNumber numberWithFloat:([self asNumber:[NSNumber numberWithFloat:[[self getGameAttribute:@"Projectiles Left"] floatValue]]] - 1)]];
}

        if((!(_expectationsmet) && _gotaboulder))
{
            _gotaboulder = FALSE;
            [self recycleActor:_boulderthatsattached];
}

}];
    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
Design_0_0_Slingshot* self = (Design_0_0_Slingshot*) theScript;
        if(_gotaboulder)
{
            [self toScreenSpace];
            [[Game game] setStrokeThickness:_BackSlingThickness];
            [[Game game] setStrokeColor:[UIColor colorWithRed:153.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0]];
            [[Game game] drawLine:([mActor getX] + _BackSlingOriginX) y1:([mActor getY] + _BackSlingOriginY) x2:_SlingX y2:_SlingY];
            [[Game game] moveTo:((_SlingX - [_boulderthatsattached getWidth]/2) + (cos(SP_D2R((_FiringDirection - 90))) * _BoulderRadius)) y:((_SlingY - [_boulderthatsattached getHeight]/2) + (sin(SP_D2R((_FiringDirection - 90))) * _BoulderRadius))];
            [[Game game] drawImageForActor:_boulderthatsattached];
            [self toScreenSpace];
            [[Game game] moveTo:0 y:0];
            [[Game game] setStrokeThickness:_FrontSlingThickness];
            [[Game game] setStrokeColor:[UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0]];
            [[Game game] drawLine:([mActor getX] + _FrontSlingOriginX) y1:([mActor getY] + _FrontSlingOriginY) x2:_SlingX y2:_SlingY];
}

}];

} 

    -(void)NoCatapultTrue
{
        _CanShootNoCatapultKit = TRUE;
}



-(void)forwardMessage:(NSString*)msg
{
	
}

@end