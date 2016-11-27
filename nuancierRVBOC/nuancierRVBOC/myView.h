//
//  myView.h
//  nuancierRVBOC
//
//  Created by 47hm4n3 on 23/10/16.
//  Copyright © 2016 47hm4n3. All rights reserved.
//

#ifndef myView_h
#define myView_h

#import <UIkit/UIKit.h>

@interface myView : UIView

@property (nonatomic, retain) UITapGestureRecognizer *penulTap;
@property (nonatomic, retain) UITapGestureRecognizer *precTap;

@property (nonatomic, retain) UILabel *penultieme;
@property (nonatomic, retain) UIView *penulView;

@property (nonatomic, retain) UILabel *precedent;
@property (nonatomic, retain) UIView *precView;

@property (nonatomic, retain) UILabel *actuel;
@property (nonatomic, retain) UIView *actuView;


@property (nonatomic, retain) UILabel *monR;
@property (nonatomic, retain) UISlider *redSlider;

@property (nonatomic, retain) UILabel *monG;
@property (nonatomic, retain) UISlider *greenSlider;

@property (nonatomic, retain) UILabel *monB;
@property (nonatomic, retain) UISlider *blueSlider;

@property (nonatomic, retain) UIButton *monMemo;
@property (nonatomic, retain) UIButton *monRaZ;

@property (nonatomic, retain) UILabel *modeweb;
@property (nonatomic, retain) UISwitch *monSwitch;

@end
#endif /* myView_h */
