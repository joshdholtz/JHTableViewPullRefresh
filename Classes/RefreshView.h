//
//  RefreshView.h
//  JHTableViewPullRefresh
//
//  Created by Josh Holtz on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#define kRefreshViewPullDown 0
#define kRefreshViewPullUp 1
#define kRefreshViewRefreshing 2

#import <UIKit/UIKit.h>

@interface RefreshView : UIView

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *lblRefreshText;

- (void)setStatus:(NSInteger)status;

@end
