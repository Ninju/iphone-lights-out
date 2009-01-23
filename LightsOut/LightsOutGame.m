//
//  LightsOutGame.m
//  LightsOut
//
//  Created by Alex Watt on 21/01/2009.
//  Copyright 2009 Greycourt Software Ltd.. All rights reserved.
//

#import "LightsOutGame.h"
#import "Cell.h"


@implementation LightsOutGame

-(id) initWithLargerCock {
	self = [ super init ];
	if( self ) {
		int x, y;
		srandom( time( NULL ) );
		
		for( y = 0; y < [ self getHeight ]; y++ ) {
			for( x = 0; x < [ self getWidth ]; x++ ) {
				BOOL lightOn = random() % 2 == 1 ? YES : NO;
				NSLog( @"Light is %f", lightOn );
				Cell *cell = [ [ Cell alloc ] initWithLightOn: lightOn ];
				cells[ y ][ x ] = cell;
			}
		}
	}
	return self;
}

-(int) getWidth {
	return CELL_ROWS;
}

-(int) getHeight {
	return CELL_COLS;
}

-(Cell *) getCellAt: (CGPoint) location {
	return cells[ (int) ( location.y - 1 ) ][ (int) ( location.x - 1 ) ];
}

-(void) selectCellAt: (CGPoint) location {
	Cell *cell = [ self getCellAt: location ];
	[ cell toggleLight ];
}

-(BOOL) canSelectCellAt: (CGPoint) location {
	return YES;
}

-(BOOL) cellIsTurnedOnAt: (CGPoint) location {
	Cell *cell = [ self getCellAt: location ];
  return [ cell isTurnedOn ];
}

-(void) dealloc {
	[ super dealloc ];
}

@end




