//
//  ShowMyAppViewController.m
//  show-my-app
//
//  Created by JFC idéMobi on 23/05/2019.
//  Copyright © 2019 idéMobi. All rights reserved.
//

#import "ShowMyAppViewController.h"
#import "ShowMyApp.h"

@interface ShowMyAppViewController ()

@end

@implementation ShowMyAppViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}
-(void)Install:(ShowMyApp*) sShowMyApp {
    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    ShowMyAppInstalled = sShowMyApp;
    [ShowMyAppInstalled InsertQRCode:imageQRCode];
}
-(IBAction)Share:(id)sSender {
    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [ShowMyAppInstalled Share:sSender Message:@"Try this app"];
}

@end
