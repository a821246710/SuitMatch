//
//  GameViewController.h
//  Game
//

//  Copyright (c) 2015年 IOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

@interface GameViewController : UIViewController

@property (weak, nonatomic) IBOutlet SKView *UIScene;
extern int life;
extern int score;
extern UILabel* lifeLabel;
extern UILabel* scoreLbel;
extern int winOrLose;       // 0 is normal  1 is lose 2 is win
@property (weak, nonatomic) IBOutlet UILabel *lifeUILabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreUILabel;

@end
