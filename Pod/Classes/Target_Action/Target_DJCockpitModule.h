//
//  Target_DJCockpitModule.h
//  DJCockpitModule
//  路由
//  Created by CSS on 2021/2/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Target_DJCockpitModule : NSObject

//初始化
- (void)Action_SetInitailParam:(NSDictionary *)param;

//管理层看板
- (UIViewController *)Action_GetManageController:(NSDictionary *)param;

//业务员看板
- (UIViewController *)Action_GetSalesmanController:(NSDictionary *)param;

//空白页
- (UIViewController *)Action_GetEmptyController:(NSDictionary *)param;

//业务员看板-首页搜索
- (UIViewController *)Action_GetSalesmanHomeSearchController:(NSDictionary *)param;

//获取是否合作/是否是业务员还是管理者
- (void)Action_JudgeCooperationSalesman:(NSDictionary *)param;

/** 驾驶舱首页 */
- (UIViewController *)Action_GetCockpitHomeController:(NSDictionary *)param;

@end

NS_ASSUME_NONNULL_END
