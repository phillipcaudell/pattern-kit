//
//  PKTableViewManager.h
//  ShitKit
//
//  Created by Phillip Caudell on 26/10/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKItemViewPattern.h"

@interface PKTableViewPattern : PKItemViewPattern <UITableViewDataSource, UITableViewDelegate>

@property (readonly, strong) UITableView *tableView;
@property (nonatomic, assign) BOOL showsSectionIndexTitles;

- (instancetype)initWithTableView:(UITableView *)tableView;

@end
