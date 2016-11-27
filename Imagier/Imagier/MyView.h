//
//  MyView.h
//  Imagier
//
//  Created by znbk on 26/10/2016.
//  Copyright © 2016 znbk. All rights reserved.
//

#ifndef MyView_h
#define MyView_h

#import <UIkit/UIKit.h>

@interface myView : UIView <UIScrollViewDelegate>

@property(nonatomic) int cptImage;

@property (nonatomic, retain) UIInterpolatingMotionEffect *horizontalMotionEffect;
@property (nonatomic, retain) UIInterpolatingMotionEffect *verticalMotionEffect;
@property (nonatomic, retain) UIMotionEffectGroup *group;
@property (nonatomic, retain) UIBarButtonItem *previous;
@property (nonatomic, retain) UIBarButtonItem *next;
@property (nonatomic, retain) UIBarButtonItem *emptyy;
@property (nonatomic, retain) UIImageView *myImageView;
@property (nonatomic, retain) UISlider *mySlider;
@property (nonatomic, retain) NSArray<NSString *> *titles;
@property (nonatomic, retain) UIToolbar *toolbar;
@property (nonatomic, retain) UIBarButtonItem *title;
@property (nonatomic, retain) UILabel *scaleLabel;
@property (nonatomic, retain) UIScrollView *myScrollView;

- (void) myGoNext;
- (void) myGoBack;
- (void) sliderHasChanged:(UISlider *) sender;
- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView;
- (void) scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale;

@end


#endif /* MyView_h */
