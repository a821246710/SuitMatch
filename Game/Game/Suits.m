//
//  Suits.m
//  Game
//
//  Created by Graphics on 2015/6/19.
//  Copyright (c) 2015年 IOS. All rights reserved.
//

#import "Suits.h"

@implementation Suits

- (void)run:(CGFloat)mulTime{
    
    SKAction *move = [SKAction moveBy:CGVectorMake(0, -self.suitSpeed) duration:self.gameScene.gameSpeed*(mulTime/self.gameScene.gameSpeed)];
    [self.suit runAction:[SKAction sequence:@[move]]];
}

- (void)match{
    SKAction *scaleUp = [SKAction scaleBy:2 duration:0.2];
    SKAction *scaleBack = [SKAction scaleBy:0.5 duration:0];
    SKAction *faded = [SKAction fadeAlphaTo:0 duration:0.3];
    
    //[self.suit runAction:[SKAction sequence:@[scaleUp,scaleBack]] completion:^(void){reset();}];
    [self.suit runAction:[SKAction sequence:@[scaleUp]]];
    [self.suit runAction:[SKAction sequence:@[faded,scaleBack]]];
}

- (void)reset{
    int Value = arc4random() % (self.gridNum);
    switch (Value) {
        case 0:
            self.suit.texture = [SKTexture textureWithImageNamed:@"Spade"];
            self.suit.name = @"Spade";
            break;
        case 1:
            self.suit.texture = [SKTexture textureWithImageNamed:@"Diamond"];
            self.suit.name = @"Diamond";
            break;
        case 2:
            self.suit.texture = [SKTexture textureWithImageNamed:@"Hearts"];
            self.suit.name = @"Hearts";
            break;
        case 3:
            self.suit.texture = [SKTexture textureWithImageNamed:@"Club"];
            self.suit.name = @"Club";
            break;
        default:
            break;
    }
    Value = arc4random() % (self.gridNum);
    self.suit.position = CGPointMake((self.sceneSize.width / self.gridNum)* (0.5 + Value) , self.sceneSize.height + (self.sceneSize.width / self.gridNum));
    
    SKAction *fadeBack = [SKAction fadeAlphaTo:1 duration:0];
    [self.suit runAction:[SKAction sequence:@[fadeBack]]];

}

- (id)initWithSize:(CGSize)size gridNumber:(int)gridNum target:(GameScene*)gameScene
{
    self = [super init];
    if(self){
        self.gameScene = gameScene;
        self.sceneSize = size;
        self.gridNum = gridNum;
        self.suitSpeed = 50;
        
        int Value = arc4random() % (gridNum);
        switch (Value) {
            case 0:
                self.suit = [SKSpriteNode spriteNodeWithImageNamed:@"Spade"];
                self.suit.name = @"Spade";
                break;
            case 1:
                self.suit = [SKSpriteNode spriteNodeWithImageNamed:@"Diamond"];
                self.suit.name = @"Diamond";
                break;
            case 2:
                self.suit = [SKSpriteNode spriteNodeWithImageNamed:@"Hearts"];
                self.suit.name = @"Hearts";
                break;
            case 3:
                self.suit = [SKSpriteNode spriteNodeWithImageNamed:@"Club"];
                self.suit.name = @"Club";
                break;
            default:
                break;
        }
        
        self.suit.size = CGSizeMake(size.width / gridNum * 0.95, size.width / gridNum * 0.95);
        
        Value = arc4random() % (gridNum);
        self.suit.position = CGPointMake((size.width / gridNum)* (0.5 + Value) , size.height + (size.width / gridNum));
        
        self.suit.zPosition = 1;
    }
    return self;
}

- (id)initWithSizeLocation:(CGPoint)location Size:(CGSize)size gridNumber:(int)gridNum target:(GameScene*)gameScene
{
    self = [super init];
    if(self){
        self.gameScene = gameScene;
        self.sceneSize = size;
        self.gridNum = gridNum;
        self.suitSpeed = 50;
        
        int Value = arc4random() % (gridNum+1);
        switch (Value) {
            case 0:
                self.suit = [SKSpriteNode spriteNodeWithImageNamed:@"Spade"];
                self.suit.name = @"Spade";
                break;
            case 1:
                self.suit = [SKSpriteNode spriteNodeWithImageNamed:@"Diamond"];
                self.suit.name = @"Diamond";
                break;
            case 2:
                self.suit = [SKSpriteNode spriteNodeWithImageNamed:@"Hearts"];
                self.suit.name = @"Hearts";
                break;
            case 3:
                self.suit = [SKSpriteNode spriteNodeWithImageNamed:@"Club"];
                self.suit.name = @"Club";
                break;
            default:
                break;
        }
        
        self.suit.size = CGSizeMake(size.width / gridNum * 0.95, size.width / gridNum * 0.95);
        
        self.suit.position = CGPointMake(location.x , location.y);
        
        self.suit.zPosition = 1;
    }
    return self;
}



@end





















