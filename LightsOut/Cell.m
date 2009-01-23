//
//  Cell.m
//  LightsOut
//
//  Created by Alex Watt on 21/01/2009.
//  Copyright 2009 Greycourt Software Ltd.. All rights reserved.
//

#import "Cell.h"


@implementation Cell

@synthesize turnedOn;

-(id) initWithLightOn: (BOOL) lightOn {
	if( self = [ super init ] ) {
		turnedOn = lightOn;
	}
	
	return self;
}

-(id) initWithHugeCock {
	self = [ super init ];
	if( self ) {
		turnedOn = YES;
	}
	return self;
}

-(void) toggleLight {
	turnedOn = !turnedOn;
}

-(BOOL) isTurnedOn {
	return turnedOn;
}

@end
