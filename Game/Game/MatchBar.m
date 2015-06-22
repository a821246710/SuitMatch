//
//  MatchBar.m
//  Game
//
//  Created by Graphics on 2015/6/19.
//  Copyright (c) 2015年 IOS. All rights reserved.
//

#import "MatchBar.h"

@implementation MatchBar

-(void)update:(CFTimeInterval)currentTime {
    
}

- (id)initWithSize:(CGSize)size gridNumber:(int)gridNum
{
    self = [super init];
    if(self){
        self.SKSceneSize = size;
        
        self.matchBarImageName = [[NSMutableArray alloc] init];
        self.matchBar = [[SKSpriteNode alloc] init];
        self.matchBarItems = [[NSMutableArray alloc] init];
        
        [self.matchBarImageName addObject:@"target-Spade"];
        [self.matchBarImageName addObject:@"target-Diamond"];
        [self.matchBarImageName addObject:@"target-Hearts"];
        [self.matchBarImageName addObject:@"target-Club"];
        
        self.matchBar = [SKSpriteNode spriteNodeWithColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1] size:CGSizeMake(size.width, size.width / gridNum * 0.95)];
        self.matchBar.position = CGPointMake((size.width / 2), self.matchBar.frame.size.height/2);
        
        for (int i=0; i<gridNum; i++) {
            SKSpriteNode *temp = [SKSpriteNode spriteNodeWithImageNamed:[NSString stringWithFormat:@"%@",self.matchBarImageName[i]]];
            if([self.matchBarImageName[i] isEqualToString:@"target-Spade"]){
                temp.name = @"Spade";
            }
            else if([self.matchBarImageName[i] isEqualToString:@"target-Diamond"]){
                temp.name = @"Diamond";
            }
            else if([self.matchBarImageName[i] isEqualToString:@"target-Hearts"]){
                temp.name = @"Hearts";
            }
            else if([self.matchBarImageName[i] isEqualToString:@"target-Club"]){
                temp.name = @"Club";
            }
            temp.size = CGSizeMake(size.width / gridNum * 0.95, size.width / gridNum * 0.95);
            temp.position = CGPointMake((size.width / gridNum)* (0.5 + i) - (size.width/2) , 0);
            //temp.zPosition = 1;
            [self.matchBarItems addObject:temp];
            [self.matchBar addChild:temp];
        }
    }
    return self;
}

- (id)initWithSizeLocation:(CGPoint)location Size:(CGSize)size gridNumber:(int)gridNum
{
    self = [super init];
    if(self){
        self.SKSceneSize = size;
        
        self.matchBarImageName = [[NSMutableArray alloc] init];
        self.matchBar = [[SKSpriteNode alloc] init];
        self.matchBarItems = [[NSMutableArray alloc] init];
        
        [self.matchBarImageName addObject:@"target-Spade"];
        [self.matchBarImageName addObject:@"target-Diamond"];
        [self.matchBarImageName addObject:@"target-Hearts"];
        [self.matchBarImageName addObject:@"target-Club"];
        
        self.matchBar = [SKSpriteNode spriteNodeWithColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1] size:CGSizeMake(size.width, size.width / gridNum * 0.95)];
        self.matchBar.position = CGPointMake(location.x, location.y);
        
        for (int i=0; i<gridNum; i++) {
            SKSpriteNode *temp = [SKSpriteNode spriteNodeWithImageNamed:[NSString stringWithFormat:@"%@",self.matchBarImageName[i]]];
            if([self.matchBarImageName[i] isEqualToString:@"target-Spade"]){
                temp.name = @"Spade";
            }
            else if([self.matchBarImageName[i] isEqualToString:@"target-Diamond"]){
                temp.name = @"Diamond";
            }
            else if([self.matchBarImageName[i] isEqualToString:@"target-Hearts"]){
                temp.name = @"Hearts";
            }
            else if([self.matchBarImageName[i] isEqualToString:@"target-Club"]){
                temp.name = @"Club";
            }
            temp.size = CGSizeMake(size.width / gridNum * 0.95, size.width / gridNum * 0.95);
            temp.position = CGPointMake((size.width / gridNum)* (0.5 + i) - (size.width/2) , 0);
            //temp.zPosition = 1;
            [self.matchBarItems addObject:temp];
            [self.matchBar addChild:temp];
        }
    }
    return self;
}
@end