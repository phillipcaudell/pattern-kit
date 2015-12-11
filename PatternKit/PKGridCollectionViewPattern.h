//
//  PKFlowLayoutCollectionViewPattern.h
//  PatternKit
//
//  Created by Phillip Caudell on 09/12/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import "PKCollectionViewPattern.h"

@interface PKGridCollectionViewPattern : PKCollectionViewPattern

@property (nonatomic, assign) NSInteger numberOfItemsPerRow;
@property (nonatomic, assign) UIEdgeInsets itemSpacing;

@end
