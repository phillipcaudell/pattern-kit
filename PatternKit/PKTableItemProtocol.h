//
//  PKTableItemProtocol.h
//  ShitKit
//
//  Created by Phillip Caudell on 26/10/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import "PKItemProtocol.h"

@protocol PKTableItemProtocol <PKItemProtocol>

@optional
- (UIEdgeInsets)itemEdgeInsets;
- (UITableViewCellAccessoryType)itemAccessoryType;

@end
