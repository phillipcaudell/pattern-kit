//
//  PKItemViewManager.m
//  ShitKit
//
//  Created by Phillip Caudell on 26/10/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import "PKItemViewPattern.h"
#import "PKItemProtocol.h"
#import "PKSectionProtocol.h"   

@interface PKItemViewPattern ()

@property (nonatomic, strong) NSMutableArray *registeredCellClasses;
@property (nonatomic, strong) NSMutableDictionary *proxyCells;

@end

@implementation PKItemViewPattern

- (id <PKSectionProtocol>)sectionAtIndex:(NSInteger)index
{
    return self.sections[index];
}

- (id <PKItemProtocol>)rowAtIndexPath:(NSIndexPath *)indexPath
{
    id <PKSectionProtocol> section = [self sectionAtIndex:indexPath.section];
    
    return section.sectionItems[indexPath.row];
}

- (void)addSection:(id <PKSectionProtocol>)section
{
    [self willChangeValueForKey:@"sections"];
    
    if (!self.sections) {
        _sections = @[section];
    } else {
        _sections = [self.sections arrayByAddingObject:section];
    }
    
    [self didChangeValueForKey:@"sections"];
}

- (Class)cellClassForIndexPath:(NSIndexPath *)indexPath
{
    id <PKItemProtocol> item = [self rowAtIndexPath:indexPath];
    
    Class cellClass = nil;
    
    if ([item respondsToSelector:@selector(itemCellClass)]) {
        cellClass = [item itemCellClass];
    }
    
    return cellClass;
}

- (BOOL)isCellClassRegistered:(Class)cellClass
{
    return [self.registeredCellClasses containsObject:NSStringFromClass(cellClass)];
}

- (void)registerCellClass:(Class)cellClass
{
    [self.registeredCellClasses addObject:NSStringFromClass(cellClass)];
}

- (id)dequeueProxyCellForIndexPath:(NSIndexPath *)indexPath
{
    Class cellClass = [self cellClassForIndexPath:indexPath];
    NSString *reuseIdentifier = NSStringFromClass(cellClass);
    
    id cell = self.proxyCells[reuseIdentifier];
    
    return cell;
}

- (CGFloat)automaticCellHeightForIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

@end
