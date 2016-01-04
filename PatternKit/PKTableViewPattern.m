//
//  PKTableViewManager.m
//  ShitKit
//
//  Created by Phillip Caudell on 26/10/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import "PKTableViewPattern.h"
#import "PKTableSectionProtocol.h"
#import "PKTableItemProtocol.h"
#import "PKTableViewCell.h"

@interface PKTableViewPattern ()

@end

@implementation PKTableViewPattern

- (instancetype)initWithTableView:(UITableView *)tableView
{
    if (self = [super init]) {
        
        _tableView = tableView;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    
    return self;
}

- (id)dequeueProxyCellForIndexPath:(NSIndexPath *)indexPath
{
    id cell = [super dequeueProxyCellForIndexPath:indexPath];
    Class cellClass = [self cellClassForIndexPath:indexPath];

    if (!cell) {
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:NSStringFromClass(cellClass)];
    }
    
    return cell;
}

- (void)registerCellClass:(Class)cellClass
{
    [super registerCellClass:cellClass];

    [self.tableView registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
}

- (Class)cellClassForIndexPath:(NSIndexPath *)indexPath
{
    Class cellClass = [super cellClassForIndexPath:indexPath];
    
    if (!cellClass) {
        cellClass = [PKTableViewCell class];
    }
    
    return cellClass;
}

#pragma mark - Table view datasoure

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    id <PKTableSectionProtocol> section = (id <PKTableSectionProtocol>)[self sectionAtIndex:sectionIndex];
    
    return section.sectionItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class cellClass = [self cellClassForIndexPath:indexPath];
    
    // Check to see if cell class is registered with table-view; if not, register it.
    if (![self isCellClassRegistered:cellClass]) {
        [self registerCellClass:cellClass];
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(cellClass) forIndexPath:indexPath];
    [self configureCell:cell forIndexPath:indexPath];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)sectionIndex
{
    id <PKTableSectionProtocol> section = (id <PKTableSectionProtocol>)[self sectionAtIndex:sectionIndex];
    
    if ([section respondsToSelector:@selector(sectionHeaderTitle)]) {
        return [section sectionHeaderTitle];
    } else {
        return nil;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)sectionIndex
{
    id <PKTableSectionProtocol> section = (id <PKTableSectionProtocol>)[self sectionAtIndex:sectionIndex];
    
    if ([section respondsToSelector:@selector(sectionFooterTitle)]) {
        return [section sectionFooterTitle];
    } else {
        return nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id <PKTableItemProtocol> item = (id <PKTableItemProtocol>)[self rowAtIndexPath:indexPath];
    
    if ([item respondsToSelector:@selector(itemSizeWithConstraintSize:)]) {
        
        CGSize constaintSize = CGSizeMake(self.tableView.bounds.size.width, MAXFLOAT);

        return [item itemSizeWithConstraintSize:constaintSize].height;
        
    } else {
        
        return [self automaticCellHeightForIndexPath:indexPath];
    }
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if (self.showsSectionIndexTitles) {
        return [self.sections valueForKeyPath:@"sectionHeaderTitle"];
    } else {
        return nil;
    }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PKInteractionHandler interactionHandler = [self interactionHandlerForIndexPath:indexPath];
    id <PKTableItemProtocol> item = (id <PKTableItemProtocol>)[self rowAtIndexPath:indexPath];

    if (interactionHandler) {
        
        PKInteraction *interaction = [PKInteraction new];
        interaction.indexPath = indexPath;
        interaction.item = item;
        interaction.view = [self.tableView cellForRowAtIndexPath:indexPath];
        interaction.type = PKInteractionTypePrimary;
        
        interactionHandler(interaction);
        
    } else {
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    PKInteractionHandler interactionHandler = [self interactionHandlerForIndexPath:indexPath];
    id <PKTableItemProtocol> item = (id <PKTableItemProtocol>)[self rowAtIndexPath:indexPath];
    
    if (interactionHandler) {
        
        PKInteraction *interaction = [PKInteraction new];
        interaction.indexPath = indexPath;
        interaction.item = item;
        interaction.view = [self.tableView cellForRowAtIndexPath:indexPath];
        interaction.type = PKInteractionTypeSecondary;
        
        interactionHandler(interaction);
    }
}

#pragma mark - Helpers

- (PKInteractionHandler)interactionHandlerForIndexPath:(NSIndexPath *)indexPath
{
    id <PKTableItemProtocol> item = (id <PKTableItemProtocol>)[self rowAtIndexPath:indexPath];
    id <PKTableSectionProtocol> section = (id <PKTableSectionProtocol>)[self sectionAtIndex:indexPath.section];
    
    PKInteractionHandler interactionHandler = nil;
    
    if ([section respondsToSelector:@selector(sectionInteractionHandler)]) {
        interactionHandler = [section sectionInteractionHandler];
    }
    
    if ([item respondsToSelector:@selector(itemInteractionHandler)]) {
        
        if ([item itemInteractionHandler]) {
            interactionHandler = [item itemInteractionHandler];
        }
    }
    
    return interactionHandler;
}

- (CGFloat)automaticCellHeightForIndexPath:(NSIndexPath *)indexPath
{
    // Configure a proxy instance of the row's cell
    UITableViewCell *proxyCell = [self dequeueProxyCellForIndexPath:indexPath];
    proxyCell.frame = CGRectMake(0, 0, self.tableView.bounds.size.width, 1);
    [self configureCell:proxyCell forIndexPath:indexPath];
    
    // Force cell to layout
    [proxyCell layoutSubviews];
    
    CGFloat height = self.tableView.rowHeight;
    CGFloat greatestY = 0;
    CGFloat lowestY = 0;
    
    // Go through each subview and find view with greatest and lowest y & height values
    for (UIView *view in proxyCell.contentView.subviews) {
        
        CGFloat maxY = view.frame.size.height + view.frame.origin.y;
        
        if (maxY > greatestY) {
            greatestY = maxY;
        }
        
        if (view.frame.origin.y < lowestY) {
            lowestY = view.frame.origin.y;
        }
    }
    
    height = greatestY + fabs(lowestY);
    
    // Default cell edge insets
    UIEdgeInsets insets = UIEdgeInsetsMake(12, 0, 12, 0);
    
    id <PKTableItemProtocol> item = (id <PKTableItemProtocol>)[self rowAtIndexPath:indexPath];
    
    if ([item respondsToSelector:@selector(itemEdgeInsets)]) {
        insets = [item itemEdgeInsets];
    }
    
    height += insets.top + insets.bottom;
    
    return height;
}

- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath
{
    id <PKTableItemProtocol> item = (id <PKTableItemProtocol>)[self rowAtIndexPath:indexPath];
    
    cell.textLabel.numberOfLines = 0;
    cell.detailTextLabel.numberOfLines = 0;
    
//    if ([item respondsToSelector:@selector(itemTitle)]) {
//        cell.textLabel.text = [item itemTitle];
//    }
//    
//    if ([item respondsToSelector:@selector(itemSubtitle)]) {
//        cell.detailTextLabel.text = [item itemSubtitle];
//    }
    
//    if ([item respondsToSelector:@selector(itemImage)]) {
//        cell.imageView.image = [item itemImage];
//    }
//    
//    if ([item respondsToSelector:@selector(itemAccessoryType)]) {
//        cell.accessoryType = [item itemAccessoryType];
//    }
    
    // Allow item to configure cell
    if ([item respondsToSelector:@selector(configureItemCell:)]) {
        [item configureItemCell:cell];
    }
}

@end