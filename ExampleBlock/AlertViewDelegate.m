//
//  AlertViewDelegate.m
//  ExampleBlock
//
//  Created by Alexander on 03.04.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "AlertViewDelegate.h"
#import <objc/runtime.h>

@interface AlertViewDelegate()
@property (nonatomic, copy) void(^block)(int);
@end

@implementation AlertViewDelegate

+ (void)handleAlertView:(UIAlertView*)alertView buttPressedBlock:(void(^)(int))buttPressedBlock
{
    AlertViewDelegate *delegate = [[AlertViewDelegate alloc] init];
    alertView.delegate = delegate;
    delegate.block = buttPressedBlock;
    
    char v = '2';
    objc_setAssociatedObject(alertView, &v, delegate, OBJC_ASSOCIATION_RETAIN);
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(self.block)
        self.block(buttonIndex);
}

@end
