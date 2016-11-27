//
//  ViewController.m
//  Couleur
//
//  Created by m2sar on 21/09/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSArray* listeCouleurs;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    listeCouleurs = [NSArray arrayWithObjects:[UIColor whiteColor], [UIColor redColor], [UIColor orangeColor], [UIColor yellowColor], [UIColor greenColor], [UIColor blueColor], nil];
    
    
    [_myStepp setMinimumValue:0.0];
    [_myStepp setMaximumValue:5.0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)myStepper:(UIStepper *)sender {
    [_box setBackgroundColor:listeCouleurs[(int)_myStepp.value]];
  
    
}
@end
