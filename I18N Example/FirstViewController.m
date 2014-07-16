//
//  FirstViewController.m
//  I18N Example
//
//  Created by Daniel Schneller on 09/07/14.
//  Copyright (c) 2014 Daniel Schneller. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (strong, nonatomic) IBOutlet UILabel *clickLabel;
@property (strong, nonatomic) IBOutlet UIButton *resetButton;
@property (assign, nonatomic) NSUInteger clickCount;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [self.resetButton setTitle:NSLocalizedString(@"reset.counter.button.title", @"Button title for Reset Counter action button")
                      forState:UIControlStateNormal];
}

- (void)setClickCount:(NSUInteger)clickCount {
    _clickCount = clickCount;
    [self updateLabel];
}

- (void)viewWillAppear:(BOOL)animated {
    self.clickCount = 0;
}

- (IBAction)clickButton:(id)sender {
    self.clickCount++;
}

- (IBAction)resetCounter:(id)sender {
    self.clickCount = 0;
}

- (void) updateLabel {
    self.clickLabel.text = [NSString stringWithFormat:NSLocalizedString(@"click.counter.label", @"Param 1: Current Click Count."), self.clickCount];
}

@end
