//
//  PKCollectionViewCell.m
//  PatternKit
//
//  Created by Phillip Caudell on 08/12/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import "PKCollectionViewCell.h"

@implementation PKCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        _textLabel = [UILabel new];
        [self.contentView addSubview:self.textLabel];
        
        _detailTextLabel = [UILabel new];
        [self.contentView addSubview:self.detailTextLabel];
        
        _imageView = [UIImageView new];
        [self.contentView addSubview:self.imageView];
        
        self.backgroundColor = [UIColor greenColor];
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.textLabel.frame = self.bounds;
    self.detailTextLabel.frame = self.bounds;
}

@end
