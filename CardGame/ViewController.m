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
    self.game.numbercOfCardMatchMode = sender.selectedSegmentIndex + 2;

}


-(void)updateUI{
    //Updating all the buttons in the view one by one.
    for (UIButton *cardButton in self.cardButtons) {
        //Retreiving the card from thh button
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        //Setting the content the card will show when the button are seleted.
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        //Setting the content the card will show when the card is matched with an other card.
        [cardButton setTitle:card.contents forState:UIControlStateSelected|
         UIControlStateDisabled];
        //Setting the back and front of the button card.
        [cardButton setBackgroundImage:[UIImage imageNamed:self.deck.cardBacksideBackgroundImage] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[UIImage imageNamed:self.deck.cardFrontsideBackgroundImage] forState:UIControlStateSelected];
        
        //Set which side of the card is upward.
        cardButton.selected = card.isFaceUp;
        //Set if the card is out of the game
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = (card.isUnplayable ? 0.3 : 1);
    }
    
    //Set the the shift button to enable or diable accourting to the game is started or not.
    self.gameModeSelector.enabled = !self.game.isStarted;
    //Setting the scoring and status label.
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    self.statusLabel.text = self.game.status;
    
}
- (IBAction)dealNew:(UIButton *)sender {
    //When pressing the button the game is reset and the view are updated.
    [self.game reset];
    [self updateUI];
}

-(void)setFlipCount:(NSUInteger)flipCount{
    //Setting the flipcounter and updating the flipCounter label in the view
    _flipCount = flipCount;
    self.flipLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];

    
}
- (IBAction)flipCard:(UIButton *)sender {
    //Flipping a card
    //setting the flipcount + 1
    self.flipCount++;
    //Sending the card from the button to the model for playing the game. 
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    //redrawing the view.
    [self updateUI];
     
}

@end
