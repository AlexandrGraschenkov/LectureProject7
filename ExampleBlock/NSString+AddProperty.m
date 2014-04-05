//
//  NSString+AddProperty.m
//  ExampleBlock
//
//  Created by Alexander on 05.04.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "NSString+AddProperty.h"
#import <objc/runtime.h>

@implementation NSString (AddProperty)

static char v = '2';

- (void)setSomeVal:(NSString *)someVal
{
    objc_setAssociatedObject(self, &v, someVal, OBJC_ASSOCIATION_RETAIN);
}

- (NSString *)someVal
{
    return objc_getAssociatedObject(self, &v);
}

@end
