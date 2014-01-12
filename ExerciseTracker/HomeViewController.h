//
//  ViewController.h
//  ExerciseTracker
//
//  Created by Ahmad Bushnaq on 1/10/14.
//  Copyright (c) 2014 Ahmad Bushnaq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ExerciseTableViewController.h"

@interface HomeViewController : UIViewController<UITextFieldDelegate>
{
    AppDelegate *appDelegate;
    ExerciseTableViewController *exerciseList;
}
@property (weak, nonatomic) IBOutlet UIDatePicker *startTime;
@property (weak, nonatomic) IBOutlet UISegmentedControl *exerciseType;
@property (weak, nonatomic) IBOutlet UITextField *duration;

@property (weak, nonatomic) IBOutlet UIView *containerView;


@end
