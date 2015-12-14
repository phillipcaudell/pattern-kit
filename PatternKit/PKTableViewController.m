//
//  PKTableViewController.m
//  PatternKit
//
//  Created by Phillip Caudell on 14/12/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import "PKTableViewController.h"

@interface PKTableViewController ()

@end

@implementation PKTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableViewPattern = [[PKTableViewPattern alloc] initWithTableView:self.tableView];
}

@end
