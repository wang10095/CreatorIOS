//
//  CppAdapter.cpp
//  cocos2d_libs
//
//  Created by xuyuanteng on 16/8/29.
//  Copyright (c) 2016年 lcb. All rights reserved.
//

#include "CppAdapter.h"
USING_NS_CC;
using namespace std;
//进入cocos
void CppAdapter::enterCocosGame()
{    
    //CocosDelegate::getInstance()->enterLuaCocosGame();
}

//播放动画
void CppAdapter::playAnimation(int animationID,cocos2d::Image* userIcon,cocos2d::Image* anchorIcon)
{
    //CocosDelegate::getInstance()->playLuaAnimation(animationID,userIcon,anchorIcon);
}

void CppAdapter::removeCocosGameLayer()
{
    //CocosDelegate::getInstance()->removeLuaGameLayer();
}

void CppAdapter::removeCocosAnimationLayer()
{
    //CocosDelegate::getInstance()->removeLuaAnimationLayer();
}

void CppAdapter::startCocosScene001()
{
    log("CppAdapter::startCocosScene001().....");
//    AppDelegate::getInstance()->startCocosScene001();
}

void CppAdapter::startCocosScene002()
{
    log("CppAdapter::startCocosScene002().....");
//    AppDelegate::getInstance()->exitGameView();
}

void CppAdapter::exitCocosGame()
{
    //CocosDelegate::getInstance()->exitGameView();
}

void CppAdapter::setCocosIsInit(bool _isInit)
{
    m_cocosIsInit = _isInit;
}

bool CppAdapter::getCocosIsInit()
{
    return m_cocosIsInit;
}
