//
//  ViewController.m
//  TwitterShare
//
//  Created by Nivardo Ibarra on 12/28/15.
//  Copyright © 2015 Nivardo Ibarra. All rights reserved.
//

#import "ViewController.h"
#import "Social/Social.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *tweetTextField;
@property (weak, nonatomic) IBOutlet UITextView *postTextField;
@property (weak, nonatomic) IBOutlet UITextView *moreTextField;


- (void) configureTweetTextView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureTweetTextView];
    [self configurePostTextView];
    [self configureMoreTextView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) showAlertMessage: (NSString *) myMessage {
    UIAlertController *alertController;
    alertController = [UIAlertController alertControllerWithTitle:@"SocialShare" message:myMessage preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)showShareAction:(id)sender {
    if ([self.tweetTextField isFirstResponder]) {
        [self.tweetTextField resignFirstResponder];
    }
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        SLComposeViewController *twitterVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        // Tweet out the tweet
        if ([self.tweetTextField.text length] < 140) {
            [twitterVC setInitialText: self.tweetTextField.text];
        }else {
            NSString *shortText = [self.tweetTextField.text substringToIndex:140];
            [twitterVC setInitialText:shortText];
        }
        [self presentViewController:twitterVC animated: YES completion: nil];
    }else {
        // Raise some kind of objection
        [self showAlertMessage:@"Please sign in to before you tweet"];
    }
}

- (void) configureTweetTextView {
    self.tweetTextField.layer.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0].CGColor;
    self.tweetTextField.layer.cornerRadius = 20.0;
    self.tweetTextField.layer.borderColor = [UIColor colorWithWhite:0.0 alpha:0.5].CGColor;
    self.tweetTextField.layer.borderWidth = 2.0;
}

- (void) configurePostTextView {
    self.postTextField.layer.backgroundColor = [UIColor colorWithRed:0.5 green:1.0 blue:1.0 alpha:1.0].CGColor;
    self.postTextField.layer.cornerRadius = 20.0;
    self.postTextField.layer.borderColor = [UIColor colorWithWhite:0.0 alpha:0.5].CGColor;
    self.postTextField.layer.borderWidth = 2.0;
}

- (void) configureMoreTextView {
    self.moreTextField.layer.backgroundColor = [UIColor colorWithRed:0.8 green:0.4 blue:1.0 alpha:1.0].CGColor;
    self.moreTextField.layer.cornerRadius = 20.0;
    self.moreTextField.layer.borderColor = [UIColor colorWithWhite:0.0 alpha:0.5].CGColor;
    self.moreTextField.layer.borderWidth = 2.0;
}

- (IBAction)showShareFacebookAction:(id)sender {
    if ([self.postTextField isFirstResponder]) {
        [self.postTextField resignFirstResponder];
    }

    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *facebookVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [facebookVC setInitialText:self.postTextField.text];
        [self presentViewController:facebookVC animated:YES completion:nil];
    }else {
        [self showAlertMessage:@"You sign in to Facebook"];
    }
}

- (IBAction)showShareMoreAction:(id)sender {
    if ([self.moreTextField isFirstResponder]) {
        [self.moreTextField resignFirstResponder];
    }

    UIActivityViewController *moreVC = [[UIActivityViewController alloc ]initWithActivityItems:@[self.moreTextField.text] applicationActivities:nil];
    [self presentViewController:moreVC animated:YES completion: nil];
}

- (IBAction)anyAction:(id)sender {
    [self showAlertMessage:@"Any action :) !!!"];
}

@end
