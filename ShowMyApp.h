//
//  Show-My-App.m
//  show-my-app
//
//  Created by JFC idéMobi on 20/05/2019.
//  Copyright © 2019 idéMobi. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ShowMyAppRequestURL.h"
#import "ShowMyAppRequestQRCode.h"

@interface ShowMyApp : NSObject <NSSharingServicePickerDelegate>{
    NSString *AppName; // &n=xxxxx
    NSInteger Design; // &d=xxxxx
    NSColor *DesignColor; // &c=#XXXXXX
    NSColor *DesignColorBackground; // &k=#XXXXXX
    bool tiny; // &t=0/1
    bool oneIconOnly; // &i=0/1
    
    NSString *iOS_iPhone_BundleID; // &a=xxxxx
    NSString *iOS_iPad_BundleID; // &b=xxxxx
    NSString *macOS_BundleID; // &m=xxxxx
    NSString *tvOS_BundleID; // &v=xxxxx
    
    NSString *android_BundleID;  // &g=xxxxx
    NSString *android_Tablet_BundleID;  // &h=xxxxx
    
    NSString *windows_BundleID;  // &w=xxxxx
    NSString *windows_Phone_BundleID;  // &x=xxxxx
    
    NSString *steam_BundleID;  // &s=xxxxx
    
//    ShowMyAppRequest *downloadTinyURL;
//    ShowMyAppRequest *downloadTinyQRCode;
//    ShowMyAppRequest *downloadQRCode;
//
//    NSString *tinyURL;
//    UIImage *QRCode;
//    UIImage *tinyQRCode;
//
//    ShowMyAppBlockURL tinyURLBlock;
//    ShowMyAppBlockQRCode tinyQRCodeBlock;
//    ShowMyAppBlockQRCode QRCodeBlock;
    
}

@property (nonatomic, strong) NSString *AppName;
@property (nonatomic) NSInteger Design;
@property (nonatomic, strong) NSColor *DesignColor;
@property (nonatomic, strong) NSColor *DesignColorBackground;
@property (nonatomic) bool tiny;
@property (nonatomic) bool oneIconOnly;

@property (nonatomic, strong) NSString *iOS_iPhone_BundleID;
@property (nonatomic, strong) NSString *iOS_iPad_BundleID;
@property (nonatomic, strong) NSString *macOS_BundleID;
@property (nonatomic, strong) NSString *tvOS_BundleID;

@property (nonatomic, strong) NSString *android_BundleID;
@property (nonatomic, strong) NSString *android_Tablet_BundleID;

@property (nonatomic, strong) NSString *windows_BundleID;
@property (nonatomic, strong) NSString *windows_Phone_BundleID;

@property (nonatomic, strong) NSString *steam_BundleID;

-(void)Show;

-(void)GetURL:(ShowMyAppBlockURL) sBlock;
-(void)GetFullURL:(ShowMyAppBlockURL) sBlock;
-(void)GetTinyURL:(ShowMyAppBlockURL) sBlock;

-(void)GetQRCode:(ShowMyAppBlockQRCode) sBlock;
-(void)GetFullQRCode:(ShowMyAppBlockQRCode) sBlock;
-(void)GetTinyQRCode:(ShowMyAppBlockQRCode) sBlock;

-(void)InsertURL:(NSTextField *)sLabel;
-(void)InsertFullURL:(NSTextField *)sLabel;
-(void)InsertTinyURL:(NSTextField *)sLabel;

-(void)InsertQRCode:(NSImageView *)sImageView;
-(void)InsertFullQRCode:(NSImageView *)sImageView;
-(void)InsertTinyQRCode:(NSImageView *)sImageView;

-(void)Share:(NSView *)sView Message:(NSString*) sMessage;
-(void)ShareFull:(NSView *)sView Message:(NSString*) sMessage;
-(void)ShareTiny:(NSView *)sView Message:(NSString*) sMessage;

-(void)ShareFullQRCode:(NSView *)sView;
-(void)ShareTinyQRCode:(NSView *)sView;

-(void)ShareInWebBrowser;
-(void)Powered;
@end
