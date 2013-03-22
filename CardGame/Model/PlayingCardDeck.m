//
//  PlayingCardDeck.m
//  CardGame
//
//  Created by Martin on 20/02/13.
//  Copyright (c) 2013 Martin. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

-(id)init{
    //Creating a playingcard deck with all the suits and ranks
    self = [super init];
    if (self) {
        //runs through all the suits
        for (NSString *suit in [PlayingCard validSuits]) {
            //runs through all the rank
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                //Creating a card and sets it suit and rank
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                //adding the card to the deck at the top
                [self addCard:card atTop:YES];
            }
        } }
    return self;
}

@end
