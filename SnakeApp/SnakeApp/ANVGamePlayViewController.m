//
//  ANVGamePlayViewController.m
//  SnakeApp
//
//  Created by Anvay Srivastava on 22/02/14.
//  Copyright (c) 2014 Anvay Srivastava. All rights reserved.
//

#import "ANVGamePlayViewController.h"
#import <SpriteKit/SpriteKit.h>

@interface ANVGamePlayViewController ()

@property (weak, nonatomic) IBOutlet SKView *spriteView;

@end

@implementation ANVGamePlayViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    ANVSnakePlayScene * helloWorldScene = [[ANVSnakePlayScene alloc] initWithSize:self.spriteView.bounds.size];
    [self.spriteView presentScene:helloWorldScene];

    self.spriteView.showsFPS = YES;
    self.spriteView.showsNodeCount = YES;
    
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    ANVSnakePlayScene * helloWorldScene = [[ANVSnakePlayScene alloc] initWithSize:self.spriteView.bounds.size];
    [self.spriteView presentScene:helloWorldScene];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
