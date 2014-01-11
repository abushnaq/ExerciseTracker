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
                                   insertNewObjectForEntityForName:@"Exercise"
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
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Exercise"
                                              inManagedObjectContext:objectContext];
    NSError *err;
    [fetchRequest setEntity:entity];
//    [fetchRequest setFetchLimit:19];
    NSArray *allExercises = [objectContext executeFetchRequest:fetchRequest error:&err];
    _runs = [[NSMutableArray alloc] initWithArray:[allExercises filteredArrayUsingPredicate:
             [NSPredicate predicateWithBlock:^BOOL(Exercise *evaluatedObject, NSDictionary *bindings)
                   {
                       return evaluatedObject.type == 0;
                   }]]];
    
    _weights = [[NSMutableArray alloc] initWithArray:[allExercises filteredArrayUsingPredicate:
             [NSPredicate predicateWithBlock:^BOOL(Exercise *evaluatedObject, NSDictionary *bindings)
              {
                  return evaluatedObject.type == 1;
              }]]];
    _swims = [[NSMutableArray alloc] initWithArray:[allExercises filteredArrayUsingPredicate:
             [NSPredicate predicateWithBlock:^BOOL(Exercise *evaluatedObject, NSDictionary *bindings)
              {
                  return evaluatedObject.type == 2;
              }]]];
    

   
}

- (void) setupDataStore
{
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Exercise" withExtension:@"momd"];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Exercise.sqlite"];
    
    NSManagedObjectModel *managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
    
    [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:NULL];
    
    
    
    objectContext = [[NSManagedObjectContext alloc] init];
    [objectContext setPersistentStoreCoordinator:coordinator];
    
    [self reload];
    
    
//    
//    Exercise *stuff = [NSEntityDescription
//                       insertNewObjectForEntityForName:@"Exercise"
//                       inManagedObjectContext:objectContext];
//    stuff.duration = 30;
//    stuff.timestamp = 123456;
//    stuff.type = @"hello";
//    
//    [self save];
//    [self reload];
//
//
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self setupDataStore];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
