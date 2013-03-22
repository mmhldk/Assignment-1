//
//  Deck.m
//  CardGame
//
//  Created by Martin on 19/02/13.
//  Copyright (c) 2013 Martin. All rights reserved.
//

#import "Deck.h"
@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards;
@end


@implementation Deck

-(NSMutableArray *)cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}
//add cards to the deck
-(void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop) {
        //add the cards to the top(first in the array)
        [self.cards insertObject:card atIndex:0];
    }else{
        //add the cards to the buttom(last in the array)
        [self.cards addObject:card];
    }
}

-(Card *)drawRandomCard
{
    Card *randomCard = nil;
    
    if(self.cards.count){
        //Select a random place in the deck
        unsigned index = arc4random() % self.cards.count;
        //draw the card from the deck
        randomCard = self.cards[index];
        //Remove the card from the deck
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}
//Draw cards in a numeric order from the deck
-(Card *)drawNumericCard
{
    Card *numericCard = nil;
    //Draw the first card from the deck
    if(self.cards.count){
        numericCard = self.cards[0];
        //remove the card from the deck
        [self.cards removeObjectAtIndex:0];
    }
    return numericCard;
}

-(NSString*)cardFrontsideBackgroundImage
{
    if(!_cardFrontsideBackgroundImage){
        _cardFrontsideBackgroundImage = @"BacksideCard2.png";
    }
    return _cardFrontsideBackgroundImage;
}

-(NSString*)cardBacksideBackgroundImage
{
    if(!_cardBacksideBackgroundImage){
        _cardBacksideBackgroundImage = @"BacksideCard.png";
    }
    return _cardBacksideBackgroundImage;
}
@end
