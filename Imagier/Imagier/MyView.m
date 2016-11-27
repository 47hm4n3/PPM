//
//  MyView.m
//  Imagier
//
//  Created by znbk on 26/10/2016.
//  Copyright © 2016 znbk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "myView.h"

@implementation myView : UIView

//int cptImage = 0;

//NSArray<NSString *> *titles = [@"Machu Pichu", @"Oxford", @"Dresde", @"Chichen Izta", @"Kiôtô", @"Gizeh", @"près d'Edimbourg", @"Cordoue", @"Seville", @"Grenade", @"Venise", @"Venise", @"Venise", @"Paris", @"Paris", @"Tiddis", @"Washington State", @"NGC 6302", @"New York", @"La Terre", nil];

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _cptImage = 0;
        
        /* FX */
        _horizontalMotionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        _horizontalMotionEffect.minimumRelativeValue = @(-50);
        _horizontalMotionEffect.maximumRelativeValue = @(50);
        
        _verticalMotionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        _verticalMotionEffect.minimumRelativeValue = @(-50);
        _verticalMotionEffect.maximumRelativeValue = @(50);
        
        _group = [UIMotionEffectGroup new];
        _group.motionEffects = @[_horizontalMotionEffect, _verticalMotionEffect];
       
        
        /* TOOLBAR STUFF */
        _titles = [[NSArray<NSString *> alloc] initWithObjects:@"Machu Pichu", @"Oxford", @"Dresde", @"Chichen Izta", @"Kiôtô", @"Gizeh", @"près d'Edimbourg", @"Cordoue", @"Seville", @"Grenade", @"Venise", @"Venise", @"Venise", @"Paris", @"Paris", @"Tiddis", @"Washington State", @"NGC 6302", @"New York", @"La Terre", nil];
        
        _previous = [[UIBarButtonItem alloc] initWithTitle:@"<<" style:UIBarButtonItemStylePlain target:self action:@selector(myGoBack)];
        [_previous setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize: 18.0]} forState:UIControlStateNormal];
        
        _next = [[UIBarButtonItem alloc] initWithTitle:@">>" style:UIBarButtonItemStylePlain target:self action:@selector(myGoNext)];
        [_next setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize: 18.0]} forState:UIControlStateNormal];
        
        _title = [[UIBarButtonItem alloc] initWithTitle:[_titles objectAtIndex:_cptImage] style:UIBarButtonItemStylePlain target:nil action:nil];
        _title.tintColor = [UIColor blackColor];
        
        [_title setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize: 18.0] } forState:UIControlStateNormal];
        
        _emptyy = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        NSArray *toolbarItems = [NSArray arrayWithObjects: _previous, _emptyy, _title, _emptyy, _next, nil];
        
        _toolbar = [[UIToolbar alloc] init];
        [_toolbar setBarStyle:UIBarStyleDefault];
        [_toolbar setBackgroundColor:[UIColor whiteColor]];
        [_toolbar setItems:toolbarItems];
        
        /* IMAGE STUFF */
        
        UIImage *myImage = [UIImage imageNamed:[self getImageName:_cptImage+1]];
        
        _myImageView = [[UIImageView alloc] initWithImage:myImage];
        [_myImageView addMotionEffect:_group];
        
        _myScrollView = [[UIScrollView alloc] initWithFrame:frame];
        [_myScrollView setBackgroundColor:[UIColor whiteColor]];
        [_myScrollView setMaximumZoomScale:1.0];
        [_myScrollView setMinimumZoomScale:0.05];
        [_myScrollView setDelegate:self];
        [_myScrollView addSubview:_myImageView];
        
        /* SCALE LABEL*/
        _scaleLabel = [[UILabel alloc] init];
        [_scaleLabel setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0.5f]];
        [_scaleLabel setTextAlignment:NSTextAlignmentCenter];
        
        /* SLIDER */
        _mySlider = [[UISlider alloc] init];
        [_mySlider setMaximumValue:100];
        [_mySlider setMinimumValue:0];
        
        /*PICASSO*/
        [self drawRect:frame];
        
        
        [self addSubview:_toolbar];
        [self addSubview:_myScrollView];
        [self addSubview:_scaleLabel];
        [self addSubview:_mySlider];
        
        
        _myImageView.frame = CGRectMake(0, 0, _myImageView.image.size.width, _myImageView.image.size.height);
        _myScrollView.contentSize = _myImageView.image.size;
        
        
        /* GARBAGE */
        [_horizontalMotionEffect release];
        [_verticalMotionEffect release];
        [_group release];
        [_previous release];
        [_next release];
        [_title release];
        [_emptyy release];
        [_toolbar release];
        [_myImageView release];
        [_myScrollView release];
        [_scaleLabel release];
        [_mySlider release];
        //[_titles release];
        
    }
    return self;
}

- (void) drawRect:(CGRect)rect {
    
    self.backgroundColor = [UIColor whiteColor];
    
    _toolbar.frame = CGRectMake(0, 20, rect.size.width, 40);
        
    _scaleLabel.frame = CGRectMake(5, _toolbar.frame.size.height+20, 50, 17);
    
    _myScrollView.frame = CGRectMake(0, _toolbar.frame.size.height+20, _toolbar.frame.size.width, rect.size.height-_toolbar.frame.size.height-20);
    
    _mySlider.frame = CGRectMake(rect.size.width *10/100, rect.size.height *90/100, rect.size.width *80/100, rect.size.height *10/100);
    
}

- (void) sliderHasChanged:(UISlider *) sender {
    [_myScrollView setZoomScale:(_mySlider.value)/100 animated:YES];
}

- (void) myGoNext {
    _cptImage = _cptImage+1;
    if ( _cptImage > 19 ) {
        _cptImage = 0;
    }
    [self update];
}

- (void) myGoBack {
    _cptImage = _cptImage-1;
    if ( _cptImage < 0 ) {
        _cptImage = 19;
    }
    [self update];
}

- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _myImageView;
}

- (void) scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    [_myScrollView setZoomScale:scale animated:YES];
    _mySlider.value = scale*100;
    _scaleLabel.text = [NSString stringWithFormat:@"%d%%", (int)(_mySlider.value)];
}

- (NSString *) getImageName:(int) cpt {
    NSString *result = @"photo-";
    result = [result stringByAppendingFormat:@"%d.jpg", (int)cpt];
    return result;
}

- (void) update {
    [_myScrollView setZoomScale:1 animated:YES];
    _myImageView.image = [UIImage imageNamed:[self getImageName:_cptImage+1]];
    _title.title = [_titles objectAtIndex:_cptImage];
    _myImageView.frame = CGRectMake(0 , 0, _myImageView.image.size.width, _myImageView.image.size.height);
    
    [_myScrollView setZoomScale:0.2 animated:YES];
    
    _mySlider.value = _myScrollView.zoomScale*100;
    _scaleLabel.text = [NSString stringWithFormat:@"%d%%", (int)(_mySlider.value)];
}

@end
