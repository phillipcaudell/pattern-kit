//
//  PKInteraction.h
//  ShitKit
//
//  Created by Phillip Caudell on 26/10/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import <UIKit/UIKIt.h>

@interface PKInteraction : NSObject

typedef NS_OPTIONS(NSInteger, PKInteractionType) {
    PKInteractionTypePrimary = 0,
    PKInteractionTypeSecondary = 1
};

typedef void (^PKInteractionHandler)(PKInteraction *interaction);

@property (nonatomic, strong) id item;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) UIView *view;
@property (nonatomic, assign) PKInteractionType type;

@end
