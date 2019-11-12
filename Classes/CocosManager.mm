//
//  CocosManager.m
//  cocos2d_libs
//
//  Created by xuyuanteng on 16/11/10.
//  Copyright (c) 2016年 lcb. All rights reserved.
//

#import "CocosManager.h"
#import "GameViewController.h"
#import "cocos2d.h"
#import "platform/ios/CCEAGLView-ios.h"
#import "CppAdapter.h"
#import <AVFoundation/AVFoundation.h>
#import "AppDelegate.h"

#include "cocos/scripting/js-bindings/manual/jsb_module_register.hpp"
#include "cocos/scripting/js-bindings/manual/jsb_global.h"
#include "cocos/scripting/js-bindings/jswrapper/SeApi.h"
#include "cocos/scripting/js-bindings/event/EventDispatcher.h"
#include "cocos/scripting/js-bindings/manual/jsb_classtype.hpp"

USING_NS_CC;

#import "RootViewController.h"

static CocosManager *instance = nullptr;

Application* app = nullptr;
UIWindow *window = nullptr;

@interface CocosManager()
@property (nonatomic, strong) CCEAGLView *m_eaglView;

@end

@implementation CocosManager

+(CocosManager *) getInstance
{
    if( ! instance)
     {
        instance = [[CocosManager alloc] init];
     }
     return instance;
}

-(UIViewController*)getCocosEaglView:(NSString*)name
{
    NSLog(@"=============getCocosEaglView==============%@",name);
    // Add the view controller's view to the window and display.
    float scale = [[UIScreen mainScreen] scale];
    CGRect bounds = [[UIScreen mainScreen] bounds];
    window = [[UIWindow alloc] initWithFrame: bounds];

    // cocos2d application instance
    app = new AppDelegate(bounds.size.width * scale, bounds.size.height * scale);
    app->setMultitouch(true);

    // Use RootViewController to manage CCEAGLView
    RootViewController *_viewController = [[RootViewController alloc]init];
#ifdef NSFoundationVersionNumber_iOS_7_0
    _viewController.automaticallyAdjustsScrollViewInsets = NO;
    _viewController.extendedLayoutIncludesOpaqueBars = NO;
    _viewController.edgesForExtendedLayout = UIRectEdgeAll;
#else
    _viewController.wantsFullScreenLayout = YES;
#endif
  
    [window setRootViewController:_viewController];
    [window makeKeyAndVisible];

    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    //run the cocos2d-x game scene
    app->start();
    
//    [self performSelector:@selector(hideCocosGame) withObject:nil/*可传任意类型参数*/ afterDelay:5.0];
//    [self performSelector:@selector(showCocosGame) withObject:nil/*可传任意类型参数*/ afterDelay:10.0];
    return  _viewController; //返回view
}

-(void)exitCocosGame
{
    NSLog(@"exitCocosGame... ");
    //允许触摸穿透cocos层到ios的view
    //self.m_eaglView.m_allowedThrough = YES;
    self.m_bGameLayerIsVisible = false;
    //退出时删除eglview，不然再次加载时opengl会出错，模拟器显示红色，真机透明
    //    self.m_eaglView = nullptr;
    //    instance = nullptr;
    //    CppAdapter::getInstance()->setCocosIsInit(false);
    //    CppAdapter::getInstance()->exitCocosGame();
     app->end();    //退出cocosGame
}

-(void)hideCocosGame
{
     app->hide();    //退出cocosGame
}
-(void)showCocosGame
{
    app->show();    //退出cocosGame
}


-(void)startCocosScene001
{
    NSLog(@"startCocosScene001...");
    //CocosDelegate::getInstance()->startCocosScene001();
    //CppAdapter::getInstance()->startCocosScene001();
    se::ScriptEngine::getInstance()->evalString("startJsCocosScene001()");
}

-(void)startCocosScene002
{
     NSLog(@"startCocosScene002...");
     //CocosDelegate::getInstance()->startCocosScene002();
    //CppAdapter::getInstance()->startCocosScene002();

    int i = se::ScriptEngine::getInstance()->evalString("startJsCocosScene002()");
    
    //ScriptingCore::getInstance()->runScript("src/scene02.js");
    NSLog(@"startCocosScene002...executeGlobalFunction  = %d",i);
}

-(void)enterCocosGameScene:(NSString*) userKey withRoomId:(int) roomId
{
    NSLog(@"enterCocosGameScene...");
    if (!self.m_bGameLayerIsVisible)
    {
        // NSLog(@"enterCocosGameScene... self.m_bGameLayerIsVisible = false");
        //不允许触摸穿透cocos层到ios的view
        //self.m_eaglView.m_allowedThrough = NO;
        self.m_bGameLayerIsVisible = true;
    }
    else
    {
        //NSLog(@"enterCocosGameScene... self.m_bGameLayerIsVisible = true");
        [self removeCocosGameLayer];
    }
}

-(void)removeCocosGameLayer
{
     NSLog(@"removeCocosGameLayer... ");
     self.m_bGameLayerIsVisible = false;
     //移除游戏界面后允许触摸穿透到ios层
     //self.m_eaglView.m_allowedThrough = YES;
     CppAdapter::getInstance()->removeCocosGameLayer();
}

//进入后台
-(void)cocosApplicationDidEnterBackground
{
    AppDelegate::getInstance()->applicationDidEnterBackground();
}

-(void)cocosApplicationWillEnterForeground
{
     AppDelegate::getInstance()->applicationWillEnterForeground();
}



@end
