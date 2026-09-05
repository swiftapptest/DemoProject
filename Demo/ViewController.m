//
//  ViewController.m
//  Demo
//
//  Created by Guest User on 05/06/16.
//  Copyright © 2016 Guest User. All rights reserved.
//

#import "ViewController.h"
#import "Demo-Swift.h"

@interface ViewController ()

@property (nonatomic, assign) BOOL hasPresentedOTPFlow;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // created new branch
    
    // comment writen in swift account
    
    [self createView]; // created by app test account
    [self changeViewBGColor];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    // Present the SwiftUI OTP flow (Login -> OTP -> Verification Code -> Success)
    // the first time this screen appears.
    if (!self.hasPresentedOTPFlow) {
        self.hasPresentedOTPFlow = YES;
        UIViewController *otpFlowViewController = [SwiftUIFlowLauncher makeOTPFlowViewController];
        [self presentViewController:otpFlowViewController animated:YES completion:nil];
    }
}


- (void)createView {
    
    UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:aView];
}

- (void)changeViewBGColor {
//    implemented in swift account
    [self.view setBackgroundColor:[UIColor redColor]];
}
// created by app test account
- (void)layoutSublayersOfLayer:(CALayer *)layer {
    NSLog(@"%s", __func__);
}


- (void)validateUserDetails {
    
    NSLog(@"Validating User details");
}


- (void)sendUserDetailsToServer {
    NSLog(@"sending userdetails");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
