//
//  AppDelegate.m
//  ExerciseTracker
//
//  Created by Ahmad Bushnaq on 1/10/14.
//  Copyright (c) 2014 Ahmad Bushnaq. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (Exercise*) newExercise
{
    return [NSEntityDescription
                                   insertNewObjectForEntityForName:kEntityName
                                   inManagedObjectContext:objectContext];
}

- (void) save
{
     [objectContext save:nil];
}
- (void) deleteObject:(Exercise*) exercise
{
    [objectContext deleteObject:exercise];
}

- (void) reload
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:kEntityName
                                              inManagedObjectContext:objectContext];
    NSError *err;
    [fetchRequest setEntity:entity];

    // we could set the predicate on the fetch request so that we fetch only the type we need
    // but instead we filter in memory so that we only do one dip into the database instead of 3.
    NSArray *allExercises = [objectContext executeFetchRequest:fetchRequest error:&err];
    _runs = [[NSMutableArray alloc] initWithArray:[allExercises filteredArrayUsingPredicate:
             [NSPredicate predicateWithBlock:^BOOL(Exercise *evaluatedObject, NSDictionary *bindings)
                   {
                       return evaluatedObject.type == kExerciseTypeRunID;
                   }]]];
    
    _weights = [[NSMutableArray alloc] initWithArray:[allExercises filteredArrayUsingPredicate:
             [NSPredicate predicateWithBlock:^BOOL(Exercise *evaluatedObject, NSDictionary *bindings)
              {
                  return evaluatedObject.type == kExerciseTypeWeightsID;
              }]]];
    _swims = [[NSMutableArray alloc] initWithArray:[allExercises filteredArrayUsingPredicate:
             [NSPredicate predicateWithBlock:^BOOL(Exercise *evaluatedObject, NSDictionary *bindings)
              {
                  return evaluatedObject.type == kExerciseTypeSwimsID;
              }]]];
    

   
}

- (void) setupDataStore
{
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:kEntityName withExtension:@"momd"];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:kStoreName];
    
    NSManagedObjectModel *managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
    
    [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:NULL];
    
    
    
    objectContext = [[NSManagedObjectContext alloc] init];
    [objectContext setPersistentStoreCoordinator:coordinator];
    
    [self reload];
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self setupDataStore];
    
    return YES;
}

@end
