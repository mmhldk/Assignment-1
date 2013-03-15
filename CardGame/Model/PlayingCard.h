//
//  PlayingCard.h
//  CardGame
//
//  Created by Martin on 19/02/13.
//  Copyright (c) 2013 Martin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property(strong, nonatomic)NSString *suit;
@property(nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
