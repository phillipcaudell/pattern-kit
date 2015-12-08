//
//  DemoTableViewController.m
//  PatternKitDemo
//
//  Created by Phillip Caudell on 08/12/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import "DemoTableViewController.h"

@import PatternKit;

@interface DemoTableViewController ()

@property (readonly, strong) PKTableViewPattern *tableViewPattern;

@end

@implementation DemoTableViewController

- (instancetype)init
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        
        self.title = @"Table View";

    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableViewPattern = [[PKTableViewPattern alloc] initWithTableView:self.tableView];
    
    /*
     * Basic Usage
     */
    
    PKItem *introItem = [PKItem itemWithTitle:@"This is a table item." subtitle:@"A table item is a representation of a table cell." image:nil];
    
    PKItem *concreateItem = [PKItem itemWithTitle:@"Concreate PKItem" subtitle:@"For basic UITableViewCell representation, you can simply use PKItem to represent a title, subtitle, and image." image:nil];
    
    PKTableItem *accessoryTableItem = [PKTableItem tableItemWithTitle:@"Lols"];
    accessoryTableItem.subtitle = @"Update subtitle here too";
    accessoryTableItem.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    NSLog(@"ACCESS: %@", accessoryTableItem);
    
    PKSection *introSection = [PKTableSection tableSectionWithHeaderTitle:@"Basic Usage" items:@[introItem, concreateItem, accessoryTableItem] footerTitle:nil interactionHandler:nil];
    
    /*
     * Interactions
     */
    
    PKItem *interactiveItem = [PKItem itemWithTitle:@"Interactive Item"];
    [interactiveItem setInteractionHandler:^(PKInteraction *interaction) {
        
        NSLog(@"I'm an item with a specific interaction handler!");
    }];
    
    PKItem *interactiveSectionItem = [PKItem itemWithTitle:@"Interactive Section"];
    
    PKTableSection *interactiveSection = [PKTableSection tableSectionWithHeaderTitle:@"Interactive" items:@[interactiveItem, interactiveSectionItem] footerTitle:nil interactionHandler:^(PKInteraction *interaction) {
        
        NSLog(@"I'm the interaction handler for the section, which is applied to all items without an interaction handler. My indexPath is: %@", interaction.indexPath);
    }];
    
    self.tableViewPattern.sections = @[introSection, interactiveSection];
    
}

@end
