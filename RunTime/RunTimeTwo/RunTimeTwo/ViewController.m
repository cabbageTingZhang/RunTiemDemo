//
//  ViewController.m
//  RunTimeTwo
//
//  Created by mac-mini-ios on 16/3/9.
//  Copyright © 2016年 mac-mini-ios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(SecondVCMethod)];
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    NSLog(@"2222");
    Class class = NSClassFromString(@"SecondViewController");
    UIViewController *vc = class.new;
    if (aSelector == NSSelectorFromString(@"SecondVCMethod")) {
        NSLog(@"SecondVCMethod do this !");
        return vc;
    }
    
    return nil;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    NSLog(@"1111");
    return [super resolveInstanceMethod:sel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
