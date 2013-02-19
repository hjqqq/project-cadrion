//
//  projectCadrionAppDelegate.h
//  projectCadrion
//
//  Created by Adrian Cayaco on 2/19/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

@class Isgl3dViewController;

@interface projectCadrionAppDelegate : NSObject <UIApplicationDelegate> {

@private
	Isgl3dViewController * _viewController;
	UIWindow * _window;
}

@property (nonatomic, retain) UIWindow * window;

@end
