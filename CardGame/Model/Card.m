//
//  Card.m
//  CardGame
//
//  Created by Martin on 19/02/13.
//  Copyright (c) 2013 Martin. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int)match:(NSArray *)otherCards with:(NSUInteger)gameMode{
    int score = 0;
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1; 
        }
    }
    return score;
}

@end
