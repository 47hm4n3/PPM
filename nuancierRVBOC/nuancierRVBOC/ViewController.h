//
//  ViewController.h
//  nuancierRVBOC
//
//  Created by 47hm4n3 on 23/10/16.
//  Copyright © 2016 47hm4n3. All rights reserved.
//

#import "myView.h"



@interface ViewController : UIViewController

@property (nonatomic, retain) myView *mV;

- (void) actionPenul:(UITapGestureRecognizer *)sender;
- (void) actionPrec:(UITapGestureRecognizer *)sender;

- (void) actionRedSlider:(UISlider *)sender;
- (void) actionGreenSlider:(UISlider *)sender;
- (void) actionBlueSlider:(UISlider *)sender;

- (void) actionMemo:(UIButton *)sender;

- (void) actionRaZ:(UIButton *)sender;

- (void) actionSwitch:(UISwitch *)sender;


@end

