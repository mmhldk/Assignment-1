//
//  Card.h
//  CardGame
//
//  Created by Martin on 19/02/13.
//  Copyright (c) 2013 Martin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic)NSString *contents;

@property (nonatomic, getter = isFaceUp) BOOL faceUp; //If the card has face up or down
@property (nonatomic, getter = isUnplayable) BOOL unplayable; //If the card is out of the came

-(int)match:(NSArray *)otherCards; //Match all the cards from the array

@end
