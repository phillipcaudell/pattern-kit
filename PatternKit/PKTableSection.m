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

+ (NSArray *)sortedTableSectionsWithItems:(NSArray *)items keyPath:(NSString *)keyPath ascending:(BOOL)ascending interactionHandler:(PKInteractionHandler)interactionHandler
{
    static NSString *miscLetter = @"#";
    NSMutableDictionary *sortedDictionary = [NSMutableDictionary dictionary];
    NSCharacterSet *alphabetCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"];

    // Breakout names into sorted dictionary
    [items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        NSString *name = [obj valueForKeyPath:keyPath];
        NSString *firstLetter = [[name substringToIndex:1] uppercaseString];
        
        // If it's not from the alphabet, sort into "other" category
        NSRange rangeOfAlphabetCharacter = [firstLetter rangeOfCharacterFromSet:alphabetCharacterSet];
        if (rangeOfAlphabetCharacter.location == NSNotFound) {
            firstLetter = miscLetter;
        }
        
        NSMutableArray *letters = sortedDictionary[firstLetter];
        
        if (!letters) {
            letters = [NSMutableArray array];
            sortedDictionary[firstLetter] = letters;
        }
        
        [letters addObject:obj];
    }];
    
    NSMutableArray *sections = [NSMutableArray array];
    
    // Make sure we're alphabetical
    NSMutableArray *keys = [[sortedDictionary.allKeys sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:nil ascending:ascending]]] mutableCopy];
    
    // Make sure misc items such as numbers and other characters appear last
    [keys removeObject:miscLetter];
    [keys addObject:miscLetter];
    
    // Create section for each letter
    [keys enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL * _Nonnull stop) {
       
        PKTableSection *section = [PKTableSection tableSectionWithHeaderTitle:key items:sortedDictionary[key] footerTitle:nil interactionHandler:interactionHandler];
        [sections addObject:section];
    }];
    
    return sections;
}

@end
