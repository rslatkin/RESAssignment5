//
//  RESAddViewController.m
//  RESAssignment5
//
//  Created by Robert Slatkin on 3/5/15.
//  Copyright (c) 2015 Robert Slatkin. All rights reserved.
//

#import "RESAddViewController.h"
#import "RESTableViewController.h"
#import "RESWebPage.h"
#import "RESDataModel.h"

@interface RESAddViewController ()

@end

@implementation RESAddViewController

- (instancetype)initWithNibName:(NSString *)nibNameorNil bundle:(NSBundle *)nibBundleOrNil
{
    // Call the init method implemented by the superclass
    self = [super initWithNibName:nibNameorNil bundle:nibBundleOrNil];
    
    // Return the address of the new object;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear: (BOOL)animated {
    [super viewWillAppear:animated];
    
    if (_editMode == NO)
    {
    self.navigationItem.title = @"Add Webpage";
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(dismissView)];
    self.navigationItem.leftBarButtonItem = leftButton;
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(addWebPage)];
    self.navigationItem.rightBarButtonItem = rightButton;
    }
    
    if (_editMode == YES)
    {
        self.navigationItem.title = @"Edit Webpage";
        
        UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(dismissView)];
        self.navigationItem.leftBarButtonItem = leftButton;
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(editWebPage)];
        self.navigationItem.rightBarButtonItem = rightButton;
        
        self.nameField.text = [self.selectedWebpage name];
        self.urlField.text = [self.selectedWebpage url];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissView {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)addWebPage {
    
    RESWebPage *website = [[RESWebPage alloc] init];
    
    NSMutableString *name = [NSMutableString stringWithString:[_nameField text]];
    NSMutableString *address = [NSMutableString stringWithString:[_urlField text]];
    [website setWebPageName:name];
    [website setWebPageAddress:address];
    
    [[RESDataModel sharedStore] saveChanges];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (void)editWebPage {

    RESWebPage *website = _selectedWebpage;
    NSMutableString *name = [NSMutableString stringWithString:[_nameField text]];
    NSMutableString *address = [NSMutableString stringWithString:[_urlField text]];
    [website setWebPageName:name];
    [website setWebPageAddress:address];
        
    [[RESDataModel sharedStore] saveChanges];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
