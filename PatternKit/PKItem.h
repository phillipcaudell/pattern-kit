//
//  PKTableItem.h
//  ShitKit
//
//  Created by Phillip Caudell on 26/10/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKTableItemProtocol.h"
#import "PKItemProtocol.h"

@interface PKItem : NSObject <PKItemProtocol>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) PKInteractionHandler interactionHandler;

+ (instancetype)itemWithTitle:(NSString *)title;
+ (instancetype)itemWithTitle:(NSString *)title subtitle:(NSString *)subtitle image:(UIImage *)image;
- (void)setInteractionHandler:(PKInteractionHandler)interactionHandler;

@end
