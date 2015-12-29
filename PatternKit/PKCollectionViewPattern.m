//
//  PKCollectionViewManager.m
//  ShitKit
//
//  Created by Phillip Caudell on 26/10/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import "PKCollectionViewPattern.h"
#import "PKSectionProtocol.h"
#import "PKItemProtocol.h"
#import "PKCollectionViewCell.h"    

@interface PKCollectionViewPattern () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation PKCollectionViewPattern

//- (instancetype)initWithCollectionView:(UICollectionView *)collectionView
//{
//    if (self = [super init]) {
//        
//        _collectionView = collectionView;
//        self.collectionView.delegate = self;
//        self.collectionView.dataSource = self;
//    }
//    
//    return self;
//}

- (void)setCollectionView:(UICollectionView *)collectionView
{
    [self willChangeValueForKey:@"collectionView"];
    _collectionView = collectionView;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self didChangeValueForKey:@"collectionView"];
}

#pragma mark - Helpers

- (Class)cellClassForIndexPath:(NSIndexPath *)indexPath
{
    id <PKItemProtocol> item = [self rowAtIndexPath:indexPath];
    
    Class cellClass = [PKCollectionViewCell class];
    
    if ([item respondsToSelector:@selector(itemCellClass)]) {
        cellClass = [item itemCellClass];
    }
    
    return cellClass;
}

- (void)registerCellClass:(Class)cellClass
{
    [super registerCellClass:cellClass];
    
    [self.collectionView registerClass:cellClass forCellWithReuseIdentifier:NSStringFromClass(cellClass)];
}

#pragma mark - Collection view delegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Class cellClass = [self cellClassForIndexPath:indexPath];
    
    // Check to see if cell class is registered with table-view; if not, register it.
    if (![self isCellClassRegistered:cellClass]) {
        [self registerCellClass:cellClass];
    }
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(cellClass) forIndexPath:indexPath];
        
    [self configureCell:cell forIndexPath:indexPath];
    
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.sections.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)sectionIndex
{
    id <PKSectionProtocol> section = (id <PKSectionProtocol>)[self sectionAtIndex:sectionIndex];

    return [[section sectionItems] count];
}

- (void)configureCell:(UICollectionViewCell *)cell forIndexPath:(NSIndexPath *)indexPath
{
    id <PKItemProtocol> item = (id <PKItemProtocol>)[self rowAtIndexPath:indexPath];
    
    if ([item respondsToSelector:@selector(configureItemCell:)]) {
        [item configureItemCell:cell];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    PKInteractionHandler interactionHandler = [self interactionHandlerForIndexPath:indexPath];
    id <PKItemProtocol> item = (id <PKItemProtocol>)[self rowAtIndexPath:indexPath];
    
    if (interactionHandler) {
        
        PKInteraction *interaction = [PKInteraction new];
        interaction.indexPath = indexPath;
        interaction.item = item;
        interaction.view = [self.collectionView cellForItemAtIndexPath:indexPath];
        interaction.type = PKInteractionTypePrimary;
        
        interactionHandler(interaction);
        
    } else {
//        [self.collectionView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

- (PKInteractionHandler)interactionHandlerForIndexPath:(NSIndexPath *)indexPath
{
    id <PKItemProtocol> item = (id <PKItemProtocol>)[self rowAtIndexPath:indexPath];
    id <PKSectionProtocol> section = (id <PKSectionProtocol>)[self sectionAtIndex:indexPath.section];
    
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

@end
