//
//  UglyTableViewCell.m
//  PatternKitDemo
//
//  Created by Phillip Caudell on 08/12/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import "UglyTableViewCell.h"

@implementation UglyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor greenColor];
    }
    
    return self;
}

@end

@implementation UglyTableItem

- (Class)itemCellClass
{
    return [UglyTableViewCell class];
}

@end