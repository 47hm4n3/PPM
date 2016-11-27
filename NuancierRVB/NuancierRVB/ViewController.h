//
//  ViewController.h
//  NuancierRVB
//
//  Created by m2sar on 28/09/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, assign) IBOutlet UISwitch *monSwitch;

- (IBAction)actionSwitch:(UISwitch *)sender;

@property (nonatomic, assign) IBOutlet UILabel *monR;
@property (nonatomic, assign) IBOutlet UISlider *redSlider;
- (IBAction)actionRedSlider:(UISlider *)sender;

@property (nonatomic, assign) IBOutlet UILabel *monG;
@property (nonatomic, assign) IBOutlet UISlider *greenSlider;
- (IBAction)actionGreenSlider:(UISlider *)sender;

@property (nonatomic, assign) IBOutlet UILabel *monB;
@property (nonatomic, assign) IBOutlet UISlider *blueSlider;
- (IBAction)actionBlueSlider:(UISlider *)sender;

@property (nonatomic, assign) IBOutlet UIView *penulView;
- (IBAction)actionPenul:(UITapGestureRecognizer *)sender;


@property (nonatomic, assign) IBOutlet UIView *precView;
- (IBAction)actionPrec:(UITapGestureRecognizer *)sender;


@property (nonatomic, assign) IBOutlet UIView *actuView;

- (IBAction)actionMemo:(UIButton *)sender;

- (IBAction)monRaZ:(UIButton *)sender;

@end

