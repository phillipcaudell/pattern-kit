//
//  PKTableItem.m
//  ShitKit
//
//  Created by Phillip Caudell on 26/10/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import "PKItem.h"

@implementation PKItem

+ (instancetype)itemWithTitle:(NSString *)title
{
    return [PKItem itemWithTitle:title subtitle:nil image:nil];
}

+ (instancetype)itemWithTitle:(NSString *)title subtitle:(NSString *)subtitle image:(UIImage *)image
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

- (PKInteractionHandler)itemInteractionHandler
{
    return self.interactionHandler;
}

- (void)configureItemCell:(id)cell
{
    if ([cell respondsToSelector:@selector(textLabel)]) {
        [[cell textLabel] setText:self.title];
    }
    
    if ([cell respondsToSelector:@selector(detailTextLabel)]) {
        [[cell detailTextLabel] setText:self.subtitle];
    }
    
    if ([cell respondsToSelector:@selector(imageView)]) {
        [[cell imageView] setImage:self.image];
    }
}

@end
