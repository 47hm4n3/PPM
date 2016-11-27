//
//  ViewController.m
//  Imagier
//
//  Created by znbk on 26/10/2016.
//  Copyright © 2016 znbk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    _mV = [[myView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self setView:_mV];
    [_mV.mySlider addTarget: self action:@selector (actionSlider:) forControlEvents:UIControlEventValueChanged];
    
    [_mV release];
}

- (void) viewDidAppear:(BOOL)animated {
    [_mV.myScrollView setZoomScale:0.2 animated:YES];
}

- (void) viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [_mV drawRect:CGRectMake(0, 0, size.width, size.height)];
}

- (UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)actionSlider:(UISlider *)sender {
    [_mV sliderHasChanged:sender];
}

@end

