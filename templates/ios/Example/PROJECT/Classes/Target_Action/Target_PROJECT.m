//
//  Target_${POD_NAME}.m
//  ${POD_NAME}
//  路由  POD_NAME
//  Created by PROJECT_OWNER on TODAYS_DATE.
//

#import "Target_${POD_NAME}.h"
//manage

//category
#import "NSBundle+${POD_NAME}.h"

@implementation Target_${POD_NAME}

//初始化
- (void)Action_SetInitailParam:(NSDictionary *)param {
    NSString *baseUrl = param[@"baseUrl"];
    NSDictionary *baseParam = param[@"baseParam"];
    NSString *releaseEnvironment = [NSString stringWithFormat:@"%@",param[@"releaseEnvironment"]];

    [[<# DJCRMNetWork #> manager] initializeBaseUrl:baseUrl baseParam:baseParam releaseEnvironment:releaseEnvironment];
}


//vc
- (UIViewController *)Action_GetController:(NSDictionary *)param {
    <#ViewController #> *toVc = [[<#ViewController #> alloc]init];

    return toVc;
}


@end
