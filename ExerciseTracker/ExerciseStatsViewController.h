//
//  ExerciseStatsViewController.h
//  ExerciseTracker
//
//  Created by Ahmad Bushnaq on 1/12/14.
//  Copyright (c) 2014 Ahmad Bushnaq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ExerciseStatsViewController : UIViewController
{
    AppDelegate *appDelegate;
}
@property (weak, nonatomic) IBOutlet UILabel *longestRunValue;
@property (weak, nonatomic) IBOutlet UILabel *longestWeightsValue;
@property (weak, nonatomic) IBOutlet UILabel *longestSwimValue;

@end
