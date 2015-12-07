//
//  PKTableSection.m
//  ShitKit
//
//  Created by Phillip Caudell on 26/10/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import "PKTableSection.h"

@implementation PKTableSection

+ (instancetype)tableSectionWithHeaderTitle:(NSString *)headerTitle items:(NSArray *)items footerTitle:(NSString *)footerTitle interactionHandler:(PKInteractionHandler)interactionHandler
{
    PKTableSection *section = [PKTableSection new];
    section.headerTitle = headerTitle;
    section.footerTitle = footerTitle;
    section.items = items;
    section.interactionHandler = interactionHandler;
    
    return section;
}

- (NSString *)sectionHeaderTitle
{
    return self.headerTitle;
}

- (NSString *)sectionFooterTitle
{
    return self.footerTitle;
}

@end
