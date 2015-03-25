//
//  RESTableViewController.m
//  RESAssignment5
//
//  Created by Robert Slatkin on 3/3/15.
//  Copyright (c) 2015 Robert Slatkin. All rights reserved.
//

#import "RESTableViewController.h"
#import "RESWebViewController.h"
#import "RESAddViewController.h"
#import "RESDataModel.h"
#import "RESWebPage.h"

@interface RESTableViewController ()

@end

@implementation RESTableViewController

- (instancetype)init
{
    //Call the superclass's designated initializer
    self = [super initWithStyle:UITableViewStylePlain];
    
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"Websites";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addWebPageView)];
    self.navigationItem.rightBarButtonItem = rightButton;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return [[[RESDataModel sharedStore] allWebPages] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Configure the cell...
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    NSMutableArray *webPages = [[RESDataModel sharedStore] allWebPages];
    RESWebPage *webPage = webPages[indexPath.row];
    cell.textLabel.text = [webPage name];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RESWebViewController *webVC = [[RESWebViewController alloc] init];
    
    NSMutableArray *webPages = [[RESDataModel sharedStore] allWebPages];
    RESWebPage *selected = webPages[indexPath.row];
    
    webVC.selected = selected;
    
    //Push it onto the top of the navigation controller's stack
    [self.navigationController pushViewController:webVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)addWebPageView
{
    //Make a new index path for the 0th section, last row
    NSInteger lastRow = [self.tableView numberOfRowsInSection:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    //Insert this new row into the table.
    RESAddViewController *addVC = [[RESAddViewController alloc] init];
    [self.navigationController pushViewController:addVC animated:YES];
    //[self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[RESDataModel sharedStore] moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{

    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        //Delete the row from the data source.
        
        //[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
        
        NSMutableArray *webPages = [[RESDataModel sharedStore] allWebPages];
        RESWebPage *webPage = webPages[indexPath.row];
        [[RESDataModel sharedStore] removeItem:webPage];
        [[RESDataModel sharedStore] saveChanges];
        
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if(editingStyle == UITableViewCellEditingStyleInsert){
        //Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    RESAddViewController *editVC = [[RESAddViewController alloc] init];
    
    
    NSMutableArray *webPages = [[RESDataModel sharedStore] allWebPages];
    RESWebPage *selected = webPages[indexPath.row];
    
    editVC.editMode = YES;
    editVC.selectedWebpage = selected;
    [self.navigationController pushViewController:editVC animated:YES];
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
