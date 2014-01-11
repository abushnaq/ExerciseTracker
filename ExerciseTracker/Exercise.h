//
//  Exercise.h
//  ExerciseTracker
//
//  Created by Ahmad Bushnaq on 1/11/14.
//  Copyright (c) 2014 Ahmad Bushnaq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Exercise : NSManagedObject

@property (nonatomic) int16_t duration;
@property (nonatomic) NSTimeInterval timestamp;
@property (nonatomic) int16_t type;

@end
