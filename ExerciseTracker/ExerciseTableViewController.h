//
//  ExerciseTableViewController.h
//  ExerciseTracker
//
//  Created by Ahmad Bushnaq on 1/10/14.
//  Copyright (c) 2014 Ahmad Bushnaq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ExerciseTableViewController : UITableViewController
{
    AppDelegate *appDelegate;
    NSDateFormatter *formatter;
}
@end
