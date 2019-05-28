//
//  Show-My-App.m
//  show-my-app
//
//  Created by JFC idéMobi on 20/05/2019.
//  Copyright © 2019 idéMobi. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "ShowMyApp.h"
#import "ShowMyAppWindowController.h"

@implementation ShowMyApp

NSString *const website = @"https://www.show-my-app.com/";

@synthesize AppName;
@synthesize Design;
@synthesize DesignColor;
@synthesize DesignColorBackground;
@synthesize tiny;
@synthesize oneIconOnly;
@synthesize iOS_iPhone_BundleID;
@synthesize iOS_iPad_BundleID;
@synthesize macOS_BundleID;
@synthesize tvOS_BundleID;
@synthesize android_BundleID;
@synthesize android_Tablet_BundleID;
@synthesize windows_BundleID;
@synthesize windows_Phone_BundleID;
@synthesize steam_BundleID;

-(NSString*)hexStringFromColor:(NSColor *)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    
    return [NSString stringWithFormat:@"%02lX%02lX%02lX",
            lroundf(r * 255),
            lroundf(g * 255),
            lroundf(b * 255)];
}

-(NSString*) GetParam {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    NSMutableArray *tURL = [[NSMutableArray alloc] init];
    if (ReferencedUser == false)
    {
        if ([AppName length]!=0)
        {
            [tURL addObject:[NSString stringWithFormat:@"n=%@",AppName]];
        }
        [tURL addObject:[NSString stringWithFormat:@"d=%@",[@(Design) stringValue]]];
        if (DesignColor!=nil)
        {
            [tURL addObject:[NSString stringWithFormat:@"c=%@",[self hexStringFromColor:DesignColor]]];
        }
        if (DesignColorBackground!=nil)
        {
            [tURL addObject:[NSString stringWithFormat:@"k=%@",[self hexStringFromColor:DesignColorBackground]]];
        }
        if (oneIconOnly==true)
        {
            [tURL addObject:@"i=1"];
        }
        if ([iOS_iPhone_BundleID length]!=0)
        {
            [tURL addObject:[NSString stringWithFormat:@"a=%@",iOS_iPhone_BundleID]];
        }
        if ([iOS_iPad_BundleID length]!=0)
        {
            if ([iOS_iPad_BundleID isEqualToString:iOS_iPhone_BundleID] == false)
            {
                [tURL addObject:[NSString stringWithFormat:@"b=%@",iOS_iPad_BundleID]];
            }
        }
        if ([macOS_BundleID length]!=0)
        {
            [tURL addObject:[NSString stringWithFormat:@"m=%@",macOS_BundleID]];
        }
        if ([tvOS_BundleID length]!=0)
        {
            [tURL addObject:[NSString stringWithFormat:@"v=%@",tvOS_BundleID]];
        }
        if ([android_BundleID length]!=0)
        {
            [tURL addObject:[NSString stringWithFormat:@"g=%@",android_BundleID]];
        }
        if ([android_Tablet_BundleID length]!=0)
        {
            if ([android_Tablet_BundleID isEqualToString:android_BundleID] == false)
            {
                [tURL addObject:[NSString stringWithFormat:@"h=%@",android_Tablet_BundleID]];
            }
        }
        if ([windows_BundleID length]!=0)
        {
            [tURL addObject:[NSString stringWithFormat:@"w=%@",windows_BundleID]];
        }
        if ([windows_Phone_BundleID length]!=0)
        {
            [tURL addObject:[NSString stringWithFormat:@"x=%@",windows_Phone_BundleID]];
        }
        if ([steam_BundleID length]!=0)
        {
            [tURL addObject:[NSString stringWithFormat:@"s=%@",steam_BundleID]];
        }
    }
    else
    {
        if ([ReccordID length]!=0)
        {
            [tURL addObject:[NSString stringWithFormat:@"r=%@",ReccordID]];
        }
    }
    return [tURL componentsJoinedByString:@"&"];
}

-(NSURL*)CreateURL {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    return [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@%@", website, @"r.php?", [self GetParam]]];
}

-(void)Show {
    [ShowMyAppWindowController CreateAndInstall:self];
}

-(void)GetURL:(ShowMyAppBlockURL) sBlock {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    if (tiny == true)
    {
        [self GetTinyURL:sBlock];
    }
    else
    {
        [self GetFullURL:sBlock];
    }
}
-(void)GetFullURL:(ShowMyAppBlockURL) sBlock {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    sBlock([self CreateURL]);
}

-(void)GetTinyURL:(ShowMyAppBlockURL) sBlock {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    NSURL *tURL = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@%@", website, @"url.php?t=1&", [self GetParam]]];
    [ShowMyAppRequestURL createDownloadForURL:tURL withBlock:sBlock];
}

-(void)GetQRCode:(ShowMyAppBlockQRCode) sBlock {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    if (tiny == true)
    {
        [self GetTinyQRCode:sBlock];
    }
    else
    {
        [self GetFullQRCode:sBlock];
    }
}

-(void)GetFullQRCode:(ShowMyAppBlockQRCode) sBlock {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    NSURL *tURL = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@%@", website, @"qrcode.php?", [self GetParam]]];
    [ShowMyAppRequestQRCode createDownloadForURL:tURL withBlock:sBlock];
}

-(void)GetTinyQRCode:(ShowMyAppBlockQRCode) sBlock {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    NSURL *tURL = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@%@", website, @"qrcode.php?t=1&", [self GetParam]]];
    [ShowMyAppRequestQRCode createDownloadForURL:tURL withBlock:sBlock];
}

-(void)InsertURL:(NSTextField *)sLabel {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    if (tiny == true)
    {
        [self InsertTinyURL:sLabel];
    }
    else
    {
        [self InsertFullURL:sLabel];
    }
}

-(void)InsertFullURL:(NSTextField *)sLabel {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [sLabel setStringValue:[[self CreateURL] absoluteString]];
}

-(void)InsertTinyURL:(NSTextField *)sLabel {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [self GetTinyURL: ^(NSURL *sURL){
        [sLabel setStringValue:[sURL absoluteString]];
    }];
}


-(void)InsertQRCode:(NSImageView *)sImageView {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    if (tiny == true)
    {
        [self InsertTinyQRCode:sImageView];
    }
    else
    {
        [self InsertFullQRCode:sImageView];
    }
}

-(void)InsertFullQRCode:(NSImageView *)sImageView {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [self GetFullQRCode: ^(NSImage *sQRCode){
        [sImageView setImage:sQRCode];
    }];
}

-(void)InsertTinyQRCode:(NSImageView *)sImageView {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [self GetTinyQRCode: ^(NSImage *sQRCode){
        [sImageView setImage:sQRCode];
    }];
}

-(void)Share:(NSView *)sView {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    if (tiny == true)
    {
        [self ShareTiny:sView];
    }
    else
    {
        [self ShareFull:sView];
    }
}

-(void)ShareFull:(NSView *)sView {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    NSArray *tShared = [[NSArray alloc] initWithObjects:[NSString stringWithFormat:@"%@\n%@",Message,[[self CreateURL] absoluteString]], nil];
    NSSharingServicePicker *tSharingServicePicker = [[NSSharingServicePicker alloc] initWithItems:tShared];
    tSharingServicePicker.delegate = self;
    [tSharingServicePicker showRelativeToRect:[sView bounds] ofView:sView preferredEdge:NSMinYEdge];
}

-(void)ShareTiny:(NSView *)sView {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [self GetTinyURL: ^(NSURL *sURL){
        NSArray *tShared = [[NSArray alloc] initWithObjects:[NSString stringWithFormat:@"%@\n%@",self->Message,[sURL absoluteString]], nil];
        NSSharingServicePicker *tSharingServicePicker = [[NSSharingServicePicker alloc] initWithItems:tShared];
        tSharingServicePicker.delegate = self;
        [tSharingServicePicker showRelativeToRect:[sView bounds] ofView:sView preferredEdge:NSMinYEdge];
    }];
}

-(void)ShareFullQRCode:(NSView *)sView  {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [self GetFullQRCode:^(NSImage *sQRCode){
        NSArray *tShared = [[NSArray alloc] initWithObjects:sQRCode, nil];
        NSSharingServicePicker *tSharingServicePicker = [[NSSharingServicePicker alloc] initWithItems:tShared];
        tSharingServicePicker.delegate = self;
        [tSharingServicePicker showRelativeToRect:[sView bounds] ofView:sView preferredEdge:NSMinYEdge];
    }];
}

-(void)ShareTinyQRCode:(NSView *)sView  {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [self GetTinyQRCode: ^(NSImage *sQRCode){
        NSArray *tShared = [[NSArray alloc] initWithObjects:sQRCode, nil];
        NSSharingServicePicker *tSharingServicePicker = [[NSSharingServicePicker alloc] initWithItems:tShared];
        tSharingServicePicker.delegate = self;
        [tSharingServicePicker showRelativeToRect:[sView bounds] ofView:sView preferredEdge:NSMinYEdge];
    }];
}

-(void)ShareInWebBrowser {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [[NSWorkspace sharedWorkspace] openURL:[self CreateURL]];
}

-(void)Powered {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    [[NSWorkspace sharedWorkspace] openURL:[[NSURL alloc] initWithString:website]];
}

- (NSArray<NSSharingService *> *)sharingServicePicker:(NSSharingServicePicker *)sharingServicePicker sharingServicesForItems:(NSArray *)items proposedSharingServices:(NSArray<NSSharingService *> *)proposedServices {
    return proposedServices;
}


- (void)sharingServicePicker:(NSSharingServicePicker *)sharingServicePicker didChooseSharingService:(nullable NSSharingService *)service {
    
}
@end
