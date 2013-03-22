//
//  Deck.h
//  CardGame
//
//  Created by Martin on 19/02/13.
//  Copyright (c) 2013 Martin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *) card atTop:(BOOL)atTop;

-(Card *)drawRandomCard; //Draw a random card from the deck
-(Card *)drawNumericCard;//Draw cards in a numeric order from the deck 

@property (nonatomic, strong)NSString *cardBacksideBackgroundImage; //name on the backside image of the cards
@property (nonatomic, strong)NSString *cardFrontsideBackgroundImage; //name on the frontside image of the cards



@end
