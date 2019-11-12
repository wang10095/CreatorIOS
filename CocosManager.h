//
//  AnimationManager.h
//  cocos2d_libs
//
//  Created by xuyuanteng on 16/8/29.
//  Copyright (c) 2016年 lcb. All rights reserved.
//

/*
    cocos接口类，提供给ios端
*/

#import <UIKit/UIKit.h>


@class GameViewController;


@interface CocosManager : NSObject
+(CocosManager *) getInstance;

//在当前视图上运行cocos场景(用户进入主播房间时调用)
-(UIViewController*)getCocosEaglView:(NSString*)name;

//显示或者隐藏游戏界面
-(void)enterCocosGameScene:(NSString*) userKey withRoomId:(int) roomId;

//移除cocos游戏界面，关闭游戏窗口或切换主播房间的时候调用
-(void)removeCocosGameLayer;

//结束cocos视图(退出主播房间或者退出应用时调用)
-(void)exitCocosGame;

-(void)hideCocosGame;

-(void)showCocosGame;

//从后台重新调起
-(void) cocosApplicationWillEnterForeground;

//进入后台
-(void) cocosApplicationDidEnterBackground;

@property(nonatomic, readonly) GameViewController* gameViewController;

//当前游戏层是否隐藏
@property(assign) bool  m_bGameLayerIsVisible;

-(void)startCocosScene001;

-(void)startCocosScene002;

@end
