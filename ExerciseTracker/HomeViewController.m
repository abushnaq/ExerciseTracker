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
    Exercise *newExercise = [appDelegate newExercise];
    newExercise.duration = [self.duration.text intValue];
    newExercise.type = self.exerciseType.selectedSegmentIndex;
    newExercise.timestamp = [self.startTime.date timeIntervalSince1970];
    
    
    
    [appDelegate save];
    [appDelegate reload];
    [self.duration resignFirstResponder];
    
    [exerciseList.tableView reloadData];

}



- (void)viewDidLoad
{
    [super viewDidLoad];
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle: nil];
    exerciseList = [mainStoryboard instantiateViewControllerWithIdentifier:@"exerciseList"];
    //exerciseList.tableView.frame = self.containerView.frame;
//    self.containerView.clipsToBounds = YES;
    CGRect frame = exerciseList.tableView.frame;
    frame.size.height = self.containerView.frame.size.height;
    self.containerView.translatesAutoresizingMaskIntoConstraints = NO;
    exerciseList.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    exerciseList.tableView.frame = frame;

    [self.containerView addSubview:exerciseList.tableView];
//    exerciseList
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
