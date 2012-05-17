//
//  RefreshView.m
//  JHTableViewPullRefresh
//
//  Created by Josh Holtz on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RefreshView.h"

@implementation RefreshView

@synthesize activityIndicator = _activityIndicator;
@synthesize lblRefreshText = _lblRefreshText;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setStatus:(NSInteger)status {
    if (kRefreshViewPullDown == status) {
        [_activityIndicator setHidden:YES];
        [_lblRefreshText setText:@"Pull down to refresh"];
    } else if (kRefreshViewPullUp == status) {
        [_activityIndicator setHidden:YES];
        [_lblRefreshText setText:@"Pull up to refresh"];
    } else if (kRefreshViewRefreshing == status) {
        [_activityIndicator setHidden:NO];
        [_lblRefreshText setText:@"Refreshing.."];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
