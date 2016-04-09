//
//  AppDelegate+Umeng.m
//  Accompany
//
//  Created by 巩鑫 on 16/2/10.
//  Copyright © 2016年 GX. All rights reserved.
//

#import "AppDelegate+Umeng.h"
#import <MobClick.h>
#import <UMSocial.h>
#import <UMSocialWechatHandler.h>
#import <UMSocialSinaSSOHandler.h>
#import <UMSocialQQHandler.h>

@implementation AppDelegate (Umeng)
-(void)initUmengSocial;
{
    [UMSocialData setAppKey:@"56f9ebb1e0f55a112b001834"];
    
    [UMSocialWechatHandler setWXAppId:@"wx65d8cec5be724bcb" appSecret:@"309d46f593addf874d01f3b3b7cda972" url:@"http://www.umeng.com/social"];
    
    //打开新浪微博的SSO开关
  //  [UMSocialSinaSSOHandler openNewSinaSSOWithRedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"2227762321" RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    

   // [UMSocialQQHandler setQQWithAppId:@"1105180120" appKey:@"KEYSNt4kxSSpIMdb7Ai" url:@"http://www.umeng.com/social"];
    

    //    //设置分享到QQ空间的应用Id，和分享url 链接
    [UMSocialQQHandler setQQWithAppId:@"100424468" appKey:@"c7394704798a158208a74ab60104f0ba" url:@"http://www.umeng.com/social"];
    


}
-(void)initMobClick;
{
    //友盟
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];

    
    NSString *bundleID = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    if ([bundleID isEqualToString:@"CoachAccompanying.coach"]) {
        [MobClick startWithAppkey:@"56f9ebb1e0f55a112b001834"
                     reportPolicy:BATCH
                        channelId:Nil];
        [MobClick setAppVersion:version];
#if DEBUG
        [MobClick setLogEnabled:YES];
#else
        [MobClick setLogEnabled:NO];
#endif
    }

}

@end
