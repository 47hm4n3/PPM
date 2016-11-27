//
//  ViewController.h
//  Couleur
//
//  Created by m2sar on 21/09/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)myStepper:(UIStepper *)sender;
@property (weak, nonatomic) IBOutlet UIStepper *myStepp;

@property (weak, nonatomic) IBOutlet UIView *box;

@end

