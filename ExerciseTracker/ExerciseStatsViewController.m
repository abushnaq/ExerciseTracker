//
//  ExerciseStatsViewController.m
//  ExerciseTracker
//
//  Created by Ahmad Bushnaq on 1/12/14.
//  Copyright (c) 2014 Ahmad Bushnaq. All rights reserved.
//

#import "ExerciseStatsViewController.h"

@interface ExerciseStatsViewController ()

@end

@implementation ExerciseStatsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    Exercise *longestRun = [appDelegate longestExerciseOfType:kExerciseTypeRunID];
    Exercise *longestWeights = [appDelegate longestExerciseOfType:kExerciseTypeWeightsID];
    Exercise *longestSwim = [appDelegate longestExerciseOfType:kExerciseTypeSwimsID];
    
    self.longestRunValue.text = [NSString stringWithFormat:@"%d minutes", longestRun.duration];
    self.longestWeightsValue.text = [NSString stringWithFormat:@"%d minutes", longestWeights.duration];
    self.longestSwimValue.text = [NSString stringWithFormat:@"%d minutes", longestSwim.duration];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
