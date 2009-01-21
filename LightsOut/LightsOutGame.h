//
//  LightsOutGame.h
//  LightsOut
//
//  Created by Alex Watt on 21/01/2009.
//  Copyright 2009 Greycourt Software Ltd.. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"
#define NUMBER_OF_CELLS 5


@interface LightsOutGame : NSObject {
	Cell *cells[ NUMBER_OF_CELLS ][ NUMBER_OF_CELLS ];
}

-(id) initWithLargerCock;
-(int) getWidth;
-(int) getHeight;
-(Cell *) getCellAt: (CGPoint) location;
-(BOOL) cellIsTurnedOnAt: (CGPoint) location;
-(BOOL) canSelectCellAt: (CGPoint) location;
-(void) selectCellAt: (CGPoint) location;

@end
