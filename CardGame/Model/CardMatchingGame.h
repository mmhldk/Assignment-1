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

@property(nonatomic, getter = isStarted)BOOL started;
@property(readonly,nonatomic)int score;
@property(strong,nonatomic)NSString *status;
@property(nonatomic)NSUInteger numbercOfCardMatchMode;
@property(nonatomic, strong)UIImage *cardBackgroundImage;

@end
