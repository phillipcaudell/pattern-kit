//
//  PKSectionProtocol.h
//  ShitKit
//
//  Created by Phillip Caudell on 26/10/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PKInteraction.h"

@protocol PKSectionProtocol <NSObject>

@optional
- (NSArray *)sectionItems;
- (PKInteractionHandler)sectionInteractionHandler;

@end
