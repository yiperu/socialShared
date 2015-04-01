//
//  ViewController.m
//  BorrarFacebook
//
//  Created by Henry AT on 4/1/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnFace:(id)sender {
    
    NSLog(@"Entro...");

    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
    SLComposeViewController * fbController =   [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        // - - - - - - - - -
        SLComposeViewControllerCompletionHandler __block completionHandler=^(SLComposeViewControllerResult result){
            
            [fbController dismissViewControllerAnimated:YES completion:nil];
            
            switch(result){
                case SLComposeViewControllerResultCancelled:
                default:
                {
                    NSLog(@"Cancelled.....");
                    
                }
                    break;
                case SLComposeViewControllerResultDone:
                {
                    NSLog(@"Posted....");
                }
                    break;
            }};
        // - - - - - - - - -

    // - - - - - - - - - - - -
    [fbController setInitialText:@"just a Test..."];
    [fbController addImage:[UIImage imageNamed:@"Philosophy.jpg"]];
    [fbController setInitialText:@"Check out this article."];
    [fbController addURL:[NSURL URLWithString:@"http://apps4s.com"]];
        
    [fbController setCompletionHandler:completionHandler];
    
        [self presentViewController:fbController animated:YES completion:nil];
    if ([fbController respondsToSelector:@selector(popoverPresentationController)])
    {
        // iOS 8+
        UIPopoverPresentationController *presentationController = [fbController popoverPresentationController];
        presentationController.sourceView = sender; // if button or change to self.view.
    }
 }

}

- (IBAction)btnTwitt:(id)sender {
    
    SLComposeViewController *tweetSheet = [SLComposeViewController
                                           composeViewControllerForServiceType:SLServiceTypeTwitter];
    
    [tweetSheet setInitialText:@"Great this is just a Test from my App!"];
    [self presentViewController:tweetSheet animated:YES completion:nil];
    
    if ([tweetSheet respondsToSelector:@selector(popoverPresentationController)])
    {
        // iOS 8+
        UIPopoverPresentationController *presentationController = [tweetSheet popoverPresentationController];
        presentationController.sourceView = sender; // if button or change to self.view.
    }
}

@end
