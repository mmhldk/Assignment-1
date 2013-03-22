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

@property(strong, nonatomic)NSString *suit; // the suit the card have
@property(nonatomic) NSUInteger rank; // the rank the card have

+ (NSArray *)validSuits; //all the suits that can accur on a card
+ (NSUInteger)maxRank; //the highest rank that a card can have.

@end
