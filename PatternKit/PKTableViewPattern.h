//
//  PKTableViewManager.h
//  ShitKit
//
//  Created by Phillip Caudell on 26/10/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import "PKItemViewPattern.h"

@interface PKTableViewPattern : PKItemViewPattern <UITableViewDataSource, UITableViewDelegate>

@property (readonly, strong) UITableView *tableView;

- (instancetype)initWithTableView:(UITableView *)tableView;

@end
