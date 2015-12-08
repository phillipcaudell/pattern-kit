//
//  DemoTableViewController.m
//  PatternKitDemo
//
//  Created by Phillip Caudell on 08/12/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import "DemoTableViewController.h"
#import "UglyTableViewCell.h"

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
    
    PKItem *concreateItem = [PKItem itemWithTitle:@"Concreate PKItem" subtitle:@"For basic UITableViewCell representation, you can simply use PKItem to represent a title, subtitle, and image. Table view cell heights are automatically calcuclated." image:[UIImage imageNamed:@"demo-table-icon"]];
    
    
    PKSection *introSection = [PKTableSection tableSectionWithHeaderTitle:@"Basic Usage" items:@[introItem, concreateItem] footerTitle:nil interactionHandler:nil];
    
    /*
     * Interactions
     */
    
    PKItem *interactiveItem = [PKItem itemWithTitle:@"Interactive Item"];
    [interactiveItem setInteractionHandler:^(PKInteraction *interaction) {
        
        NSLog(@"I'm an item with a specific interaction handler!");
    }];
    
    PKItem *interactiveSectionItem = [PKItem itemWithTitle:@"Interactive Section"];
    
    PKTableItem *accessoryTableItem = [PKTableItem tableItemWithTitle:@"Interactive Accessory" subtitle:@"I have an accessory with an interaction." image:nil];
    accessoryTableItem.accessoryType = UITableViewCellAccessoryDetailButton;
    
    [accessoryTableItem setInteractionHandler:^(PKInteraction *interaction) {
        
        if (interaction.type == PKInteractionTypePrimary) {
            NSLog(@"I'm the interaction for selecting the whole cell");
        }
        
        if (interaction.type == PKInteractionTypeSecondary) {
            NSLog(@"I'm the secondary interaction, the one for the accessory view.");
        }
    }];
    
    PKTableSection *interactiveSection = [PKTableSection tableSectionWithHeaderTitle:@"Interactive" items:@[interactiveItem, interactiveSectionItem, accessoryTableItem] footerTitle:nil interactionHandler:^(PKInteraction *interaction) {
        
        NSLog(@"I'm the interaction handler for the section, which is applied to all items without an interaction handler. My indexPath is: %@", interaction.indexPath);
    }];
    
    /*
     * Custom Cells
     */
    
    UglyTableItem *customItem = [UglyTableItem new];
    customItem.title = @"My cell is custom and has a tasteful colour scheme.";
    
    PKTableSection *customSection = [PKTableSection tableSectionWithHeaderTitle:@"Custom" items:@[customItem] footerTitle:nil interactionHandler:nil];
    
    self.tableViewPattern.sections = @[introSection, interactiveSection, customSection];
}

@end
