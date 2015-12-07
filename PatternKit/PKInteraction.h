//
//  PKInteraction.h
//  ShitKit
//
//  Created by Phillip Caudell on 26/10/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import <UIKit/UIKIt.h>

@interface PKInteraction : NSObject

typedef void (^PKInteractionHandler)(PKInteraction *interaction);

@property (nonatomic, strong) id item;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) UIView *view;

@end
