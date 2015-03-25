//
//  RESWebPage.m
//  RESAssignment5
//
//  Created by Robert Slatkin on 3/5/15.
//  Copyright (c) 2015 Robert Slatkin. All rights reserved.
//

#import "RESWebPage.h"
#import "RESAddViewController.h"

@implementation RESWebPage


- (instancetype)initWithAddress:(NSMutableString *)url
                           name:(NSMutableString *)name
{
    self = [super init];
    
    if (self) {
        
        _url = url;
        _name = name;
    }
    
    return self;
}

- (instancetype)initWithAddress:(NSMutableString *)url
{
    return [self initWithAddress:url
                            name:url];

}


- (instancetype)init
{
    return [self initWithAddress:[NSMutableString stringWithString:@"Address"]];
}

- (void)setWebPageAddress:(NSMutableString *)str
{
    _url = str;
}

- (NSMutableString *)url
{
    return _url;
}

- (void)setWebPageName:(NSMutableString *)str
{
    _name = str;
}

- (NSMutableString *)name
{
    return _name;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _name = [aDecoder decodeObjectForKey:@"websiteName"];
        _url = [aDecoder decodeObjectForKey:@"websiteURL"];
    }
    return self;
}


- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"websiteName"];
    [aCoder encodeObject:self.url forKey:@"websiteURL"];
}

@end
