//
//  PKTableSection.h
//  ShitKit
//
//  Created by Phillip Caudell on 26/10/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import "PKSection.h"
#import "PKTableSectionProtocol.h"

@interface PKTableSection : PKSection <PKTableSectionProtocol>

@property (nonatomic, strong) NSString *headerTitle;
@property (nonatomic, strong) NSString *footerTitle;

+ (instancetype)tableSectionWithHeaderTitle:(NSString *)headerTitle items:(NSArray *)items footerTitle:(NSString *)footerTitle interactionHandler:(PKInteractionHandler)interactionHandler;
+ (NSArray *)sortedTableSectionsWithItems:(NSArray *)items keyPath:(NSString *)keyPath ascending:(BOOL)ascending interactionHandler:(PKInteractionHandler)interactionHandler;


@end
