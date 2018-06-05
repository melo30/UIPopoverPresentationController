//
//  ViewController.m
//  UIPopoverPresentationController
//
//  Created by 陈诚 on 2018/6/5.
//  Copyright © 2018年 陈诚. All rights reserved.
//

#import "ViewController.h"
#import "PopoverPresentationController.h"

@interface ViewController ()<UIPopoverPresentationControllerDelegate>

@property (nonatomic, strong)PopoverPresentationController *vc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBarAction)];
}

- (void)rightBarAction {
    self.vc = [[PopoverPresentationController alloc]init];
    self.vc.modalPresentationStyle = UIModalPresentationPopover;
    self.vc.popoverPresentationController.barButtonItem = self.navigationItem.rightBarButtonItem;
    //箭头方向,不设置默认为up,效果最理想
    self.vc.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    //代理
    self.vc.popoverPresentationController.delegate = self;
    [self presentViewController:self.vc animated:YES completion:nil];
}

//UIPopoverPresentationControllerDelegate,只有返回UIModalPresentationNone才可以让popover在手机上按照我们在preferredContentSize中返回的size显示。这是一个枚举，可以尝试换成其他的值尝试。
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    /* UIModalPresentationFullScreen = 0,
     UIModalPresentationPageSheet NS_ENUM_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED,
     UIModalPresentationFormSheet NS_ENUM_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED,
     UIModalPresentationCurrentContext NS_ENUM_AVAILABLE_IOS(3_2),
     UIModalPresentationCustom NS_ENUM_AVAILABLE_IOS(7_0),
     UIModalPresentationOverFullScreen NS_ENUM_AVAILABLE_IOS(8_0),
     UIModalPresentationOverCurrentContext NS_ENUM_AVAILABLE_IOS(8_0),
     UIModalPresentationPopover NS_ENUM_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED,
     UIModalPresentationBlurOverFullScreen __TVOS_AVAILABLE(11_0) __IOS_PROHIBITED __WATCHOS_PROHIBITED,
     UIModalPresentationNone NS_ENUM_AVAILABLE_IOS(7_0) = -1, */
    
    return  UIModalPresentationNone;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
