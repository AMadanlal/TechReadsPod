//
//  NewProto.h
//  TechReadsPod
//
//  Created by Akshar Madanlal on 2020/03/20.
//  Copyright © 2020 DVT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TechReadsPod-Bridging-Header.h"

@interface SavingUtilities : NSObject

- (NSString*) LoadMedium;
- (void) SaveMedium: (NSMutableString*) tosave : (NSString*) fileurlstring;
@end
//NS_ASSUME_NONNULL_END
