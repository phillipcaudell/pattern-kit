//
//  PKFlowLayoutCollectionViewPattern.m
//  PatternKit
//
//  Created by Phillip Caudell on 09/12/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import "PKGridCollectionViewPattern.h"

@implementation PKGridCollectionViewPattern

- (instancetype)init
{
    if (self = [super init]) {
        
        self.collectionViewLayout = [[UICollectionViewFlowLayout alloc] init];
    }
    
    return self;
}

@end