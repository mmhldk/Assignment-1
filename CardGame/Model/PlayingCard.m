//
//  PlayingCard.m
//  CardGame
//
//  Created by Martin on 19/02/13.
//  Copyright (c) 2013 Martin. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

//Method to match cards and give points to the player
//Takes all the other cards and compare them with the first card choosen. 
-(int)match:(NSArray *)otherCards with:(NSUInteger)gameMode
{
    int score = 0;
    int cardSuitCounter = 1;
    int cardRankCounter = 1;
    
    //Run throught all the cards
    for(PlayingCard *otherCard in otherCards){
        //compare the 2 cards by suit
        if([otherCard.suit isEqualToString:self.suit]){
            cardSuitCounter++;
            score += 1;
        }//compare the 2 cards by rank
        else if (otherCard.rank == self.rank){
            score += 4;
            cardRankCounter++;
        }
    }
    //Checks if all the cards are equals 
    if(gameMode == cardRankCounter || gameMode == cardSuitCounter){
        return score;
    }
    return 0;
}



// Method that returns the suit and the rank in a string
-(NSString *)contents{
    NSArray *rankString = [PlayingCard rankStrings];
    return [rankString[self.rank] stringByAppendingString:self.suit];
}

//Adding the variable because we are creating the getter and setter.
@synthesize suit = _suit;

+ (NSArray *)validSuits{
    return @[@"♥",@"♦",@"♠",@"♣"];
}
-(void)setSuit:(NSString *)suit{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
    
}
-(NSString *)suit{
    return _suit ? _suit : @"?";
}

+(NSArray *)rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}
+ (NSUInteger)maxRank {
    return [PlayingCard rankStrings].count-1;
}

-(void)setRank:(NSUInteger)rank{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}
@end
