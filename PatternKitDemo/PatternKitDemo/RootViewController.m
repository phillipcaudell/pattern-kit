//
//  ViewController.m
//  PatternKitDemo
//
//  Created by Phillip Caudell on 07/12/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"PatternKit";

    self.tableViewPattern = [[PKTableViewPattern alloc] initWithTableView:self.tableView];
    
    PKItem *tableViewItem = [PKItem rowWithTitle:@"Table View" subtitle:nil image:nil];
    PKItem *collectionViewItem = [PKItem rowWithTitle:@"Collection View"];
    
    PKTableSection *patternSection = [PKTableSection tableSectionWithHeaderTitle:@"Patterns" items:@[tableViewItem, collectionViewItem] footerTitle:nil interactionHandler:nil];
    
    self.tableViewPattern.sections = @[patternSection];
}

@end
