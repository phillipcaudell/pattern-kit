//
//  PKCollectionViewManager.h
//  ShitKit
//
//  Created by Phillip Caudell on 26/10/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import "PKItemViewPattern.h"

@interface PKCollectionViewPattern : PKItemViewPattern

@property (readonly, weak) UICollectionView *collectionView;

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView;

@end
