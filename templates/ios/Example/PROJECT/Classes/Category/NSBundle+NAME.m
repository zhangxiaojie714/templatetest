//
//  NSBundle+${POD_NAME}.m
//  ${POD_NAME}_Example
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright © TODAYS_YEAR PROJECT_OWNER. All rights reserved.
//

#import "NSBundle+${POD_NAME}.h"
// FakeClass 仅作占位符用，即只为分类中的 `bundleForClass:` 方法服务
@interface ${POD_NAME}PodFakeClass : NSObject

@end
@implementation ${POD_NAME}PodFakeClass

@end
@implementation NSBundle (${POD_NAME})

+ (NSBundle *)dj${POD_NAME}_resourceBundles {
    
    static NSBundle *targetBundle = nil;
    if (targetBundle == nil) {
        NSURL *url = [[NSBundle bundleForClass:[${POD_NAME}PodFakeClass class]] URLForResource:@"${POD_NAME}" withExtension:@"bundle"];
        targetBundle = [NSBundle bundleWithURL:url];
    }
    return targetBundle;
    
}

@end
