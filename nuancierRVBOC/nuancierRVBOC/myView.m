//
//  myView.m
//  nuancierRVBOC
//
//  Created by 47hm4n3 on 23/10/16.
//  Copyright © 2016 47hm4n3. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "myView.h"

@implementation myView : UIView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _penulTap = [[UITapGestureRecognizer alloc] init];
        _precTap = [[UITapGestureRecognizer alloc] init];
        
        
        _penultieme = [[UILabel alloc]init];
        [_penultieme setText:@"Pénultième"];
        [_penultieme setTextColor: UIColor.blackColor];
        _penultieme.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_penultieme];
        _penulView = [[UIView alloc]init];
        [self addSubview:_penulView];
        
        _precedent = [[UILabel alloc]init];
        [_precedent setText:@"Précédente"];
        [_precedent setTextColor: UIColor.blackColor];
        _precedent.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_precedent];
        _precView = [[UIView alloc]init];
        [self addSubview:_precView];
        
        _actuel = [[UILabel alloc]init];
        [_actuel setText:@"Actuelle"];
        [_actuel setTextColor: UIColor.blackColor];
        _actuel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_actuel];
        _actuView = [[UIView alloc]init];
        [self addSubview:_actuView];
        
        _monR = [[UILabel alloc]init];
        [self addSubview:_monR];
        _redSlider = [[UISlider alloc]init];
        [self addSubview:_redSlider];
        
        _monG = [[UILabel alloc]init];
        [self addSubview:_monG];
        _greenSlider = [[UISlider alloc]init];
        [self addSubview:_greenSlider];
        
        _monB = [[UILabel alloc]init];
        [self addSubview:_monB];
        _blueSlider = [[UISlider alloc]init];
        [self addSubview:_blueSlider];
        
        
        _monMemo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_monMemo setTitle:@"Mémoriser" forState:UIControlStateNormal];
        [self addSubview:_monMemo];
        
        _monRaZ = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_monRaZ setTitle:@"RaZ" forState:UIControlStateNormal];
        [self addSubview:_monRaZ];
        
        _monSwitch = [[UISwitch alloc]init];
        [self addSubview:_monSwitch];
        _modeweb = [[UILabel alloc]init];
        [_modeweb setText:@"Web"];
        [_modeweb setTextColor: UIColor.blackColor];
        [self addSubview:_modeweb];
        
        /* Gestion de la mémoire sans ARC*/
        [_penultieme release];
        [_penulView release];
        [_precedent release];
        [_precView release];
        [_actuel release];
        [_actuView release];
        [_monR release];
        [_redSlider release];
        [_monG release];
        [_greenSlider release];
        [_monB release];
        [_blueSlider release];
        [_monMemo release];
        [_monRaZ release];
        [_modeweb release];
        
    }
    
    return self;}
- (void) drawRect:(CGRect)rect {
    if(UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation)) {
    
    _penultieme.frame =CGRectMake(  self.bounds.size.width *35/100,
                                    self.bounds.size.height *5/100,
                                    self.bounds.size.width *30/100,
                                    self.bounds.size.height *5/100);
    
    _penulView.frame = CGRectMake(  self.bounds.size.width*10/100,
                                    self.bounds.size.height *10/100,
                                    self.bounds.size.width *80/100,
                                    self.bounds.size.height *5/100);
    
    _precedent.frame = CGRectMake(  self.bounds.size.width *35/100,
                                    self.bounds.size.height *15/100,
                                    self.bounds.size.width *30/100,
                                    self.bounds.size.height *5/100);
    
    _precView.frame = CGRectMake(   self.bounds.size.width *10/100,
                                    self.bounds.size.height *20/100,
                                    self.bounds.size.width *80/100,
                                    self.bounds.size.height *5/100);
    
    _actuel.frame = CGRectMake(     self.bounds.size.width *35/100,
                                    self.bounds.size.height *25/100,
                                    self.bounds.size.width *30/100,
                                    self.bounds.size.height *5/100);
    
    _actuView.frame = CGRectMake(   self.bounds.size.width *10/100,
                                    self.bounds.size.height *30/100,
                                    self.bounds.size.width *80/100,
                                    self.bounds.size.height *5/100);
    
    _monR.frame = CGRectMake(       self.bounds.size.width *10/100,
                                    self.bounds.size.height *40/100,
                                    self.bounds.size.width *30/100,
                                    self.bounds.size.height *5/100);
    
    _redSlider.frame = CGRectMake(  self.bounds.size.width *10/100,
                                    self.bounds.size.height *45/100,
                                    self.bounds.size.width *80/100,
                                    self.bounds.size.height *5/100);
    
    _monG.frame = CGRectMake(       self.bounds.size.width *10/100,
                                    self.bounds.size.height *50/100,
                                    self.bounds.size.width *30/100,
                                    self.bounds.size.height *5/100);
    
    _greenSlider.frame = CGRectMake(self.bounds.size.width *10/100,
                                    self.bounds.size.height *55/100,
                                    self.bounds.size.width *80/100,
                                    self.bounds.size.height *5/100);
    
    _monB.frame = CGRectMake(       self.bounds.size.width *10/100,
                                    self.bounds.size.height *60/100,
                                    self.bounds.size.width *30/100,
                                    self.bounds.size.height *5/100);
    
    _blueSlider.frame = CGRectMake( self.bounds.size.width *10/100,
                                    self.bounds.size.height *65/100,
                                    self.bounds.size.width *80/100,
                                    self.bounds.size.height *5/100);
    
    _monMemo.frame=CGRectMake(      self.bounds.size.width *35/100,
                                    self.bounds.size.height *70/100,
                                    self.bounds.size.width *30/100,
                                    self.bounds.size.height *5/100);
    
    _monRaZ.frame=CGRectMake(       self.bounds.size.width *40/100,
                                    self.bounds.size.height *75/100,
                                    self.bounds.size.width *20/100,
                                    self.bounds.size.height *5/100);
    
    _monSwitch.frame=CGRectMake(    self.bounds.size.width *10/100,
                                    self.bounds.size.height *85/100,
                                    self.bounds.size.width *15/100,
                                    self.bounds.size.height *5/100);

    _modeweb.frame = CGRectMake(    self.bounds.size.width *30/100,
                                    self.bounds.size.height *85/100,
                                    self.bounds.size.width *20/100,
                                    self.bounds.size.height *5/100);
    } else {
    
        _penultieme.frame =CGRectMake(self.bounds.size.width *10/100,
                                      self.bounds.size.height *10/100,
                                      self.bounds.size.width *30/100,
                                      self.bounds.size.height *10/100);
        
        _penulView.frame = CGRectMake(  self.bounds.size.width *5/100,
                                      self.bounds.size.height *20/100,
                                      self.bounds.size.width *40/100,
                                      self.bounds.size.height *10/100);
        
        _precedent.frame = CGRectMake(  self.bounds.size.width *10/100,
                                      self.bounds.size.height *30/100,
                                      self.bounds.size.width *30/100,
                                      self.bounds.size.height *10/100);
        
        _precView.frame = CGRectMake(   self.bounds.size.width *5/100,
                                     self.bounds.size.height *40/100,
                                     self.bounds.size.width *40/100,
                                     self.bounds.size.height *10/100);
        
        _actuel.frame = CGRectMake(     self.bounds.size.width *10/100,
                                   self.bounds.size.height *50/100,
                                   self.bounds.size.width *30/100,
                                   self.bounds.size.height *10/100);
        
        _actuView.frame = CGRectMake(   self.bounds.size.width *5/100,
                                     self.bounds.size.height *60/100,
                                     self.bounds.size.width *40/100,
                                     self.bounds.size.height *10/100);
        
        _monMemo.frame=CGRectMake(      self.bounds.size.width *10/100,
                                  self.bounds.size.height *80/100,
                                  self.bounds.size.width *30/100,
                                  self.bounds.size.height *10/100);
        
        // 2ème colonne
        _monR.frame = CGRectMake(       self.bounds.size.width *55/100,
                                 self.bounds.size.height *10/100,
                                 self.bounds.size.width *15/100,
                                 self.bounds.size.height *10/100);
        
        _redSlider.frame = CGRectMake(  self.bounds.size.width *55/100,
                                      self.bounds.size.height *20/100,
                                      self.bounds.size.width *40/100,
                                      self.bounds.size.height *10/100);
        
        _monG.frame = CGRectMake(       self.bounds.size.width *55/100,
                                 self.bounds.size.height *30/100,
                                 self.bounds.size.width *15/100,
                                 self.bounds.size.height *10/100);
        
        _greenSlider.frame = CGRectMake(self.bounds.size.width *55/100,
                                        self.bounds.size.height *40/100,
                                        self.bounds.size.width *40/100,
                                        self.bounds.size.height *10/100);
        
        _monB.frame = CGRectMake(       self.bounds.size.width *55/100,
                                 self.bounds.size.height *50/100,
                                 self.bounds.size.width *15/100,
                                 self.bounds.size.height *10/100);
        
        _blueSlider.frame = CGRectMake( self.bounds.size.width *55/100,
                                       self.bounds.size.height *60/100,
                                       self.bounds.size.width *40/100,
                                       self.bounds.size.height *10/100);
       
        _monRaZ.frame=CGRectMake(       self.bounds.size.width *70/100,
                                 self.bounds.size.height *80/100,
                                 self.bounds.size.width *10/100,
                                 self.bounds.size.height *10/100);
        
        _monSwitch.frame=CGRectMake(    self.bounds.size.width *85/100,
                                    self.bounds.size.height *5/100,
                                    self.bounds.size.width *10/100,
                                    self.bounds.size.height *10/100);
        
        _modeweb.frame = CGRectMake(    self.bounds.size.width *79/100,
                                    self.bounds.size.height *4/100,
                                    self.bounds.size.width *10/100,
                                    self.bounds.size.height *10/100);
    }
    
}
@end
