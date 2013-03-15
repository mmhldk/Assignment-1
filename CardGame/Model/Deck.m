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
-(void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    }else{
        [self.cards addObject:card];
    }
}

-(Card *)drawRandomCard
{
    Card *randomCard = nil;
    
    if(self.cards.count){
        unsigned index = arc4random() % self.cards.count;
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}

-(Card *)drawNumericCard
{
    Card *numericCard = nil;
    
    if(self.cards.count){
        numericCard = self.cards[0];
        [self.cards removeObjectAtIndex:0];
    }
    return numericCard;
}

-(UIImage*)cardFrontsideBackgroundImage
{
    if(!_cardFrontsideBackgroundImage){
        _cardFrontsideBackgroundImage = [UIImage imageNamed:@"BacksideCard2.png"];
    }
    return _cardFrontsideBackgroundImage;
}

-(UIImage*)cardBacksideBackgroundImage
{
    if(!_cardBacksideBackgroundImage){
        _cardBacksideBackgroundImage = [UIImage imageNamed:@"BacksideCard.png"];
    }
    return _cardBacksideBackgroundImage;
}
@end
