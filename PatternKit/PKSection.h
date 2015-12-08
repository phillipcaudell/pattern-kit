//
//  PKSection.h
//  ShitKit
//
//  Created by Phillip Caudell on 06/11/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PKInteraction.h"
#import "PKSectionProtocol.h"

@interface PKSection : NSObject <PKSectionProtocol>

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, assign) PKInteractionHandler interactionHandler;

+ (instancetype)sectionWithItems:(NSArray *)items;
- (void)setInteractionHandler:(PKInteractionHandler)interactionHandler;

@end
