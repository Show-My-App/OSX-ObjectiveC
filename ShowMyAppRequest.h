//
//  DownloadObject.h
//  ideMobi_DownloadFile
//
//  Created by Jean-François CONTART on 13/04/2014.
//  Copyright (c) 2014 idéMobi. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@protocol ShowMyAppRequestDelegate;

@interface ShowMyAppRequest : NSObject {
	id <ShowMyAppRequestDelegate> delegate;
	NSURL *url;
	NSURLConnection *reception;
	NSMutableData *receivedData;
	NSError *error;
	
	long long finalWeight;
	long long actualWeight;
}
+(ShowMyAppRequest*)createDownloadForURL:(NSURL*)sUrl withDelegate:(id<ShowMyAppRequestDelegate>)sDelegate;
@end

@protocol ShowMyAppRequestDelegate <NSObject>
@optional
-(void)DownloadObjectDelegateStart:(ShowMyAppRequest*)sObject;
-(void)DownloadObjectDelegatePercentage:(ShowMyAppRequest*)sObject percentage:(float)sFloat;
-(void)DownloadObjectDelegateFinish:(ShowMyAppRequest*)sObject data:(NSData*)sData;
-(void)DownloadObjectDelegateError:(ShowMyAppRequest*)sObject;
@end
