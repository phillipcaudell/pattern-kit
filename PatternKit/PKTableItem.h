//
//  PKTableViewItem.h
//  PatternKit
//
//  Created by Phillip Caudell on 08/12/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import <PatternKit/PatternKit.h>

@interface PKTableItem : PKItem <PKTableItemProtocol>

@property (nonatomic, assign) UITableViewCellAccessoryType accessoryType;

+ (instancetype)tableItemWithTitle:(NSString *)title;
+ (instancetype)tableItemWithTitle:(NSString *)title subtitle:(NSString *)subtitle image:(UIImage *)image;

@end
