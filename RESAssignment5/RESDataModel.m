//
//  RESDataModel.m
//  RESAssignment5
//
//  Created by Robert Slatkin on 3/3/15.
//  Copyright (c) 2015 Robert Slatkin. All rights reserved.
//

#import "RESDataModel.h"
#import "RESWebPage.h"

@interface RESDataModel ()

@property (nonatomic) NSMutableArray *urls;
@property (nonatomic) NSMutableArray *names;

@property (nonatomic) NSMutableArray *privateWebPages;


@end

@implementation RESDataModel

+ (instancetype)sharedStore
{
    static RESDataModel *sharedStore = nil;
    
    //Do I need to create a shared store?
    if(!sharedStore){
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use + [RESDataModel sharedStore]" userInfo:nil];
    
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    
    if (self) {
        //_privateWebPages = [[NSMutableArray alloc] init];
        
        NSString *path = [self itemArchivePath];
        _privateWebPages = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        // If the array hadn't been saved previously, create a new empty one
        if (!_privateWebPages){
            _privateWebPages = [[NSMutableArray alloc] init];
        
        _allNames = [[NSMutableArray alloc] init];
        //Add items
        [_allNames addObject:@"Google"];
        [_allNames addObject:@"CNN"];
        [_allNames addObject:@"Facebook"];
        [_allNames addObject:@"Amazon"];
        [_allNames addObject:@"Yahoo!"];
        
        
        _allURLS = [[NSMutableArray alloc] init];
        //Add items
        [_allURLS addObject:@"http://www.google.com"];
        [_allURLS addObject:@"http://www.cnn.com"];
        [_allURLS addObject:@"http://www.facebook.com"];
        [_allURLS addObject:@"http://www.amazon.com"];
        [_allURLS addObject:@"http://www.yahoo.com"];
        
        
        
        RESWebPage *website0 = [[RESWebPage alloc] init];
        [website0 setWebPageName:_allNames[0]];
        [website0 setWebPageAddress:_allURLS[0]];
        [_privateWebPages addObject:website0];
        
        RESWebPage *website1 = [[RESWebPage alloc] init];
        [website1 setWebPageName:_allNames[1]];
        [website1 setWebPageAddress:_allURLS[1]];
        [_privateWebPages addObject:website1];
        
        RESWebPage *website2 = [[RESWebPage alloc] init];
        [website2 setWebPageName:_allNames[2]];
        [website2 setWebPageAddress:_allURLS[2]];
        [_privateWebPages addObject:website2];
        
        RESWebPage *website3 = [[RESWebPage alloc] init];
        [website3 setWebPageName:_allNames[3]];
        [website3 setWebPageAddress:_allURLS[3]];
        [_privateWebPages addObject:website3];
        
        RESWebPage *website4 = [[RESWebPage alloc] init];
        [website4 setWebPageName:_allNames[4]];
        [website4 setWebPageAddress:_allURLS[4]];
        [_privateWebPages addObject:website4];
        }
        
    }
  
    return self;
}

- (NSMutableArray *)allNames
{
    return self.names;
}

- (NSMutableArray *)allURLS
{
    return self.urls;
}

- (NSMutableArray *)allWebPages
{
    return self.privateWebPages;
}

- (RESWebPage *)createWebPage:(RESWebPage*)webPage
{
    [self.privateWebPages addObject:webPage];
    
    return webPage;
}

- (void)removeItem:(RESWebPage *)webPage
{
    [self.privateWebPages removeObjectIdenticalTo:webPage];
}

- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    if (fromIndex == toIndex) {
        return;
    }
    
    RESWebPage *webPage = self.privateWebPages[fromIndex];
    [self.privateWebPages removeObjectAtIndex:fromIndex];
    [self.privateWebPages insertObject:webPage atIndex:toIndex];
    
    [[RESDataModel sharedStore] saveChanges];
    
}


- (NSString *)itemArchivePath
{
    // Make sure that the first argument is NSDocumentDirectory
    // and not NSDocumentationDirectory
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    // Get the one document direcory from that list
    NSString *documentDirectory = [documentDirectories firstObject];

    return [documentDirectory stringByAppendingPathComponent:@"websites.archive"];
}


- (BOOL)saveChanges
{
    NSString *path = [self itemArchivePath];
    
    // Returns YES on success
    return [NSKeyedArchiver archiveRootObject:self.privateWebPages toFile:path];
}

@end
