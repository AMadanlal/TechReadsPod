//
//  NewProto.m
//  TechReadsPod
//
//  Created by Akshar Madanlal on 2020/03/20.
//  Copyright © 2020 DVT. All rights reserved.
//

#import "NewProto.h"

NS_ASSUME_NONNULL_BEGIN
@implementation NewProto
NSString *homeDir;
NSString *filepath;
NSFileManager *fileMgr;
//NSString *filename = @"UserMedium.txt";

- (void) someMethod {
    NSLog(@"SomeMethod Ran");
}

-(NSString *)GetDocumentDirectory{
fileMgr = [NSFileManager defaultManager];
homeDir = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
return homeDir;
}

- (NSString*) LoadStuff {
  filepath = [[NSString alloc] init];
  filepath = [self.GetDocumentDirectory stringByAppendingPathComponent: @"UserMedium.txt"];
  NSError *error;
  NSString *filetext = [[NSString alloc] initWithContentsOfFile:filepath encoding:NSUnicodeStringEncoding error: &error];
  if (!filetext)
  {
    filetext = @"The platform coulnt be obtained";
  }
  return filetext;
}


@end
NS_ASSUME_NONNULL_END
