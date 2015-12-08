//
//  PKCollectionViewCell.h
//  PatternKit
//
//  Created by Phillip Caudell on 08/12/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKCollectionViewCell : UICollectionViewCell

@property (readonly, strong) UILabel *textLabel;
@property (readonly, strong) UILabel *detailTextLabel;
@property (readonly, strong) UIImageView *imageView;

@end
