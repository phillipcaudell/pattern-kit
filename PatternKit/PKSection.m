//
//  PKSection.m
//  ShitKit
//
//  Created by Phillip Caudell on 06/11/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import "PKSection.h"

@implementation PKSection

+ (instancetype)sectionWithItems:(NSArray *)items
{
    PKSection *section = [PKSection new];
    section.items = items;
    
    return section;
}

- (NSArray *)sectionItems
{
    return self.items;
}

- (PKInteractionHandler)sectionInteractionHandler
{
    return self.interactionHandler;
}

@end
