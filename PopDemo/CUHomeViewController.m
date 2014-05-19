//
//  CUHomeViewController.m
//  PopDemo
//
//  Created by yuguang on 7/5/14.
//  Copyright (c) 2014 lion. All rights reserved.
//

#import "CUHomeViewController.h"
#import <POP.h>
#import "FBTweak.h"
#import "FBTweakShakeWindow.h"
#import "FBTweakInline.h"
#import "FBTweakViewController.h"

@interface CUHomeViewController ()

@property(weak, nonatomic) IBOutlet UILabel *numberLabel;
@end

@implementation CUHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.

  FBTweak *animationDurationTweak =
      FBTweakInline(@"Content", @"Animation", @"Duration", 2.0, 1.0, 3.0);
  animationDurationTweak.stepValue = [NSNumber numberWithFloat:0.1f];
  animationDurationTweak.precisionValue = [NSNumber numberWithFloat:3.0f];

  FBTweak *animationToValueTweak =
      FBTweakInline(@"Content", @"Animation", @"ToValue", 8000, 1000, 10000);
  animationToValueTweak.stepValue = @(1000);
  animationDurationTweak.precisionValue = [NSNumber numberWithFloat:1.0f];
}

- (void)viewDidLayoutSubviews
{
  [super viewDidLayoutSubviews];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - action

- (IBAction)animationButtonClicked:(id)sender {
  POPBasicAnimation *animation = [POPBasicAnimation animation];
  animation.property = [self animationProperty];
  animation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.12 :1: 0.11:0.94];
  animation.fromValue = @(0);

  double animationDuration =
      FBTweakValue(@"Content", @"Animation", @"Duration", 2.0);
  animation.toValue =
      @(FBTweakValue(@"Content", @"Animation", @"ToValue", 8000));
  animation.duration = animationDuration;

  [self.numberLabel pop_addAnimation:animation forKey:@"numberLabelAnimation"];
}

#pragma mark - animation

- (POPMutableAnimatableProperty *)animationProperty {
  return [POPMutableAnimatableProperty
      propertyWithName:@"com.curer.test"
           initializer:^(POPMutableAnimatableProperty *prop) {
               prop.writeBlock = ^(id obj, const CGFloat values[]) {
                 UILabel *label = (UILabel *)obj;
                 NSNumber *number = @(values[0]);
                 int num = [number intValue];
                 label.text = [@(num) stringValue];
               };
           }];
}

@end
