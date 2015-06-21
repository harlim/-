//
//  AppDelegate.h
//  小东二校
//
//  Created by wharlim on 15/6/9.
//  Copyright (c) 2015年 wharlim. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GCDAsyncSocket;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    
    GCDAsyncSocket *asyncSocket;
    BOOL connectState;              //判断状态，给页面发送断开连接的状态
  
}

@property (strong, nonatomic) UIWindow *window;
+(AppDelegate *)app;
-(void)sendCom:(NSString *)com;

@end

