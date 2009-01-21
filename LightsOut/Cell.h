//
//  Cell.h
//  LightsOut
//
//  Created by Alex Watt on 21/01/2009.
//  Copyright 2009 Greycourt Software Ltd.. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Cell : NSObject {
	BOOL turnedOn;
}

@property ( nonatomic ) BOOL turnedOn;

-(id) initWithHugeCock;
-(void) toggleLight;

@end
