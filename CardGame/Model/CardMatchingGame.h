//
//  CardMatchingGame.h
//  CardGame
//
//  Created by Martin on 20/02/13.
//  Copyright (c) 2013 Martin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

// designated initializer
-(id)initWithCardCount:(NSUInteger)count
             usingDeck:(Deck *)deck;

-(void)flipCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;
-(void)reset;

@property(nonatomic, getter = isStarted)BOOL started; // a bool which define the if the game is started
@property(readonly,nonatomic)int score; // the score that the user has achieved in the game
@property(strong,nonatomic)NSString *status; // which cards that are flip or match
@property(nonatomic)NSUInteger numbercOfCardMatchMode; // how many card that has to be turn to make a match

@end
