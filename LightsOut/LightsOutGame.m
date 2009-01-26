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
	int dx, dy, x, y, i;
	Cell *selectedCell, *adjacentCell;
	CGPoint direction;
	CGPoint directions[ 4 ] = { CGPointMake( 1, 0 ), CGPointMake( 0, 1 ), CGPointMake( -1, 0 ), CGPointMake( 0, -1 ) };
	
	for( i = 0; i < 4; i++ ) {
		direction = directions[ i ];
		dx = direction.x;
		dy = direction.y;
		
		x = dx + location.x;
		y = dy + location.y;
		
		if( x >= 1 && y >= 1 && x <= [ self getWidth ] && y <= [ self getHeight ] ) {
			adjacentCell = [ self getCellAt: CGPointMake( x, y ) ];
			[ adjacentCell toggleLight ];
		}
	}
	
	selectedCell = [ self getCellAt: location ];
	[ selectedCell toggleLight ];
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




