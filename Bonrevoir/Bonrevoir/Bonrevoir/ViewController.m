//
//  ViewController.m
//  Bonrevoir
//
//  Created by m2sar on 21/09/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _monLabel.text = @"";
    [_monBouton setTitle:@"Dis Bonjour" forState:UIControlStateNormal];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)actionBouton:(UIButton *)sender {
    if ([_monBouton.titleLabel.text isEqualToString:@"Dis Bonjour"]){
        [_monLabel setText:@"Bonjour"];
        [_monBouton setTitle:@"Dis Aurevoir" forState:UIControlStateNormal];
    }else{
        [_monLabel setText:@"Aurevoir"];
        [_monBouton setTitle:@"Dis Bonjour" forState:UIControlStateNormal];
    }
    
}
@end
