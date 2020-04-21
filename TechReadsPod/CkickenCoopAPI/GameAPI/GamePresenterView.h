//
//  DisplayProtocol.h
//  TechReadsPod
//
//  Created by Akshar Madanlal on 2020/03/19.
//  Copyright © 2020 DVT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TechReadsPod-Bridging-Header.h"

NS_ASSUME_NONNULL_BEGIN

@protocol GamePresenterView
- (void) updatePageContent : (NSString *) title withContent: (NSString*)  content andImageURL: (NSString*) imageUrl;
@end

NS_ASSUME_NONNULL_END
