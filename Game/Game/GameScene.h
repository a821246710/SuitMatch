//
//  GameScene.h
//  Game
//

//  Copyright (c) 2015年 IOS. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameScene : SKScene

@property int gridNum;
@property int maxSuits;
@property CGFloat judgeY;
@property CGFloat judgeX;
@property NSTimeInterval timeCounter;
@property NSTimeInterval suitCounter;
@property NSTimeInterval suitSpawnTime;
@property NSTimeInterval LastUpdateTime;
@property NSTimeInterval timeSinceLastUpdate;
@property CGFloat gameSpeed;
@property int scoreIncre;
@property (strong,nonatomic) NSMutableArray* matchBars;
@property (strong,nonatomic) NSMutableArray* runningSuits;
@property (strong,nonatomic) NSMutableArray* availableSuits;
-(void)stage;

@end
