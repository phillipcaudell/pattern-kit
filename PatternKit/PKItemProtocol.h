//
//  PKItemProtocol.h
//  ShitKit
//
//  Created by Phillip Caudell on 26/10/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PKInteraction.h"

@protocol PKItemProtocol <NSObject>

@optional
- (NSString *)itemTitle;
- (NSString *)itemSubtitle;
- (UIImage *)itemImage;
- (Class)itemCellClass;
- (PKInteractionHandler)itemInteractionHandler;
- (void)configureItemCell:(id)cell;
- (CGSize)itemSizeWithConstraintSize:(CGSize)contraintSize;

@end
