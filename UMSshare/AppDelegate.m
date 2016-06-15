//
//  AppDelegate.m
//  UMSshare
//
//  Created by xiaoyin on 16/5/27.
//  Copyright © 2016年 xiaoyin. All rights reserved.
//

#import "AppDelegate.h"
#import "UMSocial.h"
#import "UMSocialQQHandler.h"
#import "UMSocialSinaSSOHandler.h"
#import "UMSocialWechatHandler.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //设置友盟的appKey
    [UMSocialData setAppKey:@"5747bfa767e58eb98a001860"];
    
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"1517297772"
                                              secret:@"73343a84009cc69ae7982247238c05e5"
     
                                         RedirectURL:@"http://api.weibo.com/oauth2/default.html"];
    
    /*---------------------------qq----------------------------------*/
    
    [UMSocialQQHandler setQQWithAppId:@"100424468" appKey:@"c7394704798a158208a74ab60104f0ba" url:@"http://www.umeng.com/social"];
    
    [UMSocialQQHandler setSupportWebView:YES];
    
    [UMSocialData defaultData].extConfig.qqData.url = @"http://baidu.com";
    
    [UMSocialData defaultData].extConfig.qzoneData.url = @"http://baidu.com";
    
    [UMSocialData defaultData].extConfig.qqData.title = @"QQ分享title";
    
    [UMSocialData defaultData].extConfig.qzoneData.title = @"Qzone分享title";
    
    /*---------------------微信----------------------------------*/
    
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"3921700954"
                                              secret:@"04b48b094faeb16683c32669824ebdad"
                                         RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];

    
    [UMSocialWechatHandler setWXAppId:@"wxd930ea5d5a258f4f" appSecret:@"db426a9829e4b49a0dcac7b4162da6b6" url:@"http://www.umeng.com/social"];
    
    [UMSocialData defaultData].extConfig.wechatSessionData.url = @"http://baidu.com";
    
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = @"http://baidu.com";
    
    [UMSocialData defaultData].extConfig.wechatSessionData.title = @"微信好友title";
    
    [UMSocialData defaultData].extConfig.wechatTimelineData.title = @"微信朋友圈title";
    

    
    return YES;
}


-(BOOL)application:(UIApplication *)application openURL:(nonnull NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(nonnull id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    
    if (result  == FALSE){
        
        //调用其他的SDK
    }
    
    return result;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
