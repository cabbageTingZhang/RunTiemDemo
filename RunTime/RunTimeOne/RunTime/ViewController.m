//
//  ViewController.m
//  RunTime
//
//  Created by mac-mini-ios on 16/3/9.
//  Copyright © 2016年 mac-mini-ios. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self performSelector:@selector(doSomething)];
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(doSomething)) {
        NSLog(@"add methed here");
        
        //class_addMethod方法详解
//        cls   在这个类中添加方法，也就是方法所添加的类
//        name  方法名，这个可以随便起的
//        imp   实现这个方法的函数
//        types 定义该数返回值类型和参数类型的字符串，这里比如"v@:"，其中v就是void，带表返回类型就是空，@代表参数，这里指的是id(self)，这里:指的是方法SEL(_cmd)，比如我再定义一个函数
        class_addMethod([self class], sel, (IMP)dynamicMethodIMP, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

void dynamicMethodIMP(id self, SEL _cmd){
    NSLog(@"doSomething SEL");
}

//添加这个函数的方法就应该是ass_addMethod([self class], @selector(newMethod), (IMP)newMethod, "i@:@");
int newMethod (id self,SEL _cmd, NSString *str){
    return 100;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
