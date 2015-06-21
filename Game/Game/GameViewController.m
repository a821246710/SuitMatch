//
//  GameViewController.m
//  Game
//
//  Created by Graphics on 2015/6/19.
//  Copyright (c) 2015年 IOS. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"
#import "UIScene.h"

int life;
int score;
int winOrLose;
UILabel* lifeLabel;
UILabel* scoreLbel;
@implementation SKScene (Unarchive)

+ (instancetype)unarchiveFromFile:(NSString *)file {
    /* Retrieve scene file path from the application bundle */
    NSString *nodePath = [[NSBundle mainBundle] pathForResource:file ofType:@"sks"];
    /* Unarchive the file to an SKScene object */
    NSData *data = [NSData dataWithContentsOfFile:nodePath
                                          options:NSDataReadingMappedIfSafe
                                            error:nil];
    NSKeyedUnarchiver *arch = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    [arch setClass:self forClassName:@"SKScene"];
    SKScene *scene = [arch decodeObjectForKey:NSKeyedArchiveRootObjectKey];
    [arch finishDecoding];
    
    return scene;
}

@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    life = 10;
    score = 0;
    winOrLose = 0;
    lifeLabel = self.lifeUILabel;
    scoreLbel = self.scoreUILabel;
    
    
    // Configure the view.
    //SKView * skView = (SKView *)self.UIScene;
    SKView * skView = [[SKView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:skView];
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = YES;
    
    // Create Game scene.
    GameScene *scene = [GameScene unarchiveFromFile:@"GameScene"];
    scene.scaleMode = SKSceneScaleModeAspectFit;
    // Create UIScebe.
    UIScene *uiScene = [UIScene unarchiveFromFile:@"UIScene"];
    uiScene.scaleMode = SKSceneScaleModeAspectFit;
    
    // Present the scene.
    [skView presentScene:scene];
    

    // bring UI to front
    [self.view bringSubviewToFront:self.UIScene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
