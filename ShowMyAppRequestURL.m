//
//  ShowMyAppRequestURL.m
//  show-my-app
//
//  Created by JFC idéMobi on 22/05/2019.
//  Copyright © 2019 idéMobi. All rights reserved.
//

#import "ShowMyAppRequestURL.h"

@implementation ShowMyAppRequestURL

+(ShowMyAppRequestURL*)createDownloadForURL:(NSURL*)sUrl withBlock:(ShowMyAppBlockURL)sBlock
{
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    ShowMyAppRequestURL *rObject = [[ShowMyAppRequestURL alloc] init];
    [rObject createDownloadForURL:sUrl withBlock:sBlock];
    return rObject;
}

-(void)createDownloadForURL:(NSURL*)sUrl withBlock:(ShowMyAppBlockURL)sBlock {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
    downloadBlock = sBlock;
    downloadRequest =  [ShowMyAppRequest createDownloadForURL:sUrl withDelegate:self];
}

-(void)DownloadObjectDelegateStart:(ShowMyAppRequest*)s_object {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
}

-(void)DownloadObjectDelegatePercentage:(ShowMyAppRequest*)s_object percentage:(float)s_float {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
}

-(void)DownloadObjectDelegateFinish:(ShowMyAppRequest*)s_object data:(NSData*)s_data {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
        NSString *tURLString = [[NSString alloc] initWithData:s_data encoding:NSUTF8StringEncoding];
        NSURL *tURL = [[NSURL alloc] initWithString:tURLString];
        downloadBlock(tURL);
}

-(void)DownloadObjectDelegateError:(ShowMyAppRequest*)s_object {
    //NSLog(@" %s line %d",__FUNCTION__, __LINE__);
}
@end
