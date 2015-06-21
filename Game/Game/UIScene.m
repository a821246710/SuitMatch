//
//  UIScene.m
//  Game
//
//  Created by Graphics on 2015/6/20.
//  Copyright (c) 2015年 IOS. All rights reserved.
//

#import "UIScene.h"


@implementation UIScene

-(void)didMoveToView:(SKView *)view {
   
    self.backgroundColor = [SKColor colorWithRed:1.0 green:0.7 blue:0.8 alpha:0];
    self.size = CGSizeMake(768, 1024);
    
    
    // MARK: - label
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
     
     myLabel.text = @"Hello, World!";
     myLabel.fontSize = 65;
     myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
     CGRectGetMidY(self.frame));
     
     [self addChild:myLabel];
  
}

@end