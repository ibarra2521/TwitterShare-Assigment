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
    UIAlertController *actionController = [UIAlertController alertControllerWithTitle:@"Share" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
    
    UIAlertAction *tweetAction = [UIAlertAction actionWithTitle:@"Tweet" style:UIAlertActionStyleDefault handler:
                                  ^(UIAlertAction *action){
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
        }];
    UIAlertAction *facebookAction = [UIAlertAction actionWithTitle:@"Post to Facebook" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
            SLComposeViewController *facebookVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            [facebookVC setInitialText:self.tweetTextField.text];
            [self presentViewController:facebookVC animated:YES completion:nil];
        }else {
            [self showAlertMessage:@"You sign in to Facebook"];
        }
    }];
    
    [actionController addAction:tweetAction];
    [actionController addAction:facebookAction];
    [actionController addAction:cancelAction];
    
    [self presentViewController:actionController animated:YES completion:nil];
    
}

- (void) configureTweetTextView {
    self.tweetTextField.layer.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0].CGColor;
    self.tweetTextField.layer.cornerRadius = 10.0;
    self.tweetTextField.layer.borderColor = [UIColor colorWithWhite:0.0 alpha:0.5].CGColor;
    self.tweetTextField.layer.borderWidth = 2.0;
}

@end
