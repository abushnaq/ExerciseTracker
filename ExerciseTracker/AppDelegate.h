//
//  AppDelegate.h
//  ExerciseTracker
//
//  Created by Ahmad Bushnaq on 1/10/14.
//  Copyright (c) 2014 Ahmad Bushnaq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exercise.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSManagedObjectContext *objectContext;
    
}


@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) NSMutableArray *runs;
@property (nonatomic, strong) NSMutableArray *weights;
@property (nonatomic, strong) NSMutableArray *swims;


// get a new object, save, and delete.
- (Exercise*) newExercise;
- (void) save;
- (void) deleteObject:(Exercise*) exercise;

// refresh from core data
- (void) reload;
@end
