//
//  ViewController.m
//  TwitterShare
//
//  Created by Nivardo Ibarra on 12/28/15.
//  Copyright © 2015 Nivardo Ibarra. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *tweetTextField;
- (void) configureTweetTextView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureTweetTextView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showShareAction:(id)sender {
    
}

- (void) configureTweetTextView {
    self.tweetTextField.layer.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0].CGColor;
    self.tweetTextField.layer.cornerRadius = 10.0;
    self.tweetTextField.layer.borderColor = [UIColor colorWithWhite:0.0 alpha:0.5].CGColor;
    self.tweetTextField.layer.borderWidth = 2.0;
}

@end
