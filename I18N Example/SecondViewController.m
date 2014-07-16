//
//  SecondViewController.m
//  I18N Example
//
//  Created by Daniel Schneller on 09/07/14.
//  Copyright (c) 2014 Daniel Schneller. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *quarterLabel;
@property (copy,   nonatomic) NSString* quarterTemplate;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [self updateFormats];
}

- (void)viewWillAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localeDidChange:) name:NSCurrentLocaleDidChangeNotification object:nil];
    [self updateDateLabels];
}

- (void)viewDidDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) updateDateLabels {
    NSDateFormatter* qf = [[NSDateFormatter alloc] init];
    qf.dateFormat = self.quarterTemplate;
    self.quarterLabel.text = [qf stringFromDate:[NSDate date]];

    self.dateLabel.text = [NSDateFormatter localizedStringFromDate:[NSDate date] dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterLongStyle];
}

- (void) updateFormats {
    NSLocale* locale = [NSLocale autoupdatingCurrentLocale];
    NSString* format = [NSDateFormatter dateFormatFromTemplate:@"u QQQQ" options:0 locale:locale];

    self.quarterTemplate = format;
}

- (void)localeDidChange:(NSNotification*)notification {
    [self updateFormats];
    [self updateDateLabels];
}

@end
