//
//  ViewController.m
//  NuancierRVB
//
//  Created by m2sar on 28/09/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

int max = 99;

int redPen, bluePen, greenPen;
int redPrec, bluePrec, greenPrec;

- (void)viewDidLoad {
    [super viewDidLoad];
    _penulView.backgroundColor = UIColor.grayColor;
    _precView.backgroundColor = UIColor.grayColor;
    _actuView.backgroundColor = UIColor.grayColor;
    [_redSlider setMaximumValue:max];
    [_greenSlider setMaximumValue:max];
    [_blueSlider setMaximumValue:max];
    [_redSlider setValue:(max+1)/2];
    [_greenSlider setValue:(max+1)/2];
    [_blueSlider setValue:(max+1)/2];
    [_monR setText:[NSString stringWithFormat:@"R : %d%%", (int)((_redSlider.value/max)*100)]];
    [_monG setText:[NSString stringWithFormat:@"V : %d%%", (int)((_greenSlider.value/max)*100)]];
    [_monB setText:[NSString stringWithFormat:@"B : %d%%", (int)((_blueSlider.value/max)*100)]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionSwitch:(UISwitch *)sender {
    if(_monSwitch.isOn){
        [_redSlider setValue: roundf(_redSlider.value/max*10)*max/10];
        [_greenSlider setValue: roundf(_greenSlider.value/max*10)*max/10];
        [_blueSlider setValue: roundf(_blueSlider.value/max*10)*max/10];
        [_monR setText:[NSString stringWithFormat:@"R : %d%%", (int)((_redSlider.value/max)*100)]];
        [_monG setText:[NSString stringWithFormat:@"V : %d%%", (int)((_greenSlider.value/max)*100)]];
        [_monB setText:[NSString stringWithFormat:@"B : %d%%", (int)((_blueSlider.value/max)*100)]];
    }
}

- (IBAction)actionPenul:(UITapGestureRecognizer *)sender {
    [_actuView setBackgroundColor: _penulView.backgroundColor];
    _redSlider.value=redPen;
    _greenSlider.value=greenPen;
    _blueSlider.value=bluePen;
    [_monR setText:[NSString stringWithFormat:@"R : %d%%", (int)((_redSlider.value/max)*100)]];
    [_monG setText:[NSString stringWithFormat:@"V : %d%%", (int)((_greenSlider.value/max)*100)]];
    [_monB setText:[NSString stringWithFormat:@"B : %d%%", (int)((_blueSlider.value/max)*100)]];
  // [_redSlider setValue:redPen]; //ne fonctionne pas
  // [_greenSlider setValue:greenPen];
  // [_blueSlider setValue:bluePen];
}

- (IBAction)actionPrec:(UITapGestureRecognizer *)sender {
    [_actuView setBackgroundColor: _precView.backgroundColor];
    _redSlider.value=redPrec;
    _greenSlider.value=greenPrec;
    _blueSlider.value=bluePrec;
    [_monR setText:[NSString stringWithFormat:@"R : %d%%", (int)((_redSlider.value/max)*100)]];
    [_monG setText:[NSString stringWithFormat:@"V : %d%%", (int)((_greenSlider.value/max)*100)]];
    [_monB setText:[NSString stringWithFormat:@"B : %d%%", (int)((_blueSlider.value/max)*100)]];
   // [_redSlider setValue:redPrec];
   // [_greenSlider setValue:greenPrec];
   // [_blueSlider setValue:bluePrec];
}

- (IBAction)actionRedSlider:(UISlider *)sender {
    if(_monSwitch.isOn){
        [_redSlider setValue: roundf(_redSlider.value/max*10)*max/10];
    }
        [_monR setText:[NSString stringWithFormat:@"R : %d%%", (int)((_redSlider.value/max)*100)]];
        [_actuView setBackgroundColor: [UIColor colorWithRed: (_redSlider.value/(float)max) green: (_greenSlider.value/(float)max) blue: (_blueSlider.value/(float)max) alpha:1.0]];
}
- (IBAction)actionGreenSlider:(UISlider *)sender {
    if(_monSwitch.isOn){
        [_greenSlider setValue: roundf(_greenSlider.value/max*10)*max/10];
    }
        [_monG setText:[NSString stringWithFormat:@"V : %d%%", (int)((_greenSlider.value/max)*100)]];
        [_actuView setBackgroundColor: [UIColor colorWithRed: (_redSlider.value/(float)max) green: (_greenSlider.value/(float)max) blue: (_blueSlider.value/(float)max) alpha:1.0]];
}
- (IBAction)actionBlueSlider:(UISlider *)sender {
    if(_monSwitch.isOn){
        [_blueSlider setValue: roundf(_blueSlider.value/max*10)*max/10];
    }
        [_monB setText:[NSString stringWithFormat:@"B : %d%%", (int)((_blueSlider.value/max)*100)]];
        [_actuView setBackgroundColor: [UIColor colorWithRed: (_redSlider.value/(float)max) green: (_greenSlider.value/(float)max) blue: (_blueSlider.value/(float)max) alpha:1.0]];
}

- (IBAction)actionMemo:(UIButton *)sender {
    
        [_penulView setBackgroundColor: _precView.backgroundColor];
        [_precView setBackgroundColor: _actuView.backgroundColor];
        
        redPen = redPrec;
        greenPen = greenPrec;
        bluePen = bluePrec;
        
        redPrec = _redSlider.value;
        greenPrec = _greenSlider.value;
        bluePrec = _blueSlider.value;
    
}

- (IBAction)monRaZ:(UIButton *)sender {
    [_redSlider setValue:(max+1)/2];
    [_monR setText:[NSString stringWithFormat:@"R : %d%%", (int)((_redSlider.value/max)*100)]];
    [_greenSlider setValue:(max+1)/2];
    [_monG setText:[NSString stringWithFormat:@"V : %d%%", (int)((_greenSlider.value/max)*100)]];
    [_blueSlider setValue:(max+1)/2];
    [_monB setText:[NSString stringWithFormat:@"B : %d%%", (int)((_blueSlider.value/max)*100)]];
    [_penulView setBackgroundColor:UIColor.grayColor];
    [_precView setBackgroundColor:UIColor.grayColor];
    [_actuView setBackgroundColor:UIColor.grayColor];
}


@end


