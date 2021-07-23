//
//  Target_DJCockpitModule.m
//  DJCockpitModule
//  路由
//  Created by CSS on 2021/2/1.
//

#import "Target_DJCockpitModule.h"
//manage
#import "DJCockpitNetworkManage.h"
//vc
#import "DJCockpitManageHomeController.h"
#import "DJCockpitSalesmanHomeController.h"
#import "DJCockpitEmptyController.h"
#import "DJCockpitSalesmanHomeSearchController.h"
#import "DJCockpitHomeController.h"
//category
#import "NSBundle+DJCockpit.h"

typedef void (^Target_DJCockpitCallbackBlock)(NSDictionary *info);
@implementation Target_DJCockpitModule

//初始化
- (void)Action_SetInitailParam:(NSDictionary *)param {
    NSString *baseUrl = param[@"baseUrl"];
    NSString *baseUrl2 = param[@"baseUrl2"];
    NSDictionary *baseParam = param[@"baseParam"];
    NSString *releaseEnvironment = [NSString stringWithFormat:@"%@",param[@"releaseEnvironment"]];
    [[DJCockpitNetworkManage manager]initializeBaseUrl:baseUrl baseUrl2:baseUrl2 baseParam:baseParam releaseEnvironment:releaseEnvironment];
}


//管理层看板
- (UIViewController *)Action_GetManageController:(NSDictionary *)param {
    DJCockpitManageHomeController *vc = [[DJCockpitManageHomeController alloc]init];
    vc.tableViewDidReloadBlock = ^{
        Target_DJCockpitCallbackBlock callback = param[@"DJCockpit_manageController_tableView_did_refresh"];
        if (callback) {
            callback(@{});
        }
    };
    return vc;
}

//业务员看板
- (UIViewController *)Action_GetSalesmanController:(NSDictionary *)param {
    DJCockpitSalesmanHomeController *vc = [[UIStoryboard storyboardWithName:@"DJCockpitSalesmanStoryboard" bundle:[NSBundle djcockpit_resourceBundles]] instantiateViewControllerWithIdentifier:@"DJCockpitSalesmanHomeController"];
    vc.tableViewDidReloadBlock = ^{
        Target_DJCockpitCallbackBlock callback = param[@"DJCockpit_salesmanController_tableView_did_refresh"];
        if (callback) {
            callback(@{});
        }
    };
    return vc;
}

//空白页
- (UIViewController *)Action_GetEmptyController:(NSDictionary *)param {
    DJCockpitEmptyController *vc = [[DJCockpitEmptyController alloc]init];
    vc.emptyType = param[@"DJCockpit_emptyController_emptyType"];
    vc.scrollViewDidReloadBlock = ^{
        Target_DJCockpitCallbackBlock callback = param[@"DJCockpit_emptyController_scroll_did_refresh"];
        if (callback) {
            callback(@{});
        }
    };
    return vc;
}

//业务员看板-首页搜索
- (UIViewController *)Action_GetSalesmanHomeSearchController:(NSDictionary *)param {
    DJCockpitSalesmanHomeSearchController *vc = [[UIStoryboard storyboardWithName:@"DJCockpitSalesmanStoryboard" bundle:[NSBundle djcockpit_resourceBundles]] instantiateViewControllerWithIdentifier:@"DJCockpitSalesmanHomeSearchController"];
    return vc;
}

//获取是否合作/是否是业务员还是管理者
- (void)Action_JudgeCooperationSalesman:(NSDictionary *)param {
    [[DJCockpitNetworkManage manager]judgeCooperationSalesman:^(NSString * _Nonnull boardType, NSString * _Nonnull emptyType) {
        Target_DJCockpitCallbackBlock callback = param[@"DJCockpit_judgeCooperationSalesman_success_block"];
        if (callback) {
            callback(@{@"DJCockpit_judgeCooperationSalesman_boardType":boardType,@"DJCockpit_judgeCooperationSalesman_emptyType":emptyType});
        }
    }];
}

/** 驾驶舱首页 */
- (UIViewController *)Action_GetCockpitHomeController:(NSDictionary *)param {
    DJCockpitHomeController *vc = [[DJCockpitHomeController alloc]init];
    vc.navigationSetupBlock = ^(UIImageView *headImageView) {
        Target_DJCockpitCallbackBlock callback = param[@"DJCockpit_cockpitHomeController_navigationSetupBlock"];
        if (callback) {
            callback(@{@"DJCockpit_cockpitHomeController_headImageView":headImageView});
        }
    };
    vc.headButtonClickBlock = ^{
        Target_DJCockpitCallbackBlock callback = param[@"DJCockpit_cockpitHomeController_headButtonClick"];
        if (callback) {
            callback(@{});
        }
    };
    vc.customermapButtonClickBlock = ^{
        Target_DJCockpitCallbackBlock callback = param[@"DJCockpit_cockpitHomeController_customermapButtonClick"];
        if (callback) {
            callback(@{});
        }
    };
    return vc;
}

@end
