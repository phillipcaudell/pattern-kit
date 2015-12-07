//
//  PKTableItem.m
//  ShitKit
//
//  Created by Phillip Caudell on 26/10/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import "PKItem.h"

@implementation PKItem

+ (instancetype)rowWithTitle:(NSString *)title
{
    return [PKItem rowWithTitle:title subtitle:nil image:nil];
}

+ (instancetype)rowWithTitle:(NSString *)title subtitle:(NSString *)subtitle image:(UIImage *)image
{
    PKItem *item = [PKItem new];
    item.title = title;
    item.subtitle = subtitle;
    item.image = image;
    
    return item;
}

- (NSString *)itemTitle
{
    return self.title;
}

- (NSString *)itemSubtitle
{
    return self.subtitle;
}

- (UIImage *)itemImage
{
    return self.image;
}

@end
