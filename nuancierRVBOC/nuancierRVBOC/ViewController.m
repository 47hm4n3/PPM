//
//  ViewController.m
//  nuancierRVBOC
//
//  Created by 47hm4n3 on 23/10/16.
//  Copyright © 2016 47hm4n3. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

int max = 100;

int redPen, bluePen, greenPen;
int redPrec, bluePrec, greenPrec;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view = _mV = [[myView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [_mV setBackgroundColor:UIColor.whiteColor];
    
    
    [_mV.penulView addGestureRecognizer: [_mV.penulTap initWithTarget:self action:@selector(actionPenul:)]];
    
    [_mV.precView addGestureRecognizer: [_mV.precTap initWithTarget:self action:@selector(actionPrec:)]];
    
    [_mV.redSlider addTarget: self action:@selector (actionRedSlider:) forControlEvents:UIControlEventValueChanged];
    [_mV.greenSlider addTarget: self action:@selector (actionGreenSlider:) forControlEvents:UIControlEventValueChanged];
    [_mV.blueSlider addTarget: self action:@selector (actionBlueSlider:) forControlEvents:UIControlEventValueChanged];

    [_mV.monMemo addTarget: self action:@selector (actionMemo:) forControlEvents:UIControlEventTouchDown];
    [_mV.monRaZ addTarget: self action:@selector (actionRaZ:) forControlEvents:UIControlEventTouchDown];

    [_mV.monSwitch addTarget: self action:@selector (actionSwitch:) forControlEvents:UIControlEventTouchDown];

    
    
    
    _mV.penulView.backgroundColor = UIColor.grayColor;
    _mV.precView.backgroundColor = UIColor.grayColor;
    _mV.actuView.backgroundColor = UIColor.grayColor;
    [_mV.redSlider setMaximumValue:max];
    [_mV.greenSlider setMaximumValue:max];
    [_mV.blueSlider setMaximumValue:max];
    [_mV.redSlider setValue:(max+1)/2];
    [_mV.greenSlider setValue:(max+1)/2];
    [_mV.blueSlider setValue:(max+1)/2];
    [_mV.monR setText:[NSString stringWithFormat:@"R : %d%%", (int)((_mV.redSlider.value/max)*100)]];
    [_mV.monG setText:[NSString stringWithFormat:@"V : %d%%", (int)((_mV.greenSlider.value/max)*100)]];
    [_mV.monB setText:[NSString stringWithFormat:@"B : %d%%", (int)((_mV.blueSlider.value/max)*100)]];
    
    [_mV release];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionSwitch:(UISwitch *)sender {
    if(_mV.monSwitch.isOn){
        [_mV.redSlider setValue: roundf(_mV.redSlider.value/max*10)*max/10];
        [_mV.greenSlider setValue: roundf(_mV.greenSlider.value/max*10)*max/10];
        [_mV.blueSlider setValue: roundf(_mV.blueSlider.value/max*10)*max/10];
        [_mV.monR setText:[NSString stringWithFormat:@"R : %d%%", (int)((_mV.redSlider.value/max)*100)]];
        [_mV.monG setText:[NSString stringWithFormat:@"V : %d%%", (int)((_mV.greenSlider.value/max)*100)]];
        [_mV.monB setText:[NSString stringWithFormat:@"B : %d%%", (int)((_mV.blueSlider.value/max)*100)]];
    }
}

- (IBAction)actionPenul:(UITapGestureRecognizer *)sender {
    [_mV.actuView setBackgroundColor: _mV.penulView.backgroundColor];
    _mV.redSlider.value=redPen;
    _mV.greenSlider.value=greenPen;
    _mV.blueSlider.value=bluePen;
    [_mV.monR setText:[NSString stringWithFormat:@"R : %d%%", (int)((_mV.redSlider.value/max)*100)]];
    [_mV.monG setText:[NSString stringWithFormat:@"V : %d%%", (int)((_mV.greenSlider.value/max)*100)]];
    [_mV.monB setText:[NSString stringWithFormat:@"B : %d%%", (int)((_mV.blueSlider.value/max)*100)]];
}

- (IBAction)actionPrec:(UITapGestureRecognizer *)sender {
    [_mV.actuView setBackgroundColor: _mV.precView.backgroundColor];
    _mV.redSlider.value=redPrec;
    _mV.greenSlider.value=greenPrec;
    _mV.blueSlider.value=bluePrec;
    [_mV.monR setText:[NSString stringWithFormat:@"R : %d%%", (int)((_mV.redSlider.value/max)*100)]];
    [_mV.monG setText:[NSString stringWithFormat:@"V : %d%%", (int)((_mV.greenSlider.value/max)*100)]];
    [_mV.monB setText:[NSString stringWithFormat:@"B : %d%%", (int)((_mV.blueSlider.value/max)*100)]];
}

- (IBAction)actionRedSlider:(UISlider *)sender {
    if(_mV.monSwitch.isOn){
        [_mV.redSlider setValue: roundf(_mV.redSlider.value/max*10)*max/10];
    }
    [_mV.monR setText:[NSString stringWithFormat:@"R : %d%%", (int)((_mV.redSlider.value/max)*100)]];
    [_mV.actuView setBackgroundColor: [UIColor colorWithRed: (_mV.redSlider.value/(float)max) green: (_mV.greenSlider.value/(float)max) blue: (_mV.blueSlider.value/(float)max) alpha:1.0]];
}
- (IBAction)actionGreenSlider:(UISlider *)sender {
    if(_mV.monSwitch.isOn){
        [_mV.greenSlider setValue: roundf(_mV.greenSlider.value/max*10)*max/10];
    }
    [_mV.monG setText:[NSString stringWithFormat:@"V : %d%%", (int)((_mV.greenSlider.value/max)*100)]];
    [_mV.actuView setBackgroundColor: [UIColor colorWithRed: (_mV.redSlider.value/(float)max) green: (_mV.greenSlider.value/(float)max) blue: (_mV.blueSlider.value/(float)max) alpha:1.0]];
}
- (IBAction)actionBlueSlider:(UISlider *)sender {
    if(_mV.monSwitch.isOn){
        [_mV.blueSlider setValue: roundf(_mV.blueSlider.value/max*10)*max/10];
    }
    [_mV.monB setText:[NSString stringWithFormat:@"B : %d%%", (int)((_mV.blueSlider.value/max)*100)]];
    [_mV.actuView setBackgroundColor: [UIColor colorWithRed: (_mV.redSlider.value/(float)max) green: (_mV.greenSlider.value/(float)max) blue: (_mV.blueSlider.value/(float)max) alpha:1.0]];
}

- (IBAction)actionMemo:(UIButton *)sender {
    
    [_mV.penulView setBackgroundColor: _mV.precView.backgroundColor];
    [_mV.precView setBackgroundColor: _mV.actuView.backgroundColor];
    
    redPen = redPrec;
    greenPen = greenPrec;
    bluePen = bluePrec;
    
    redPrec = _mV.redSlider.value;
    greenPrec = _mV.greenSlider.value;
    bluePrec = _mV.blueSlider.value;
    
}

- (IBAction)actionRaZ:(UIButton *)sender {
    [_mV.redSlider setValue:(max+1)/2];
    [_mV.monR setText:[NSString stringWithFormat:@"R : %d%%", (int)((_mV.redSlider.value/max)*100)]];
    [_mV.greenSlider setValue:(max+1)/2];
    [_mV.monG setText:[NSString stringWithFormat:@"V : %d%%", (int)((_mV.greenSlider.value/max)*100)]];
    [_mV.blueSlider setValue:(max+1)/2];
    [_mV.monB setText:[NSString stringWithFormat:@"B : %d%%", (int)((_mV.blueSlider.value/max)*100)]];
    [_mV.penulView setBackgroundColor:UIColor.grayColor];
    [_mV.precView setBackgroundColor:UIColor.grayColor];
    [_mV.actuView setBackgroundColor:UIColor.grayColor];
}
@end
