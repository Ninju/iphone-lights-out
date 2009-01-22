//
//  LightsOutGame.h
//  LightsOut
//
//  Created by Alex Watt on 21/01/2009.
//  Copyright 2009 Greycourt Software Ltd.. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CELL_ROWS 5
#define CELL_COLS 5

@class Cell;


@interface LightsOutGame : NSObject {
	Cell *cells[ CELL_COLS ][ CELL_ROWS ];
}

-(id) initWithLargerCock;
-(int) getWidth;
-(int) getHeight;
-(Cell *) getCellAt: (CGPoint) location;
-(BOOL) cellIsTurnedOnAt: (CGPoint) location;
-(BOOL) canSelectCellAt: (CGPoint) location;
-(void) selectCellAt: (CGPoint) location;

@end
