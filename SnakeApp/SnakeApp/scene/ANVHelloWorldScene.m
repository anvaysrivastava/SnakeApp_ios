//
//  ANVHelloWorldScene.m
//  SnakeApp
//
//  Created by Anvay Srivastava on 22/02/14.
//  Copyright (c) 2014 Anvay Srivastava. All rights reserved.
//

#import "ANVHelloWorldScene.h"

@interface ANVHelloWorldScene()
@property BOOL contentCreated;
@end

@implementation ANVHelloWorldScene

-(void)didMoveToView:(SKView *)view
{
    if (!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

-(void)update:(NSTimeInterval)currentTime
{
    NSLog(@"",)
}

- (void)createSceneContents
{
    self.backgroundColor = [SKColor redColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    [self addChild: [self newHelloNode]];
}

- (SKLabelNode *)newHelloNode
{
    SKLabelNode *helloNode = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    helloNode.name = @"helloNode";
    helloNode.text = NSStringFromCGSize(self.view.frame.size);
    helloNode.fontSize = 20;
    helloNode.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
    return helloNode;
}

- (void)touchesBegan:(NSSet *) touches withEvent:(UIEvent *)event
{
    SKNode *helloNode = [self childNodeWithName:@"helloNode"];
    if (helloNode != nil)
    {
        helloNode.name = nil;
        SKAction *moveUp = [SKAction moveByX: 0 y: 100.0 duration: 0.5];
        SKAction *zoom = [SKAction scaleTo: 2.0 duration: 0.25];
        SKAction *pause = [SKAction waitForDuration: 0.5];
        SKAction *fadeAway = [SKAction fadeOutWithDuration: 0.25];
        SKAction *remove = [SKAction removeFromParent];
        SKAction *moveSequence = [SKAction sequence:@[moveUp, zoom, pause, fadeAway, remove]];
        [helloNode runAction: moveSequence];
    }
}

@end
