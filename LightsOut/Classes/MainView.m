//
//  MainView.m
//  LightsOut
//
//  Created by Alex Watt on 21/01/2009.
//  Copyright Greycourt Software Ltd. 2009. All rights reserved.
//

#import "MainView.h"

#define SCREEN_WIDTH 320
#define SCREEN_HEIGHT 480

#define GAME_WIDTH 300
#define GAME_HEIGHT 300

#define CELL_WIDTH 60
#define CELL_HEIGHT 60

#define CELL_MARGIN 0

@implementation MainView

@synthesize game;

-(void) awakeFromNib {
	[ super awakeFromNib ];
	
	game = [ [ LightsOutGame alloc ] initWithLargerCock ];
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
	int x, y;
	CGPoint location;
	
	for( y = 1; y <= [ game getHeight ]; y++ ) {
		for( x = 1; x <= [ game getWidth ]; x++ ) {
			location = CGPointMake( x, y );
			[ self drawCellAtGameLocation: location ];
		}
	}
}

-(void) drawCellAtGameLocation: (CGPoint) location {
	UIColor *color;
	
	if( [ game cellIsTurnedOnAt: location ] ) {
		color = [ UIColor yellowColor ];
	}
	else {
		color = [ UIColor blackColor ];
	}
	
	[ color setFill ];
	UIRectFill( [ self getRectForGameLocation: location ] );
}


-(void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	UITouch *touch = touches.anyObject;
	CGPoint touchLocation = [ touch locationInView: self ];
	CGPoint location = [ self gameLocationForCellAt: touchLocation ];
	
	if( [ game canSelectCellAt: location ] ) {
		[ game selectCellAt: location ];
		[ self setNeedsDisplay ];
	}
}

-(CGRect) getRectForGameLocation: (CGPoint) location {
	int x, y;
	
	x = SCREEN_WIDTH / 2 - GAME_WIDTH / 2 + ( location.x - 1 ) * ( CELL_WIDTH + CELL_MARGIN );
	y = SCREEN_HEIGHT / 2 - GAME_HEIGHT / 2 + ( location.y - 1 ) * ( CELL_HEIGHT + CELL_MARGIN );
	
	return CGRectMake( x, y, CELL_WIDTH, CELL_HEIGHT );
}


// rewrite at a later date to take CELL_MARGIN into consideration
-(BOOL) cellExistsAtLocation: (CGPoint) location {
	if( location.x < SCREEN_WIDTH / 2 - GAME_WIDTH / 2 || location.x > SCREEN_WIDTH / 2 + GAME_WIDTH / 2 ) {
		return NO;
	}
	
	if( location.y < SCREEN_HEIGHT / 2 - GAME_HEIGHT / 2 || location.y > SCREEN_HEIGHT / 2 + GAME_HEIGHT / 2 ) {
		return NO;
	}
	
	return YES;
}

-(CGPoint) gameLocationForCellAt: (CGPoint) location {
	int x, y;
	
	x = ( location.x - ( SCREEN_WIDTH / 2 - GAME_WIDTH / 2 ) ) / CELL_WIDTH + 1;
	y = ( location.x - ( SCREEN_HEIGHT / 2 - GAME_HEIGHT / 2 ) ) / CELL_HEIGHT + 1;
	
	return CGPointMake( x, y );
}

- (void)dealloc {
	[ game release ];
    [ super dealloc ];
}


@end
