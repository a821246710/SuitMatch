//
//  MatchBar.h
//  Game
//
//  Created by Graphics on 2015/6/19.
//  Copyright (c) 2015年 IOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface MatchBar : SKScene

- (id)initWithSize:(CGSize)size gridNumber:(int)gridNum;
- (id)initWithSizeLocation:(CGPoint)location Size:(CGSize)size gridNumber:(int)gridNum;
@property (strong,nonatomic) NSMutableArray* matchBarImageName;
@property (strong,nonatomic) SKSpriteNode* matchBar;
@property (strong,nonatomic) NSMutableArray* matchBarItems;
@property CGSize SKSceneSize;

@end
