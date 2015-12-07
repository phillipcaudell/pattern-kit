//
//  PKItemViewManager.h
//  ShitKit
//
//  Created by Phillip Caudell on 26/10/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PKSectionProtocol;
@protocol PKItemProtocol;

@interface PKItemViewPattern : NSObject

@property (nonatomic, strong) NSArray *sections;

- (id <PKSectionProtocol>)sectionAtIndex:(NSInteger)index;
- (id <PKItemProtocol>)rowAtIndexPath:(NSIndexPath *)indexPath;
- (void)addSection:(id <PKSectionProtocol>)section;
- (void)registerCellClass:(Class)cellClass;
- (BOOL)isCellClassRegistered:(Class)cellClass;
- (Class)cellClassForIndexPath:(NSIndexPath *)indexPath;
- (id)dequeueProxyCellForIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)automaticCellHeightForIndexPath:(NSIndexPath *)indexPath;

@end
