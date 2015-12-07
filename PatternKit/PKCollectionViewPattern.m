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

@interface PKCollectionViewPattern () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end

@implementation PKCollectionViewPattern

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView
{
    if (self = [super init]) {
        
        _collectionView = collectionView;
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
    }
    
    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
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

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    id <PKItemProtocol> item = (id <PKItemProtocol>)[self rowAtIndexPath:indexPath];
    
    if ([item respondsToSelector:@selector(itemSizeWithConstraintSize:)]) {
        
        CGSize constaintSize = CGSizeMake(self.collectionView.bounds.size.width, MAXFLOAT);
        
        return [item itemSizeWithConstraintSize:constaintSize];
        
    } else {
        
        return CGSizeMake(5, 5);
    }
}

@end
