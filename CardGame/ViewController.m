//
//  ViewController.m
//  CardGame
//
//  Created by Martin on 19/02/13.
//  Copyright (c) 2013 Martin. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCard.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"


@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *flipLabel;
@property (nonatomic) NSUInteger flipCount;
@property (strong,nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameModeSelector;
@property (strong,nonatomic)PlayingCardDeck *deck;


@end

@implementation ViewController

-(PlayingCardDeck*)deck
{
    if(!_deck){
        _deck = [[PlayingCardDeck alloc] init];
    }
    return _deck;
}
-(CardMatchingGame *)game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count] usingDeck:self.deck];
    }
    return _game;
}

-(void)setCardButtons:(NSArray *)cardButtons{
    _cardButtons = cardButtons;
    [self updateUI];
}
- (IBAction)changeGameMode:(UISegmentedControl *)sender {
    NSUInteger index = sender.selectedSegmentIndex;
    self.game.numbercOfCardMatchMode = index + 2;

}


-(void)updateUI{
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|
         UIControlStateDisabled];
        [cardButton setBackgroundImage:self.deck.cardBacksideBackgroundImage forState:UIControlStateNormal];
        [cardButton setBackgroundImage:self.deck.cardFrontsideBackgroundImage forState:UIControlStateSelected];
        
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = (card.isUnplayable ? 0.3 : 1);
    }
   
    self.gameModeSelector.enabled = !self.game.isStarted;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    self.statusLabel.text = self.game.status;
    
}
- (IBAction)dealNew:(UIButton *)sender {
    [self.game reset];
    [self updateUI];
}

-(void)setFlipCount:(NSUInteger)flipCount{
    _flipCount = flipCount;
    self.flipLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];

    
}
- (IBAction)flipCard:(UIButton *)sender {
    self.flipCount++;
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    [self updateUI];
     
}

@end
