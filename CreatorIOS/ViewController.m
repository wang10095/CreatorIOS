//
//  ViewController.m
//  CreatorIOS
//
//  Created by wangjunwei on 2019/10/24.
//  Copyright © 2019 wangjunwei. All rights reserved.
//

#import "ViewController.h"
#import "../CocosManager.h"

@interface ViewController ()

@end

@implementation ViewController
UIViewController * m_cocosView;
- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect bounds = [[UIScreen mainScreen] bounds];
//  Do any additional setup after loading the view.
    NSString *name = @"wangjunwei";
    m_cocosView =  [[CocosManager getInstance] getCocosEaglView:name];
    

    
//    if (!m_cocosView){
//        m_cocosView =   [[CocosManager instance] getCocosEaglView];
//        [self.view addSubview:m_cocosView];
//    }else{
//        [[CocosManager instance]startCocosScene002];
//    }
 
    
}


@end
