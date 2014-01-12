//
//  ViewController.m
//  ExerciseTracker
//
//  Created by Ahmad Bushnaq on 1/10/14.
//  Copyright (c) 2014 Ahmad Bushnaq. All rights reserved.
//

#import "HomeViewController.h"
#import "Exercise.h"
#import "ExerciseTableViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController


- (IBAction)saveExercise:(id)sender
{
    // create our new exercise object and populate it from the UI.
    Exercise *newExercise = [appDelegate newExercise];
    newExercise.duration = [self.duration.text intValue];
    newExercise.type = self.exerciseType.selectedSegmentIndex;
    newExercise.timestamp = [self.startTime.date timeIntervalSince1970];
    
    // save it
    [appDelegate save];
    
    // reload to make sure that the per-type arrays for the exercises are up to date.
    [appDelegate reload];
    
    // dismiss the keyboard
    [self.duration resignFirstResponder];
    
    // update our exercise table.
    [exerciseList.tableView reloadData];

}



- (void)viewDidLoad
{
    [super viewDidLoad];
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    // instantiate the exercise list and keep a reference to it for later(so we can refresh the table
    // when new data is added)
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:kStoryboardName
                                                             bundle: nil];
    exerciseList = [mainStoryboard instantiateViewControllerWithIdentifier:kExerciseListControllerID];

    // make sure the table doesn't overflow its container, then add it to the container
    CGRect frame = exerciseList.tableView.frame;
    frame.size.height = self.containerView.frame.size.height;
    exerciseList.tableView.frame = frame;

    [self.containerView addSubview:exerciseList.tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
