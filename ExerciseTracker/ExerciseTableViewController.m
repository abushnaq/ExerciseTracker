//
//  ExerciseTableViewController.m
//  ExerciseTracker
//
//  Created by Ahmad Bushnaq on 1/10/14.
//  Copyright (c) 2014 Ahmad Bushnaq. All rights reserved.
//

#import "ExerciseTableViewController.h"
#import "AppDelegate.h"
#import "Exercise.h"

@interface ExerciseTableViewController ()

@end

@implementation ExerciseTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // keep a reference to the app delegate so that we can access per-type exercise lists more
    // easily later.
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    // create our formatter for showing the date in the list
    formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = kDateFormat;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return kExerciseTypeRunString;
        case 1:
            return kExerciseTypeWeightsString;
        case 2:
            return kExerciseTypeSwimsString;
        default:
            
            break;
    }
    return @"";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // run, weights, swim
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case kExerciseTypeRunID:
            return appDelegate.runs.count;
            break;
        case kExerciseTypeWeightsID:
            return appDelegate.weights.count;
            break;
        case kExerciseTypeSwimsID:
            return appDelegate.swims.count;
            break;
            
        default:
          
            break;
    }
    return 0;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    // first, get the correct exercise
    Exercise *exercise = nil;
    switch (indexPath.section) {
        case kExerciseTypeRunID:
            exercise = appDelegate.runs[indexPath.row];
            break;
        case kExerciseTypeWeightsID:
            exercise = appDelegate.weights[indexPath.row];
            break;
        case kExerciseTypeSwimsID:
            exercise = appDelegate.swims[indexPath.row];
            break;
            
        default:
            return 0;
            break;
    }
    
    
    // Now populate the cell for display
    NSDate *dateOfExercise = [[NSDate alloc] initWithTimeIntervalSince1970:exercise.timestamp];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [formatter stringFromDate:dateOfExercise]];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d min", exercise.duration];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // first, get the correct exercise object and remove it from the appropriate collection
        Exercise *exercise = nil;

        switch (indexPath.section) {
            case kExerciseTypeRunID:
                exercise = appDelegate.runs[indexPath.row];
                [appDelegate.runs removeObject:exercise];
                break;
            case kExerciseTypeWeightsID:
                exercise = appDelegate.weights[indexPath.row];
                [appDelegate.weights removeObject:exercise];
                break;
            case kExerciseTypeSwimsID:
                exercise = appDelegate.swims[indexPath.row];
                [appDelegate.swims removeObject:exercise];
                break;
                
            default:
                
                break;
        }
        // then delete it from storage and save
        [appDelegate deleteObject:exercise];
        [appDelegate save];
        
        // now delete the row in the UI.
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        

    }   
    
}



@end
