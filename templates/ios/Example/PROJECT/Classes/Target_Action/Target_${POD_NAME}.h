//
//  Target_${POD_NAME}.h
//  ${POD_NAME}
//  路由  PROJECT
//  Created by PROJECT_OWNER on TODAYS_DATE.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Target_${POD_NAME} : NSObject

//初始化
- (void)Action_SetInitailParam:(NSDictionary *)param;

//vc
- (UIViewController *)Action_GetController:(NSDictionary *)param;


@end

NS_ASSUME_NONNULL_END
