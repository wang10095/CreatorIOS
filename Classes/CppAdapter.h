//
//  CppAdapter.h
//  cocos2d_libs
//
//  Created by xuyuanteng on 16/8/29.
//  Copyright (c) 2016年 lcb. All rights reserved.
//

#ifndef __game4__CppAdapter__
#define __game4__CppAdapter__

#include <stdio.h>
#include "AppDelegate.h"
#include "cocos2d.h"

class CppAdapter
{
public:
    static CppAdapter* getInstance()
    {
        static CppAdapter* adapter = new CppAdapter();
        if (adapter)
        {
            return adapter;
        }
        return NULL;
    }
    //void setViewController(void* self);
    
    //显示cocos游戏层
    void enterCocosGame();
    
    //播放cocos礼物动画
    void playAnimation(int animationID,cocos2d::Image* userIcon,cocos2d::Image* anchorIcon);
    
    //移除cocos游戏层
    void removeCocosGameLayer();
    
    //移除cocos动画层
    void removeCocosAnimationLayer();
    
    //移除cocos视图
    void exitCocosGame();
    
    void startCocosScene001();
    
    void startCocosScene002();
    
    //设置获取是否已加载cocos
    void setCocosIsInit(bool _isInit);
    bool getCocosIsInit();
    
private:
    //void* self;
    bool m_cocosIsInit = false;
};




#endif /* defined(__game4__CppAdapter__) */
