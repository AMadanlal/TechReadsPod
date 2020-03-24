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

- (void) SaveMedium : (NSMutableString*) tosave {
//  filepath = [[NSString alloc] init];
//  filepath = [self.GetDocumentDirectory stringByAppendingPathComponent: @"UserMedium.txt"];
//   NSError *err;
//  BOOL isOK = [tosave writeToFile:filepath atomically:YES encoding:NSUTF8StringEncoding error:&err];
//  if (!isOK) {
//    NSLog(@"Error writing file at %@\n%@",
//    filepath, [err localizedFailureReason]);
  NSData *data = [tosave dataUsingEncoding:NSUTF8StringEncoding];
      NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
      if (0 < [paths count]) {
          NSString *documentsDirPath = [paths objectAtIndex:0];
          NSString *filePath = [documentsDirPath stringByAppendingPathComponent:@"UserMedium.txt"];
          NSFileManager *fileManager = [NSFileManager defaultManager];
          if ([fileManager fileExistsAtPath:filePath]) {
              // Add the text at the end of the file.
              NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:filePath];
  //            [fileHandler seekToEndOfFile];
              [fileHandler writeData:data];
              [fileHandler closeFile];
          } else {
              // Create the file and write text to it.
              [data writeToFile:filePath atomically:YES];
          }
      }
  
  }
 



@end
NS_ASSUME_NONNULL_END
