//
//  ViewController.m
//  Dizainier
//
//  Created by m2sar on 28/09/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [_monStepper setMinimumValue:0.0];
    [_monStepper setMaximumValue:99.0];
    [_monSlider setMinimumValue:0.0];
    [_monSlider setMaximumValue:99.0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionSwitch:(UISwitch *)sender {
    if (_monSwitch.isOn){
        _monLabel.textColor = UIColor.redColor;
    }else{
        _monLabel.textColor = UIColor.blackColor;
    }
}

- (IBAction)actionStepper:(UIStepper *)sender {
    [_monSlider setValue:_monStepper.value];
    [_unitesSegmented setSelectedSegmentIndex:(int)_monStepper.value % 10];
    [_dizainesSegmented setSelectedSegmentIndex:(int)_monStepper.value / 10];
    if (_monSwitch.isOn){
        _monLabel.text=[[NSString alloc] initWithFormat:@"%x", (int)_monStepper.value];
    }else{
        _monLabel.text=[[NSString alloc] initWithFormat:@"%0.0f", _monStepper.value];
    }
    [_monLabel.text dealloc];
}

- (IBAction)actionComm:(UISegmentedControl *)sender {
    [_monStepper setValue: (10 * _dizainesSegmented.selectedSegmentIndex) + _unitesSegmented.selectedSegmentIndex];
    [_monSlider setValue:(10 * _dizainesSegmented.selectedSegmentIndex) + _unitesSegmented.selectedSegmentIndex];
    if (_monSwitch.isOn){
        _monLabel.text=[[NSString alloc] initWithFormat:@"%x", (int)_monStepper.value];
    }else{
        _monLabel.text=[[NSString alloc] initWithFormat:@"%0.0f", _monStepper.value];
    }
    [_monLabel.text dealloc];
}


- (IBAction)actionSlider:(UISlider *)sender {
    [_monStepper setValue:(int)_monSlider.value];
    [_dizainesSegmented setSelectedSegmentIndex:(int)(_monSlider.value / 10)];
    [_unitesSegmented setSelectedSegmentIndex:(int)_monSlider.value % 10];
    if (_monSwitch.isOn){
    _monLabel.text=[[NSString alloc] initWithFormat:@"%x", (int)_monStepper.value];
    }else{
        _monLabel.text=[[NSString alloc] initWithFormat:@"%0.0f", _monStepper.value];
    }
    [_monLabel.text dealloc];
}

- (IBAction)monRaZ:(UIButton *)sender {
    [_monStepper setValue:0];
    [_dizainesSegmented setSelectedSegmentIndex:0];
    [_unitesSegmented setSelectedSegmentIndex:0];
    [_monSlider setValue:0];
    [_monLabel setText:@""];
}

@end
