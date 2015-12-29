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

@property (readonly, strong) PKGridCollectionViewPattern *collectionViewPattern;

@end

@implementation DemoCollectionViewController

- (instancetype)init
{
    _collectionViewPattern = [PKGridCollectionViewPattern new];
    
    if (self = [super initWithCollectionViewLayout:self.collectionViewPattern.collectionViewLayout]) {
        
        self.collectionViewPattern.collectionView = self.collectionView;
        self.collectionViewPattern.numberOfItemsPerRow = 3;
        
        self.title = @"Collection View";
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];

    PKItem *testItem = [PKItem new];
    PKItem *testItem2 = [PKItem new];
    PKItem *testItem3 = [PKItem new];
    PKItem *testItem4 = [PKItem new];
    PKItem *testItem5 = [PKItem new];
    PKItem *testItem6 = [PKItem new];
    PKItem *testItem7 = [PKItem new];

    PKSection *section = [PKSection sectionWithItems:@[testItem, testItem2, testItem3, testItem4, testItem5, testItem6, testItem7]];
    
    self.collectionViewPattern.sections = @[section];
    
    [self.collectionView reloadData];
    

}

@end
