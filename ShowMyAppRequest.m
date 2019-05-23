//
//  DownloadObject.m
//  ideMobi_DownloadFile
//
//  Created by Jean-François CONTART on 13/04/2014.
//  Copyright (c) 2014 idéMobi. All rights reserved.
//

#import "ShowMyAppRequest.h"

@implementation ShowMyAppRequest

+(ShowMyAppRequest*)createDownloadForURL:(NSURL*)sUrl withDelegate:(id<ShowMyAppRequestDelegate>)sDelegate
{
//    NSLog(@" %s line %d",__FUNCTION__, __LINE__);
	ShowMyAppRequest *tObject = [[ShowMyAppRequest alloc] initDownloadForURL:(NSURL*)sUrl withDelegate:(id<ShowMyAppRequestDelegate>)sDelegate];
	return tObject;
}

-(id)initDownloadForURL:(NSURL*)sUrl withDelegate:(id<ShowMyAppRequestDelegate>)sDelegate {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
	self = [super init];
	if (self !=nil)
		{
		url = sUrl;
		delegate = sDelegate;
		receivedData = [[NSMutableData alloc] init];
		NSMutableURLRequest *tUrlRequest = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:20.0];
		reception = [NSURLConnection connectionWithRequest:tUrlRequest delegate:self];
		[reception start];
		}
	return self;
}

-(void)dealloc {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
	if (reception != nil){reception=nil;};
	if (receivedData != nil){receivedData=nil;};
	url = nil;
	delegate = nil;
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
}

- (void)connection:(NSURLConnection *)connection didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge{
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
	if (delegate != NULL && [delegate respondsToSelector:@selector(DownloadObjectDelegateError:)])
		{
        [delegate DownloadObjectDelegateError:self];
		};
	if (reception != nil){reception=nil;};
	if (receivedData != nil){receivedData=nil;};
	
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
	if (delegate != NULL && [delegate respondsToSelector:@selector(DownloadObjectDelegateError:)])
		{
        [delegate DownloadObjectDelegateError:self];
		};
	if (reception != nil){reception=nil;};
	if (receivedData != nil){receivedData=nil;};
}

- (void)connection:(NSURLConnection *)connection didSendBodyData:(NSInteger)bytesWritten totalBytesWritten:(NSInteger)totalBytesWritten totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
	float tPercentageUpload = (float)totalBytesWritten/(float)totalBytesExpectedToWrite;
	if (delegate != NULL && [delegate respondsToSelector:@selector(DownloadObjectDelegatePercentage:percentage:)])
		{
		[delegate DownloadObjectDelegatePercentage:self percentage:tPercentageUpload];
		};
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
	if ([response respondsToSelector:@selector(statusCode)])
		{
		int t_statusCode = (int)[((NSHTTPURLResponse *)response) statusCode];
		if (t_statusCode >= 400)
			{
			[connection cancel];
			
			NSDictionary *t_errorInfo = [NSDictionary dictionaryWithObject:[NSString stringWithFormat: NSLocalizedString(@"Server returned status code %d",@""), t_statusCode] forKey:NSLocalizedDescriptionKey];
			NSError *t_statusError = [NSError errorWithDomain:@"HTTP" code:t_statusCode userInfo:t_errorInfo];
			[self connection:connection didFailWithError:t_statusError];
			}
        else
			{
            if (receivedData!=nil)
				{
				[receivedData setLength:0];
				};
			actualWeight = 0;
			finalWeight = [response expectedContentLength]; // mon Content-Length:
			if (finalWeight != NSURLResponseUnknownLength)
				{
				if (delegate != NULL && [delegate respondsToSelector:@selector(DownloadObjectDelegatePercentage:percentage:)])
					{
					[delegate DownloadObjectDelegatePercentage:self percentage:[self percentage]];
					};
				};
			};
		};
}

-(float)percentage {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
	if ((float)finalWeight > 0.0f)
	{
		return (float)actualWeight/(float)finalWeight;
	}
	else
	{
		return 0.0f;
	}
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
	if (receivedData!=nil)
		{
		[receivedData appendData:data];
		actualWeight = actualWeight + [data length];
		if (finalWeight != NSURLResponseUnknownLength)
			{
			if (delegate != NULL && [delegate respondsToSelector:@selector(DownloadObjectDelegatePercentage:percentage:)])
				{
				[delegate DownloadObjectDelegatePercentage:self percentage:[self percentage]];
				};
			};
		};
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
	if (delegate != NULL && [delegate respondsToSelector:@selector(DownloadObjectDelegateFinish:data:)])
		{
		[delegate DownloadObjectDelegateFinish:self data:[NSData dataWithData:receivedData]];
		};
}

@end
