//
//  JHPullRefreshViewController.h
//  JHTableViewPullRefresh
//
//  Created by Josh Holtz on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#define kPullRefreshTypeDown 0
#define kPullRefreshTypeUp 1
#define kPullRefreshTypeBoth 2

#import <UIKit/UIKit.h>

@interface JHPullRefreshViewController : UIViewController<UITableViewDelegate>

- (void)registerRefreshTableView:(UITableView*)tableView withReloadType:(NSInteger)refreshType;

- (void)reloadTableViewDataPullDown;
- (void)reloadTableViewDataPullUp;

- (void)dataDidFinishRefreshing;

@end
