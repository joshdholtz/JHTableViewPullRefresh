//
//  ViewController.m
//  JHTableViewPullRefresh
//
//  Created by Josh Holtz on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) NSInteger numberOfRows;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

@synthesize numberOfRows = _numberOfRows;
@synthesize timer = _timer;

@synthesize table = _table;


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    _numberOfRows = 15;
    
    [_table setTableFooterView:[[UIView alloc] init]];
    [_table reloadData];
    
    [self registerRefreshTableView:_table withReloadType:kPullRefreshTypeBoth];
}

- (void)viewDidUnload
{
    [self setTable:nil];
    [super viewDidUnload];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _numberOfRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [[cell textLabel] setText:[NSString stringWithFormat:@"Cell %d", indexPath.row]];
    
    return cell;
}

#pragma mark - JHPullRefresh

- (void)reloadTableViewDataPullDown {
    _numberOfRows += 1;
    
    [self performSelector:@selector(reloadTableViewDataPullDownDone) withObject:nil afterDelay:1.5f];
}

- (void)reloadTableViewDataPullDownDone {
    [self dataDidFinishRefreshing];
}

- (void)reloadTableViewDataPullUp {
    _numberOfRows += 1;
    [self performSelector:@selector(reloadTableViewDataPullUpDone) withObject:nil afterDelay:1.5f];
}

- (void)reloadTableViewDataPullUpDone {
    [self dataDidFinishRefreshing];
}

@end
