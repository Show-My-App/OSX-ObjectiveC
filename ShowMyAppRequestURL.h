//
//  ShowMyAppRequestURL.h
//  show-my-app
//
//  Created by JFC idéMobi on 22/05/2019.
//  Copyright © 2019 idéMobi. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ShowMyAppRequest.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ShowMyAppBlockURL)(NSURL *sURL);

@interface ShowMyAppRequestURL : NSObject <ShowMyAppRequestDelegate> {
    ShowMyAppRequest *downloadRequest;
    ShowMyAppBlockURL downloadBlock;
}
+(ShowMyAppRequestURL*)createDownloadForURL:(NSURL*)sUrl withBlock:(ShowMyAppBlockURL)sBlock;
@end

NS_ASSUME_NONNULL_END
