//
//  Suits.h
//  Game
//
//  Created by Graphics on 2015/6/19.
//  Copyright (c) 2015年 IOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameScene.h"

@interface Suits : SKScene

- (id)initWithSize:(CGSize)size gridNumber:(int)gridNum target:(GameScene*)gameScene;
- (id)initWithSizeLocation:(CGPoint)location Size:(CGSize)size gridNumber:(int)gridNum target:(GameScene*)gameScene;
@property CGFloat suitSpeed;
@property (strong,nonatomic) SKSpriteNode* suit;
@property CGSize sceneSize;
@property int gridNum;
@property (strong,nonatomic) GameScene* gameScene;
- (void)run;
- (void)match;
- (void)reset;

@end