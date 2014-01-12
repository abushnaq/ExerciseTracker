//
//  ExerciseConstants.h
//  ExerciseTracker
//
//  Created by Ahmad Bushnaq on 1/11/14.
//  Copyright (c) 2014 Ahmad Bushnaq. All rights reserved.
//




#define     kEntityName             @"Exercise"
#define     kStoreName              [NSString stringWithFormat:@"%@.sqlite", kEntityName]

#define     kStoryboardName                     @"Main"
#define     kExerciseListControllerID           @"exerciseList"

#define     kDateFormat                         @"MM/dd/yyyy"

#define     kExerciseTypeRunString              NSLocalizedString(@"Runs", @"")
#define     kExerciseTypeWeightsString          NSLocalizedString(@"Weights", @"")
#define     kExerciseTypeSwimsString            NSLocalizedString(@"Swims", @"")

#define     kExerciseTypeRunID                  0
#define     kExerciseTypeWeightsID              1
#define     kExerciseTypeSwimsID                2