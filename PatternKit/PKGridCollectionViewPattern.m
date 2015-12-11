//
//  PKFlowLayoutCollectionViewPattern.m
//  PatternKit
//
//  Created by Phillip Caudell on 09/12/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import "PKGridCollectionViewPattern.h"
#import "PKTableItemProtocol.h"

@interface PKGridCollectionViewPattern () <UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionViewFlowLayout *collectionViewLayout;

@end

@implementation PKGridCollectionViewPattern

@dynamic collectionViewLayout;

- (instancetype)init
{
    if (self = [super init]) {
        
        self.collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
        
        // Defaults
        self.collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.numberOfItemsPerRow = 2;
        self.itemSpacing = UIEdgeInsetsMake(5, 5, 5, 5);
    }
    
    return self;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    id <PKItemProtocol> item = (id <PKItemProtocol>)[self rowAtIndexPath:indexPath];
    
    if ([item respondsToSelector:@selector(itemSizeWithConstraintSize:)]) {
        
        CGSize constaintSize = CGSizeMake(self.collectionView.bounds.size.width, MAXFLOAT);
        
        return [item itemSizeWithConstraintSize:constaintSize];
        
    } else {
        
        NSInteger width = self.collectionView.bounds.size.width / self.numberOfItemsPerRow - ((self.itemSpacing.right + self.itemSpacing.left) / self.numberOfItemsPerRow);
        
        return CGSizeMake(width, width);
    }
}

// Horizontal
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

// Vertical
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return self.itemSpacing.top;
}

@end