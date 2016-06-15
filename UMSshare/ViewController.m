//
//  ViewController.m
//  UMSshare
//
//  Created by xiaoyin on 16/5/27.
//  Copyright © 2016年 xiaoyin. All rights reserved.
//

#import "ViewController.h"
#import "UMSocial.h"


@interface ViewController ()<UMSocialUIDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
 
      
}

//分享的方法
- (IBAction)shareToSina:(UIButton *)sender {
    
    [[UMSocialData defaultData].urlResource setResourceType:UMSocialUrlResourceTypeMusic url:@"http://music.huoxing.com/upload/20130330/1364651263157_1085.mp3"];
    
    [UMSocialData defaultData].extConfig.title = @"分享的title";
    
    [UMSocialData defaultData].extConfig.qqData.url = @"http://baidu.com";
    
    [UMSocialSnsService presentSnsIconSheetView:self
     
                                         appKey:@"5747bfa767e58eb98a001860"
     
                                      shareText:@"友盟社会化分享让您快速实现分享等社会化功能，http://umeng.com/social"
     
                                     shareImage:[UIImage imageNamed:@"icon"]
     
                                shareToSnsNames:@[UMShareToSina,UMShareToQQ,UMShareToQzone,UMShareToWechatSession,UMShareToWechatTimeline]
     
                                       delegate:self];
    
}


//弹出的课分享应用, 以actionsheet的形式展示
-(BOOL)isDirectShareInIconActionSheet{
    
    return YES;
}


-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response{
    
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        
        NSLog(@"分享成功");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
