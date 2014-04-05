//
//  AlertViewDelegate.h
//  ExampleBlock
//
//  Created by Alexander on 03.04.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlertViewDelegate : NSObject <UIAlertViewDelegate>

+ (void)handleAlertView:(UIAlertView*)alertView buttPressedBlock:(void(^)(int))buttPressedBlock;

@end
