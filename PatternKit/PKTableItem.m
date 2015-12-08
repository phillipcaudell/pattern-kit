//
//  PKTableViewItem.m
//  PatternKit
//
//  Created by Phillip Caudell on 08/12/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import "PKTableItem.h"

@implementation PKTableItem

+ (instancetype)tableItemWithTitle:(NSString *)title
{
    return [PKTableItem tableItemWithTitle:title subtitle:nil image:nil];
}

+ (instancetype)tableItemWithTitle:(NSString *)title subtitle:(NSString *)subtitle image:(UIImage *)image
{
    PKTableItem *item = [PKTableItem new];
    item.title = title;
    item.subtitle = subtitle;
    item.image = image;
    
    return item;
}

- (UITableViewCellAccessoryType)itemAccessoryType
{
    return self.accessoryType;
}

@end
