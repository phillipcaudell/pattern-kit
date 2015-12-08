//
//  DemoCollectionViewController.m
//  PatternKitDemo
//
//  Created by Phillip Caudell on 08/12/2015.
//  Copyright © 2015 3 SIDED CUBE. All rights reserved.
//

#import "DemoCollectionViewController.h"

@import PatternKit;

@interface DemoCollectionViewController ()

@property (readonly, strong) PKCollectionViewPattern *collectionViewPattern;

@end

@implementation DemoCollectionViewController

- (instancetype)init
{
    UICollectionViewFlowLayout *collectionViewLayout = [UICollectionViewFlowLayout new];
    
    if (self = [super initWithCollectionViewLayout:collectionViewLayout]) {
        
        self.title = @"Collection View";
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _collectionViewPattern = [[PKCollectionViewPattern alloc] initWithCollectionView:self.collectionView];

    PKItem *testItem = [PKItem new];
    testItem.title = @"Lol";
    
    PKItem *testItem2 = [PKItem new];

    PKSection *section = [PKSection sectionWithItems:@[testItem, testItem2]];
    
    self.collectionViewPattern.sections = @[section];
}

@end
