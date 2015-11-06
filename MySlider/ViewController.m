//
//  ViewController.m
//  MySlider
//
//  Created by student on 11/4/15.
//  Copyright © 2015 Techmaster. All rights reserved.
//

const int duration = 900;

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *timeLeftLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentTImeLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *currentTimeLeadingSpace;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    
    
    [self.slider setThumbImage:[UIImage imageNamed:@"slider-cap"] forState:UIControlStateNormal];
    [self.slider setMinimumTrackImage:[UIImage imageNamed:@"slider-track-fill"] forState:
     UIControlStateNormal];
    [self.slider setMaximumTrackImage:[UIImage imageNamed:@"slider-track"] forState:UIControlStateNormal];
    
    self.currentTImeLabel.text = [NSString stringWithFormat:@""];
    self.timeLeftLabel.text = [NSString stringWithFormat:@"-%@", [self convertTime:duration]];
}
- (IBAction)sliderValueChange:(UISlider *)sender {
    self.timeLeftLabel.text = [NSString stringWithFormat:@"-%@", [self convertTime:duration-duration*self.slider.value]];
    self.currentTImeLabel.text = [NSString stringWithFormat:@"%@", [self convertTime: duration*self.slider.value]];
    self.currentTimeLeadingSpace.constant = 50+self.slider.value*self.slider.frame.size.width;
}
- (NSString *)convertTime:(CGFloat)second{
    return [NSString stringWithFormat:@"%02.0f:%02d", second/60, (int)second%60];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
