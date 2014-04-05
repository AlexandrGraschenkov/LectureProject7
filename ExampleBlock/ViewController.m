//
//  ViewController.m
//  ExampleBlock
//
//  Created by Alexander on 03.04.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "ViewController.h"
#import "AlertViewDelegate.h"

@interface ViewController ()
@property (nonatomic, copy) void(^buttPressedBlock)();
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *butt = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    butt.backgroundColor = [UIColor redColor];
    [self.view addSubview:butt];
    [butt addTarget:self action:@selector(buttPressed) forControlEvents:UIControlEventTouchUpInside];
    
    __weak ViewController *self_ = self;
    self.buttPressedBlock = ^{
        self_.view.backgroundColor = [UIColor blueColor];
    };
}

- (IBAction)butt1Pressed:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Message 1" delegate:self cancelButtonTitle:@"Отмена" otherButtonTitles:@"Ok", @"Ok 2", nil];
    
    [AlertViewDelegate handleAlertView:alert buttPressedBlock:^(int buttIndex) {
        self.view.backgroundColor = [UIColor redColor];
    }];
    
    [alert show];
}

- (IBAction)butt2Pressed:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Message 2" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Отмена", nil];
    
    [AlertViewDelegate handleAlertView:alert buttPressedBlock:^(int buttIndex) {
        self.view.backgroundColor = [UIColor blueColor];
    }];
    
    [alert show];
}

- (IBAction)butt3Pressed:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Message 3" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"Ok", nil];
    
    [AlertViewDelegate handleAlertView:alert buttPressedBlock:^(int buttIndex) {
        self.view.backgroundColor = [UIColor greenColor];
    }];
    
    [alert show];
}


- (void)buttPressed
{
    if(self.buttPressedBlock)
        self.buttPressedBlock();
}

- (void)exampleBlock
{
    
    int(^pow)(int) = ^int(int val){
        return val * val;
    };
    int(^multiply2)(int) = ^int(int val){
        return val * 2;
    };
    int(^multiply3)(int) = ^int(int val){
        return val * 3;
    };
    
    int(^sequence)(int, NSArray*) = ^int(int val, NSArray* operations)
    {
        for(int(^block)(int) in operations){
            val = block(val);
        }
        return val;
    };
    
    int val = sequence(2, @[pow, multiply2, multiply3]);
    
    NSLog(@"%d", val);
    
    id(^randomNumber)() = ^id{
        int randVal = arc4random() % 100;
        return [NSNumber numberWithInteger:randVal];
    };
    NSLog(@"%@", randomNumber());
}


@end
