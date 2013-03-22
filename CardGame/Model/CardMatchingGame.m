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
@property(readwrite, nonatomic)int score; // the score that the user has achieved in the game
@property(nonatomic)NSUInteger numberOfCards; // the number of cards that we want to play with.
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
        //Setting the default value number Of Card that has to accour to make Match
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
        //init the array for the cards to compare  
        NSMutableArray *scoreCoutingCards = [[NSMutableArray alloc] initWithObjects:nil];
        
        if(!card.isFaceUp){
            //Set the status to which card that are flipped.
            self.status = [NSString stringWithFormat:@"Flipped up %@", card.contents];
            
            //Looking at all the card in the game and adds the one with the face up to the scoreCoutingCards array
            for(Card *otherCard in self.cards){
                if(otherCard.isFaceUp && !otherCard.isUnplayable){
                    [scoreCoutingCards addObject:otherCard];
                }
            }
            
            //if the number of the cards with their face up match the number Of Card that has to accour to make Match
            //then we are mathing them
            if([scoreCoutingCards count] == self.numbercOfCardMatchMode-1){
                int matchScore = [card match:scoreCoutingCards];
                if(matchScore){
                    //If there are a match the cards are made unplable and the score rewarded are added to the game score
                    //and the status is set with which card are matched.
                    card.unplayable = YES;
                    self.score += matchScore * 4;
                    self.status = [NSString stringWithFormat:@"Mached %@ %@",
                                   card.contents,
                                   [self statusCardsContent:scoreCoutingCards isCardUnplayable:YES]];
                }else{
                    //If there aren't a match the penalty are added to the game score
                    //and the status is set with which card that didn't match.
                    self.score -= 2;
                    self.status = [NSString stringWithFormat:@"%@ %@don't match",
                                   card.contents,
                                   [self statusCardsContent:scoreCoutingCards isCardUnplayable:NO]];
                }
            }
            //The current card are set to the oppersit as it is in the current state.
            card.faceUp = !card.isFaceUp;
            //The card flip penalty are added to the game score
            self.score -= 1;
        }else{
            //All the cards are turn with face down.
            for(Card *otherCard in self.cards){
                if(otherCard.isFaceUp && !otherCard.isUnplayable){
                    otherCard.faceUp = NO;
                }
            }
        }
    }
}

-(NSString *)statusCardsContent:(NSArray*)cards isCardUnplayable:(BOOL)unplayable
{
    //takes all the cards and sets them with out of the game are in the game
    //and creates a string with which cards that was treated. 
    NSString *status = @"";
    for (Card *scoreCard in cards) {
        scoreCard.unplayable = unplayable;
        scoreCard.faceUp = unplayable;
        status = [NSString stringWithFormat:@"%@& %@ ", status, scoreCard.contents];
    }
    return status;
}
-(Card *)cardAtIndex:(NSUInteger)index{
    //Finds which card that correspond an index.
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

-(void)reset{
    //resetting all the settings in the game.
    //and deals new cards
    self.started = !self.isStarted;
    self.status = @"New game";
    self.score = 0;
    [self dealCard];
    
}

-(void)dealCard{
    //Dealing card.
    //Creating a playingcard deck and selects a certain amount
    //of random cards and add them to the game
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
