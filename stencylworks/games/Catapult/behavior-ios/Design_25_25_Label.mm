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



@interface Design_25_25_Label : ActorScript 
{
	@public
		NSString* tempHolder;
		
NSString* _Font;

UIColor* _FontColor;

NSString* _Text;

float _X;

BOOL _AnchortoScreen;

NSString* _Alignment;

NSString* _TransparentAnimation;

BOOL _Start;

float _LabelWidth;

float _TextWidth;

BOOL _LabelWidthAtLeastTextWidth;

BOOL _ChangeFontColor;

float _Padding;

}
@end

@implementation Design_25_25_Label

-(void)load
{
	    [self doesCustomDrawing];
        _Padding = 4;
        if((_TransparentAnimation != nil))
{
            [mActor setAnimation:_TransparentAnimation];
}

        if(_AnchortoScreen)
{
            [mActor makeAlwaysSimulate];
            [mActor anchorToScreen];
}

                    [mActor attachLabel];
        [mActor sayToBehavior:@"Label" msg:@"SetLabelText" withArgs:[NSArray arrayWithObjects:_Text,nil]];
        [mActor sayToBehavior:@"Label" msg:@"SetLabelWidth" withArgs:[NSArray arrayWithObjects:[NSNumber numberWithFloat:_LabelWidth],nil]];
        [mActor sayToBehavior:@"Label" msg:@"SetLabelFont" withArgs:[NSArray arrayWithObjects:_Font,nil]];
        if([self sameAs:_Alignment two:@"Left"])
{
            [mActor sayToBehavior:@"Label" msg:@"SetLabelAlignmentLeft" withArgs:nil];
}

        else if([self sameAs:_Alignment two:@"Center"])
{
            [mActor sayToBehavior:@"Label" msg:@"SetLabelAlignmentCenter" withArgs:nil];
}

        else if([self sameAs:_Alignment two:@"Right"])
{
            [mActor sayToBehavior:@"Label" msg:@"SetLabelAlignmentRight" withArgs:nil];
}

    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
Design_25_25_Label* self = (Design_25_25_Label*) theScript;
        if((_Font != nil))
{
            [[Game game] setFont:_Font size:1];
}

        _TextWidth = [[Game game] getWidthForString:[[Game game] getFont] string:_Text];
        if((_LabelWidthAtLeastTextWidth && (_LabelWidth < (_TextWidth + _Padding))))
{
            [mActor sayToBehavior:@"Label" msg:@"SetLabelWidth" withArgs:[NSArray arrayWithObjects:[NSNumber numberWithFloat:(_TextWidth + _Padding)],nil]];
}

        if([self sameAs:_Alignment two:@"Left"])
{
            _X = 0;
}

        else if([self sameAs:_Alignment two:@"Center"])
{
            _X = ((_LabelWidth - _TextWidth) / 2);
}

        else if([self sameAs:_Alignment two:@"Right"])
{
            _X = (_LabelWidth - _TextWidth);
}

         
}];

} 

    

/* Params are:__Self __text */
- ( void) SetLabelText:(NSArray*)args
{
Actor* __Self = mActor;
NSString* __text = (NSString*) [args objectAtIndex:0];
        
tempHolder = _Text;_Text = __text;
[_Text retain];
[tempHolder release];
                    [mActor setLabelText:_Text];
}
    

/* Params are:__Self __font */
- ( void) SetLabelFont:(NSArray*)args
{
Actor* __Self = mActor;
NSString* __font = (NSString*) [args objectAtIndex:0];
        _Font = __font;
                    if((_Font != nil))
{
                [mActor setLabelFont:_Font];
}

}
    

/* Params are:__Self */
- ( void) SetLabelAlignmentLeft:(NSArray*)args
{
Actor* __Self = mActor;
        
tempHolder = _Alignment;_Alignment = @"Left";
[_Alignment retain];
[tempHolder release];
                    [mActor setLabelToLeft];
}
    

/* Params are:__Self */
- ( void) SetLabelAlignmentCenter:(NSArray*)args
{
Actor* __Self = mActor;
        
tempHolder = _Alignment;_Alignment = @"Center";
[_Alignment retain];
[tempHolder release];
                    [mActor setLabelToCenter];
}
    

/* Params are:__Self */
- ( void) SetLabelAlignmentRight:(NSArray*)args
{
Actor* __Self = mActor;
        
tempHolder = _Alignment;_Alignment = @"Right";
[_Alignment retain];
[tempHolder release];
                    [mActor setLabelToRight];
}
    

/* Params are:__Self __width */
- ( void) SetLabelWidth:(NSArray*)args
{
Actor* __Self = mActor;
float __width = (float) [[args objectAtIndex:0] floatValue];
        _LabelWidth = __width;
                    [mActor setLabelWidth:_LabelWidth];
}


-(void)forwardMessage:(NSString*)msg
{
	
}

@end