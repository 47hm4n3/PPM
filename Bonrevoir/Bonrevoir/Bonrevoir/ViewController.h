//
//  ViewController.h
//  Bonrevoir
//
//  Created by m2sar on 21/09/2016.
//  Copyright © 2016 UPMC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *monLabel;
@property (weak, nonatomic) IBOutlet UIButton *monBouton;
- (IBAction)actionBouton:(UIButton *)sender;

@end

