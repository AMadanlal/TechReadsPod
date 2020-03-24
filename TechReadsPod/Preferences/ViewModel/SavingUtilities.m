//
//  NewProto.m
//  TechReadsPod
//
//  Created by Akshar Madanlal on 2020/03/20.
//  Copyright © 2020 DVT. All rights reserved.
//

#import "SavingUtilities.h"

NS_ASSUME_NONNULL_BEGIN
@implementation SavingUtilities
NSString *homeDir;
NSString *filepath;
NSFileManager *fileMgr;

-(NSString *)GetDocumentDirectory{
fileMgr = [NSFileManager defaultManager];
homeDir = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
return homeDir;
}

- (NSString*) LoadMedium {
  filepath = [[NSString alloc] init];
  filepath = [self.GetDocumentDirectory stringByAppendingPathComponent: @"UserMedium.txt"];
  NSError *error;
  NSString *filetext = [[NSString alloc] initWithContentsOfFile:filepath encoding: NSUTF8StringEncoding error: &error];
  if (!filetext)
  {
    filetext = @"The platform coulnt be obtained";
  }
  return filetext;
}

//@param str String to write.
//@param fileName Name of the file.

- (void) SaveMedium : (NSMutableString*) tosave : (NSString*) fileurlstring {
//  filepath = [[NSString alloc] init];
//  filepath = [self.GetDocumentDirectory stringByAppendingPathComponent: @"UserMedium.txt"];
   NSError *err;
  BOOL isOK = [tosave writeToFile:fileurlstring atomically:YES encoding:NSUTF8StringEncoding error:&err];
  if (!isOK) {
    NSLog(@"Error writing file at %@\n%@",
    filepath, [err localizedFailureReason]);
  }
}
 



@end
NS_ASSUME_NONNULL_END
