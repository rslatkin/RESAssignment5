//
//  RESWebViewController.h
//  RESAssignment5
//
//  Created by Robert Slatkin on 3/3/15.
//  Copyright (c) 2015 Robert Slatkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RESWebPage;

@interface RESWebViewController : UIViewController <NSURLConnectionDelegate>

@property (nonatomic) RESWebPage *selected;

//@property (nonatomic) NSMutableString *selected;

@property (nonatomic, weak) IBOutlet UIWebView *urlPage;

@end
