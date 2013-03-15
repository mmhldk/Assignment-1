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

-(Card *)drawRandomCard;
-(Card *)drawNumericCard;

@property (nonatomic, strong)UIImage *cardBacksideBackgroundImage;
@property (nonatomic, strong)UIImage *cardFrontsideBackgroundImage;


@end
