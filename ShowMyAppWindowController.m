//
//  ShowMyAppWindowController.m
//  show-my-app
//
//  Created by JFC idéMobi on 23/05/2019.
//  Copyright © 2019 idéMobi. All rights reserved.
//

#import "ShowMyAppWindowController.h"
#import "ShowMyAppViewController.h"

@interface ShowMyAppWindowController ()

@end

@implementation ShowMyAppWindowController

+(ShowMyAppWindowController*)CreateAndInstall:(ShowMyApp*) sShowMyApp {
    static ShowMyAppWindowController *kShowMyAppWindowController = nil;
    if (kShowMyAppWindowController == nil)
    {
        kShowMyAppWindowController = [[ShowMyAppWindowController alloc] initWithWindowNibName:@"ShowMyAppWindowController"];
    }
    [kShowMyAppWindowController showWindow:self];
    [kShowMyAppWindowController Install:sShowMyApp];
    return kShowMyAppWindowController;
}
- (void)windowDidLoad {
    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    if ([self window]!=nil)
    {
        NSLog(@"ERROR WINDOW EXIST  %s line %d",__FUNCTION__, __LINE__);
        [[self window] setDelegate:self];
    }
    else
    {
        NSLog(@"ERROR WINDOW IS NIL  %s line %d",__FUNCTION__, __LINE__);
    }
    [super windowDidLoad];
    if ([self window]!=nil)
    {
        NSLog(@"ERROR WINDOW EXIST  %s line %d",__FUNCTION__, __LINE__);
        [[self window] setDelegate:self];
    }
    else
    {
        NSLog(@"ERROR WINDOW IS NIL  %s line %d",__FUNCTION__, __LINE__);
    }
    myShowMyAppViewController = [[ShowMyAppViewController alloc] initWithNibName:@"ShowMyAppViewController" bundle:nil ];
    [[[self window] contentView] addSubview:[myShowMyAppViewController view]];
}
-(void)Install:(ShowMyApp*) sShowMyApp {
    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [myShowMyAppViewController Install:sShowMyApp];
}

-(void)windowDidResignKey:(NSNotification *)sNotification {
    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
//    [self close];
}

- (void)windowDidMove:(NSNotification *)notification {
    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
}

- (BOOL)canBecomeKeyWindow {
    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    return YES;
}

- (BOOL)canBecomeMainWindow {
    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    return YES;
}
@end
