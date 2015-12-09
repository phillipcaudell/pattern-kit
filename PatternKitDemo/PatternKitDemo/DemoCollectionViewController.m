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
    _collectionViewPattern = [PKGridCollectionViewPattern new];
    
    if (self = [super initWithCollectionViewLayout:self.collectionViewPattern.collectionViewLayout]) {
        
        self.collectionViewPattern.collectionView = self.collectionView;
        self.title = @"Collection View";
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    PKItem *testItem = [PKItem new];
    PKItem *testItem2 = [PKItem new];

    PKSection *section = [PKSection sectionWithItems:@[testItem, testItem2]];
    
    self.collectionViewPattern.sections = @[section];
    
    [self.collectionView reloadData];
    

}

@end
