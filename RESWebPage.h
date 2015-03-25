//
//  RESWebPage.h
//  RESAssignment5
//
//  Created by Robert Slatkin on 3/5/15.
//  Copyright (c) 2015 Robert Slatkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RESWebPage : NSObject <NSCoding>
{
    NSMutableString *_name;
    NSMutableString *_url;
}

@property (nonatomic, weak) NSMutableString *inputAddress;
@property (nonatomic, weak) NSMutableString *inputName;
@property int order;

+ (NSMutableArray *) getWebPage;

- (instancetype)initWithAddress:(NSMutableString *)url
                           name:(NSMutableString *)name;

- (instancetype)initWithAddress:(NSMutableString *)url;

- (void)setWebPageName:(NSMutableString *)str;
- (NSMutableString *)name;

- (void)setWebPageAddress:(NSMutableString *)str;
- (NSMutableString *)url;


- (instancetype)initWithCoder:(NSCoder *)aDecoder;
- (void)encodeWithCoder:(NSCoder *)aCoder;

@end