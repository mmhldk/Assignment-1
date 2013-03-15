//
//  CardMatchingGame.m
//  CardGame
//
//  Created by Martin on 20/02/13.
//  Copyright (c) 2013 Martin. All rights reserved.
//

#import "CardMatchingGame.h"
#import "PlayingCardDeck.h"

@interface CardMatchingGame()
@property(readwrite, nonatomic)int score;
@property(nonatomic)NSUInteger numberOfCards;
@property(strong,nonatomic)NSMutableArray *cards; //of Card
@end
@implementation CardMatchingGame


-(NSMutableArray *)cards
{
    if(!_cards){
        _cards = [[NSMutableArray alloc]init];
    }
    return _cards;
}

-(NSUInteger)numbercOfCardMatchMode{
    if (_numbercOfCardMatchMode == 0) {
        _numbercOfCardMatchMode = 2;
    }
    return _numbercOfCardMatchMode;
}

-(void)flipCardAtIndex:(NSUInteger)index{
    if (!self.isStarted) {
        self.started = !self.isStarted;
    }
    Card *card = [self cardAtIndex:index];

    if(card && !card.isUnplayable){
        NSMutableArray *scoreCoutingCards = [[NSMutableArray alloc] initWithObjects:nil];
        
        if(!card.isFaceUp){
            self.status = [NSString stringWithFormat:@"Flipped up %@", card.contents];

            for(Card *otherCard in self.cards){
                if(otherCard.isFaceUp && !otherCard.isUnplayable){
                    [scoreCoutingCards addObject:otherCard];
                }
            }
                  
            if([scoreCoutingCards count] == self.numbercOfCardMatchMode-1){
                int matchScore = [card match:scoreCoutingCards with:self.numbercOfCardMatchMode];
                NSString *statusTemp = @"";
                if(matchScore){
                    for (Card *scoreCard in scoreCoutingCards) {
                        scoreCard.unplayable = YES;
                        statusTemp = [NSString stringWithFormat:@"%@& %@ ", statusTemp, scoreCard.contents];
                    }
                    card.unplayable = YES;
                    self.score += matchScore * 4;
                    self.status = [NSString stringWithFormat:@"Mached %@ %@", card.contents, statusTemp];
                }else{
                    for (Card *scoreCard in scoreCoutingCards) {
                        scoreCard.faceUp = NO;
                        statusTemp = [NSString stringWithFormat:@"%@& %@ ", statusTemp, scoreCard.contents];
                    }
                    self.score -= 2;
                    self.status = [NSString stringWithFormat:@"%@ %@don't match", card.contents, statusTemp];
                }
            }
            card.faceUp = !card.isFaceUp;
            self.score -= 1;
        }else{
            for(Card *otherCard in self.cards){
                if(otherCard.isFaceUp && !otherCard.isUnplayable){
                    otherCard.faceUp = NO;
                }
            }
        }
    }
}

-(Card *)cardAtIndex:(NSUInteger)index{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

-(void)reset{
    self.started = !self.isStarted;
    self.status = @"New game";
    self.score = 0;
    [self dealCard];
    
}

-(void)dealCard{
    Deck *deck = [[PlayingCardDeck alloc] init];
    for (int i = 0; i < self.numberOfCards; i++){
        Card *card = [deck drawRandomCard];
        if(card) {
            self.cards[i] = card;
        }else{
            break;
        }
    }
}
-(id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    self.numberOfCards = count;
    
    if(self){
        [self dealCard];
    }
    return self;
}
@end
