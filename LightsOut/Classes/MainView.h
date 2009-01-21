//
//  MainView.h
//  LightsOut
//
//  Created by Alex Watt on 21/01/2009.
//  Copyright Greycourt Software Ltd. 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LightsOutGame.h"

@interface MainView : UIView {
	LightsOutGame *game;
}

@property ( nonatomic, retain ) LightsOutGame *game;

-(void) drawCellAtGameLocation: (CGPoint) location;
-(CGRect) getRectForGameLocation: (CGPoint) location;
-(BOOL) cellExistsAtLocation: (CGPoint) location;
-(CGPoint) gameLocationForCellAt: (CGPoint) location;

@end
