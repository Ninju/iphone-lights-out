//
//  LightsOutGame.m
//  LightsOut
//
//  Created by Alex Watt on 21/01/2009.
//  Copyright 2009 Greycourt Software Ltd.. All rights reserved.
//

#import "LightsOutGame.h"


@implementation LightsOutGame

-(id) initWithLargerCock {
	self = [ super init ];
	if( self ) {
		int x, y;
		
		for( y = 1; y <= [ self getHeight ]; y++ ) {
			for( x = 1; x <= [ self getWidth ]; x++ ) {
				cells[ y ][ x ] = [ [ Cell alloc ] initWithHugeCock ];
			}
		}
	}
	return self;
}

-(int) getWidth {
	return NUMBER_OF_CELLS;
}

-(int) getHeight {
	return NUMBER_OF_CELLS;
}

-(Cell *) getCellAt: (CGPoint) location {
	return cells[ (int) location.y ][ (int) location.x ];
}

-(void) selectCellAt: (CGPoint) location {
	Cell *cell = [ self getCellAt: location ];
	[ cell toggleLight ];
}

-(BOOL) canSelectCellAt: (CGPoint *) location {
	return YES;
}

-(BOOL) cellIsTurnedOnAt: (CGPoint) location {
	Cell *cell = [ self getCellAt: location ];
  return [ cell isTurnedOn ];
}

@end




