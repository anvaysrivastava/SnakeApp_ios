//
//  ANVHelloWorldScene.m
//  SnakeApp
//
//  Created by Anvay Srivastava on 22/02/14.
//  Copyright (c) 2014 Anvay Srivastava. All rights reserved.
//

#import "ANVSnakePlayScene.h"

@interface ANVSnakePlayScene()
@property BOOL contentCreated;
@property NSDate *lastRenderedTimeStamp;
@property NSTimeInterval allowedTimeIntervalBetweenTwoFrames;
@property NSNumber *spacingWidth;
@property NSNumber *blockWidth;
@property NSNumber *blockHeight;
@property NSNumber *spacingHeight;
@property NSNumber *numberOfHorizontalBlocks;
@property NSNumber *numberOfVerticalBlocks;
@property SKColor *activeSquareColor;
@property SKColor *deactiveSquareColor;
@end

@implementation ANVSnakePlayScene


-(void)didMoveToView:(SKView *)view
{
    if (!self.contentCreated)
    {
        self.contentCreated = YES;
        self.lastRenderedTimeStamp = [NSDate date];
        self.allowedTimeIntervalBetweenTwoFrames = (NSTimeInterval)0.5;
        self.contentCreated = YES;
        self.spacingHeight = [NSNumber numberWithInt:20];
        self.spacingWidth = [NSNumber numberWithInt:20];
        self.blockHeight = [NSNumber numberWithInt:100];
        self.blockWidth = [NSNumber numberWithInt:100];
        self.activeSquareColor = [SKColor colorWithRed:68.0/255 green:68.0/255 blue:68.0/255 alpha:1];
        self.deactiveSquareColor = [SKColor colorWithRed:208.0/255 green:208.0/255 blue:208.0/255 alpha:1];
        
        [self createSceneContents];
        
        
    }
}

- (void)createSceneContents
{
    self.backgroundColor = [SKColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1];
    self.scaleMode = SKSceneScaleModeAspectFit;
    for(int i=0;i<10;i++){
        for(int j=0;j<10;j++){
            [self addSquareNodeWithNodePositionx:[NSNumber numberWithInt:i] y:[NSNumber numberWithInt:j]];
        }
    }
    NSLog(@"Creating scene contents");
}


-(void)update:(NSTimeInterval)currentTime
{
    
    if([[NSDate date] timeIntervalSinceDate:self.lastRenderedTimeStamp] > self.allowedTimeIntervalBetweenTwoFrames){
       // NSLog(@"Frame data should be updated now %f %f",[[NSDate date] timeIntervalSinceDate:self.lastRenderedTimeStamp],self.allowedTimeIntervalBetweenTwoFrames);
        self.lastRenderedTimeStamp = [NSDate date];
//        if([self.backgroundColor isEqual:[SKColor redColor]]){
//            self.backgroundColor = [SKColor blueColor];
//        } else {
//            self.backgroundColor = [SKColor redColor];
//        }
        
    }
    //NSLog(@"Update called %@",[NSDate dateWithTimeIntervalSinceReferenceDate:currentTime]);
}


-(void)addSquareNodeWithNodePositionx:(NSNumber *)x y:(NSNumber *)y
{
    NSString *nodeName = [NSString stringWithFormat:@"%d,%d",x.intValue,y.intValue];
    NSNumber *sumWidth = [NSNumber numberWithFloat:(self.spacingWidth.floatValue + self.blockWidth.floatValue)];
    NSNumber *sumHeight = [NSNumber numberWithFloat:(self.spacingHeight.floatValue + self.blockHeight.floatValue)];
    
    NSNumber *x1 = [NSNumber numberWithFloat:(x.floatValue*sumWidth.floatValue) + self.spacingWidth.floatValue];
    NSNumber *x2 = [NSNumber numberWithFloat:(x.floatValue*sumWidth.floatValue) + sumWidth.floatValue];
    
    NSNumber *y1 = [NSNumber numberWithFloat:(y.floatValue*sumHeight.floatValue) + self.spacingHeight.floatValue];
    NSNumber *y2 = [NSNumber numberWithFloat:(y.floatValue*sumHeight.floatValue) + sumHeight.floatValue];
    
    
    
    SKShapeNode* squareNode = (SKShapeNode *)[self childNodeWithName:nodeName];
    if(squareNode!=nil){
        SKAction *remove = [SKAction removeFromParent];
        SKAction *moveSequence = [SKAction sequence:@[remove]];
        [squareNode runAction: moveSequence];
        squareNode.name = nil;
        
    }
    
    squareNode = [SKShapeNode node];
    UIBezierPath *squareNodePath = [[UIBezierPath alloc] init];
    [squareNodePath moveToPoint:CGPointMake(x1.floatValue,y1.floatValue)];
    NSLog(@"Starting point is %@", NSStringFromCGPoint(CGPointMake(x1.floatValue,y1.floatValue)));
    [squareNodePath addLineToPoint:CGPointMake(x1.floatValue,y2.floatValue)];
    NSLog(@"next point is %@", NSStringFromCGPoint(CGPointMake(x1.floatValue,y2.floatValue)));
    [squareNodePath addLineToPoint:CGPointMake(x2.floatValue,y2.floatValue)];
    NSLog(@"next point is %@", NSStringFromCGPoint(CGPointMake(x2.floatValue,y2.floatValue)));
//    [squareNodePath addLineToPoint:CGPointMake(x2.floatValue,y1.floatValue)];
//    NSLog(@"next point is %@", NSStringFromCGPoint(CGPointMake(x2.floatValue,y1.floatValue)));
    squareNode.path = squareNodePath.CGPath;
    squareNode.lineWidth = 0;
    squareNode.name = nodeName;
    squareNode.fillColor = self.activeSquareColor;
    [self addChild:squareNode];
    
    
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
