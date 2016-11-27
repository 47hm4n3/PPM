//
//  ViewController.h
//  Dizainier
//
//  Created by m2sar on 28/09/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)actionSwitch:(UISwitch *)sender;

@property (nonatomic, assign) IBOutlet UISwitch *monSwitch;


@property (nonatomic, assign) IBOutlet UIStepper *monStepper;
- (IBAction)actionStepper:(UIStepper *)sender;


@property (nonatomic, assign) IBOutlet UISegmentedControl *dizainesSegmented;
@property (nonatomic, assign) IBOutlet UISegmentedControl *unitesSegmented;
- (IBAction)actionComm:(UISegmentedControl *)sender;

@property (nonatomic, assign) IBOutlet UISlider *monSlider;
- (IBAction)actionSlider:(UISlider *)sender;


- (IBAction)monRaZ:(UIButton *)sender;


@property (nonatomic, assign) IBOutlet UILabel *monLabel;


@end

