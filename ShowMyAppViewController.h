//
//  ShowMyAppViewController.h
//  show-my-app
//
//  Created by JFC idéMobi on 23/05/2019.
//  Copyright © 2019 idéMobi. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ShowMyApp.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShowMyAppViewController : NSViewController {
    IBOutlet NSImageView *imageQRCode;
    ShowMyApp *ShowMyAppInstalled;
}
-(void)Install:(ShowMyApp*) sShowMyApp;
-(IBAction)Share:(id)sSender;
@end

NS_ASSUME_NONNULL_END
