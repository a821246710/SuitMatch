//
//  GameScene.m
//  Game
//
//  Created by Graphics on 2015/6/19.
//  Copyright (c) 2015年 IOS. All rights reserved.
//

#import "GameScene.h"
#import "MatchBar.h"
#import "Suits.h"
#import "GameViewController.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    
    self.matchBars = [[NSMutableArray alloc] init];
    self.runningSuits = [[NSMutableArray alloc] init];
    self.availableSuits = [[NSMutableArray alloc] init];
    
    /* Setup your scene here */
    self.LastUpdateTime = [[NSDate date] timeIntervalSinceReferenceDate];
    self.judgeX = self.frame.size.width/16;
    self.judgeY = 50;
    self.gameSpeed = 0.3;
    self.timeCounter = 0;
    self.suitCounter = 0;
    self.suitSpawnTime = 2;
    self.scoreIncre = 10;
    self.gridNum = 4;
    self.maxSuits = 30;
    self.backgroundColor = [SKColor colorWithRed:1.0 green:0.7 blue:0.8 alpha:1];
    self.size = CGSizeMake(768, 1024);
    
    // MARK: - label
    /*SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel.text = @"Hello, World!";
    myLabel.fontSize = 65;
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMidY(self.frame));
    
    [self addChild:myLabel];*/
    
    // MARK: - match bar
    // self.matchBarImageName.count must same with self.gridNum
    [self.matchBars addObject:[[MatchBar alloc] initWithSize:self.frame.size gridNumber:self.gridNum]];
    [self addChild:((MatchBar*)self.matchBars[0]).matchBar];
    
    // MARK: - init suits
    for (int i=0; i<self.maxSuits; i++) {
        [self.availableSuits addObject:[[Suits alloc] initWithSize:self.frame.size gridNumber:self.gridNum target:self]];
        [self addChild:((Suits*)([self.availableSuits lastObject])).suit];
    }
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    NSArray *Touches = [touches allObjects];
    UITouch *touch1 = [Touches objectAtIndex:0];
    CGPoint loc = [touch1 locationInNode:self];
    CGPoint prevloc = [touch1 previousLocationInNode:self];
    for(MatchBar *aMatchBar in self.matchBars){
        for(SKSpriteNode *aSNode in aMatchBar.matchBarItems){
            aSNode.position = CGPointMake(aSNode.position.x + loc.x - prevloc.x, aSNode.position.y);
            float amount = aSNode.position.x - -(self.frame.size.width/2);
            if(amount < 0)
                aSNode.position = CGPointMake(self.frame.size.width/2 + amount, aSNode.position.y);
            amount = aSNode.position.x - (self.frame.size.width/2);
            if(amount > 0)
                aSNode.position = CGPointMake(-(self.frame.size.width/2) + amount, aSNode.position.y);
        }
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"flower"];
        
        sprite.xScale = 0.2;
        sprite.yScale = 0.2;
        int ValueR = arc4random() % (10);
        int ValueX = arc4random() % (10);
        int ValueY = arc4random() % (10);
        sprite.zRotation = M_PI/ValueR;
        sprite.position = CGPointMake(location.x + ValueX, location.y + ValueY) ;
        
        SKAction *action1 = [SKAction scaleBy:2  duration:0.2];
        SKAction *action2 = [SKAction fadeAlphaTo:0 duration:0.2];
        SKAction *action3 = [SKAction moveBy:CGVectorMake(0, -10) duration:0.2];
        [self addChild:sprite];
        [sprite runAction:[SKAction sequence:@[action1,action2]]];
        [sprite runAction:action3];
        
        
    }
}

-(void)update:(NSTimeInterval)currentTime {
    currentTime = [[NSDate date] timeIntervalSinceReferenceDate];
    self.timeSinceLastUpdate = currentTime - self.LastUpdateTime;
    self.LastUpdateTime = currentTime;
    
    self.timeCounter += self.timeSinceLastUpdate;
    self.suitCounter += self.timeSinceLastUpdate;
    //printf("suitCounter: %lf     timeCounter: %lf \n",self.suitCounter,self.timeCounter);
    //printf("avalcount: %d     runcount: %d \n",self.availableSuits.count,self.runningSuits.count);
    
    if(self.timeCounter > self.gameSpeed && winOrLose==0){
        NSMutableArray *removeList = [[NSMutableArray alloc] init];
        for(Suits *aSuit in self.runningSuits){
            //printf("%lf\n",aSuit.suit.position.y);
            if(aSuit.suit.position.y > self.frame.size.height + self.frame.size.width/self.gridNum ||
               aSuit.suit.position.y < -self.frame.size.width/self.gridNum){
                // MARK: - when Lost
                [self.availableSuits addObject:aSuit];
                //[self.runningSuits removeObjectIdenticalTo:aSuit];
                [removeList addObject:aSuit];
                life -= 1;
                lifeLabel.text = [NSString stringWithFormat:@"%d",life];
                if(life <= 0){
                    [self removeAllActions];
                    winOrLose = 1;
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"loseGame" object:nil];
                }
                //break;
            }
            for(MatchBar *aMatchBar in self.matchBars){
                for(SKSpriteNode *aSNode in aMatchBar.matchBarItems){
                    //NSLog(@"avalcount: %@     runcount: %@ \n",aSNode.name,aSuit.suit.name);
                    //printf("x: %lf     y: %lf \n",fabs((aSNode.parent.position.x + aSNode.position.x)-aSuit.suit.position.x),fabs((aSNode.parent.position.y + aSNode.position.y)-aSuit.suit.position.y));
                    if([aSNode.name isEqualToString:aSuit.suit.name] &&
                       fabs((aSNode.parent.position.x + aSNode.position.x)-aSuit.suit.position.x) < self.judgeX &&
                       fabs((aSNode.parent.position.y + aSNode.position.y)-aSuit.suit.position.y) < self.judgeY){
                        // MARK: - when match
                        [aSuit match];
                        [self.availableSuits addObject:aSuit];
                        [removeList addObject:aSuit];
                        score += self.scoreIncre;
                        [self stage];
                        scoreLbel.text = [NSString stringWithFormat:@"%d",score];
                    }
                }
            }
            [aSuit run:self.timeCounter];
        }
        
        self.timeCounter -= self.gameSpeed;
        
        if(removeList.count > 0){
            //printf("avalcount: %d     runcount: %d   matchList: %d\n",self.availableSuits.count,self.runningSuits.count,matchList.count);
            for(Suits *aSuit in removeList){
                [self.runningSuits removeObjectIdenticalTo:aSuit];
            }
            //printf("avalcount: %d     runcount: %d   matchList: %d\n",self.availableSuits.count,self.runningSuits.count,matchList.count);
        }
    }
    
    if(self.suitCounter > self.suitSpawnTime && self.availableSuits.count>0  && winOrLose==0){
        self.suitCounter -= self.suitSpawnTime;
        Suits *aSuit = [self.availableSuits firstObject];
        [aSuit reset];
        [self.runningSuits addObject:aSuit];
        [self.availableSuits removeObjectIdenticalTo:aSuit];
    }
}

-(void)stage{
    // stage 1
    if(score <= 200){
        self.gameSpeed -= 0.0075;
        self.suitSpawnTime -= 0.05;
    }
    
    // stage 2
    if(score == 300){
        [[NSNotificationCenter defaultCenter] postNotificationName:@"breeding" object:nil];
        self.scoreIncre = 20;
    }
    
}

@end


































