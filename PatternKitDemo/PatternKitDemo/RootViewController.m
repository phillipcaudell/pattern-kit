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
    
    PKItem *tableViewItem = [PKItem itemWithTitle:@"Table View" subtitle:nil image:nil];
    [tableViewItem setInteractionHandler:^(PKInteraction *interaction) {
        
        NSLog(@"Item interaction handler! %@", interaction);
    }];
    
    PKItem *collectionViewItem = [PKItem itemWithTitle:@"Collection View"];
    
    PKTableSection *patternSection = [PKTableSection tableSectionWithHeaderTitle:@"Patterns" items:@[tableViewItem, collectionViewItem] footerTitle:nil interactionHandler:nil];
    
//    [patternSection setInteractionHandler:^(PKInteraction *interaction) {
//        
//        NSLog(@"Section interaction handler!");
//    }];
    
    self.tableViewPattern.sections = @[patternSection];
}

@end
