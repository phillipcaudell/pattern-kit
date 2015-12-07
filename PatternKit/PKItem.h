//
//  PKTableItem.h
//  ShitKit
//
//  Created by Phillip Caudell on 26/10/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKTableItemProtocol.h"

@interface PKItem : NSObject <PKTableItemProtocol>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) UIImage *image;

+ (instancetype)rowWithTitle:(NSString *)title;
+ (instancetype)rowWithTitle:(NSString *)title subtitle:(NSString *)subtitle image:(UIImage *)image;

@end
