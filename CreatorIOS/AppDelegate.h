//
//  AppDelegate.h
//  CreatorIOS
//
//  Created by wangjunwei on 2019/10/24.
//  Copyright © 2019 wangjunwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


+(void)showAlertDialog:(NSString *)title withMessage:(NSString *)message;
@end

