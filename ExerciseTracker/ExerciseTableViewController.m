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

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"MM/dd/yyyy";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
            return @"Runs";
            break;
        case 1:
            return @"Weights";
            break;
        case 2:
            return @"Swims";
            break;
            
        default:
            
            break;
    }
    return @"";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return appDelegate.runs.count;
            break;
        case 1:
            return appDelegate.weights.count;
            break;
        case 2:
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
    Exercise *exercise = nil;
    switch (indexPath.section) {
        case 0:
            exercise = appDelegate.runs[indexPath.row];

            break;
        case 1:
            exercise = appDelegate.weights[indexPath.row];
            break;
        case 2:
            exercise = appDelegate.swims[indexPath.row];
            break;
            
        default:
            return 0;
            break;
    }
    
    // Configure the cell...
    NSDate *dateOfExercise = [[NSDate alloc] initWithTimeIntervalSince1970:exercise.timestamp];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [formatter stringFromDate:dateOfExercise]];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d min", exercise.duration];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Exercise *exercise = nil;

        switch (indexPath.section) {
            case 0:
                exercise = appDelegate.runs[indexPath.row];
                [appDelegate.runs removeObject:exercise];
                break;
            case 1:
                exercise = appDelegate.weights[indexPath.row];
                [appDelegate.weights removeObject:exercise];
                break;
            case 2:
                exercise = appDelegate.swims[indexPath.row];
                [appDelegate.swims removeObject:exercise];
                break;
                
            default:
                
                break;
        }
        
        [appDelegate deleteObject:exercise];
        [appDelegate save];
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        

    }   
    
}



@end
