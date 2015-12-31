//
//  PKTableSectionProtocol.h
//  ShitKit
//
//  Created by Phillip Caudell on 26/10/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import "PKSectionProtocol.h"

@protocol PKTableSectionProtocol <PKSectionProtocol>

@optional
- (NSString *)sectionHeaderTitle;
- (NSString *)sectionFooterTitle;

@end
