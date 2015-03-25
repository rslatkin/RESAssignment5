//
//  RESAddViewController.h
//  RESAssignment5
//
//  Created by Robert Slatkin on 3/5/15.
//  Copyright (c) 2015 Robert Slatkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RESWebPage;

@interface RESAddViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *nameField;
@property (nonatomic, weak) IBOutlet UITextField *urlField;

@property (nonatomic, weak) NSMutableString *name;
@property (nonatomic, weak) NSMutableString *address;

@property (nonatomic) BOOL *editMode;
@property (nonatomic, weak) RESWebPage *selectedWebpage;

@end
