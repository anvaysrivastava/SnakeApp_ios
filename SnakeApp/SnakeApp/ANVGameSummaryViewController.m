//
//  ANVGameSummaryViewController.m
//  SnakeApp
//
//  Created by Anvay Srivastava on 22/02/14.
//  Copyright (c) 2014 Anvay Srivastava. All rights reserved.
//

#import "ANVGameSummaryViewController.h"

@interface ANVGameSummaryViewController ()

@property (weak, nonatomic) IBOutlet UIButton *Retry;
@property (weak, nonatomic) IBOutlet UIButton *Home;

@end

@implementation ANVGameSummaryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction)retryButtonPressed:(id)sender {
    [[self navigationController] popViewControllerAnimated:YES];
}

- (IBAction)homeButtonPressed:(id)sender {
    [[self navigationController] popToRootViewControllerAnimated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
