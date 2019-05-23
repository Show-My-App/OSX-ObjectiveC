//
//  ShowMyAppWindowController.h
//  show-my-app
//
//  Created by JFC idéMobi on 23/05/2019.
//  Copyright © 2019 idéMobi. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ShowMyAppWindowController.h"
#import "ShowMyAppViewController.h"
#import "ShowMyApp.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShowMyAppWindowController : NSWindowController <NSWindowDelegate> {
    ShowMyAppViewController *myShowMyAppViewController;
}
+(ShowMyAppWindowController*)CreateAndInstall:(ShowMyApp*) sShowMyApp;
-(void)Install:(ShowMyApp*) sShowMyApp;
@end

NS_ASSUME_NONNULL_END
