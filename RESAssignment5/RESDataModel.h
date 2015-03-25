//
//  RESDataModel.h
//  RESAssignment5
//
//  Created by Robert Slatkin on 3/3/15.
//  Copyright (c) 2015 Robert Slatkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RESWebPage;

@interface RESDataModel : NSObject

@property (nonatomic) NSMutableArray *allURLS;
@property (nonatomic) NSMutableArray *allNames;
@property (nonatomic) NSMutableArray *allWebPages;


+ (instancetype) sharedStore;
- (RESWebPage *) createWebPage:(RESWebPage *)webPage;
- (void)removeItem:(RESWebPage *)item;
- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

- (BOOL) saveChanges;

@end