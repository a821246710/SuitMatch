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

    self.initLiff = 10;
    life = self.initLiff;
    score = 0;
    winOrLose = 0;
    lifeLabel = self.lifeUILabel;
    scoreLbel = self.scoreUILabel;
    self.lifeUILabel.text = [NSString stringWithFormat:@"%d",life];
    self.scoreUILabel.text = @"0";
    self.UIHight = 0.05;
    
    
    // Configure the view.
    //SKView * skView = (SKView *)self.UIScene;
    SKView * skView = [[SKView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:skView];
    skView.tag = 1;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = YES;
    
    // Create Game scene.
    GameScene *scene = [GameScene unarchiveFromFile:@"GameScene"];
    scene.scaleMode = SKSceneScaleModeAspectFit;
    // Create UIScebe.
    //UIScene *uiScene = [UIScene unarchiveFromFile:@"UIScene"];
    //uiScene.scaleMode = SKSceneScaleModeAspectFit;
    
    // Present the scene.
    [skView presentScene:scene];

    // bring UI to front
    [self.view bringSubviewToFront:self.UIScene];
    
    // detact things
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loseGame:) name:@"loseGame" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(breeding:) name:@"breeding" object:nil];
}

-(void)loseGame:(NSNotification*) notification{
    self.endGameUILabel.hidden = NO;
    self.endGameUILabel2.hidden = NO;
    
    /*NSLog(@"%lf  %lf",self.view.frame.origin.x,self.view.frame.origin.y);
    NSLog(@"%lf  %lf",self.UIScene.frame.origin.x,self.UIScene.frame.origin.y);
    NSLog(@"%lf  %lf",self.view.frame.size.height,self.view.frame.size.width);
    NSLog(@"%lf  %lf",self.UIScene.frame.size.height,self.UIScene.frame.size.width);*/
    
    [self.UIScene setFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y,
                                      self.view.frame.size.width, self.view.frame.size.height)];
    /*[self.UIScene setBounds:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y,
                                       self.view.frame.size.width, self.view.frame.size.height)];*/
    
    /*NSLog(@"%lf  %lf",self.view.frame.origin.x,self.view.frame.origin.y);
    NSLog(@"%lf  %lf",self.UIScene.frame.origin.x,self.UIScene.frame.origin.y);
    NSLog(@"%lf  %lf",self.view.frame.size.height,self.view.frame.size.width);
    NSLog(@"%lf  %lf",self.UIScene.frame.size.height,self.UIScene.frame.size.width);*/
}

-(void)breeding:(NSNotification*) notification{
    for (UIView *skView in self.view.subviews)
    {
        
        if (skView.tag == 1)
        {
            [UIView animateWithDuration:0.5 animations:^{[skView setFrame:CGRectMake(skView.frame.origin.x, skView.frame.origin.y,
                                                                                     skView.frame.size.width/2, self.view.frame.size.height)];}];
            
            // Configure the view.
            SKView * skView2 = [[SKView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, self.view.frame.origin.y,
                                                                        self.view.frame.size.width/2, self.view.frame.size.height)];
            [self.view addSubview:skView2];
            skView2.tag = 2;
            skView2.showsFPS = YES;
            skView2.showsNodeCount = YES;
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView2.ignoresSiblingOrder = YES;
            
            // Create Game scene.
            GameScene *scene = [GameScene unarchiveFromFile:@"GameScene"];
            scene.scaleMode = SKSceneScaleModeAspectFit;
            
            // Present the scene.
            [skView2 presentScene:scene];
            
            // bring UI to front
            [self.view bringSubviewToFront:self.UIScene];
        }
    }
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

- (IBAction)UITap:(id)sender {
    // if endOfGame state
    if(winOrLose!=0){
        [self.UIScene setFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y,
                                          self.view.frame.size.width, self.view.frame.size.width*self.UIHight)];
        // Present the scene.
        for (UIView *subView in self.view.subviews)
        {
            if (subView.tag >= 1)
            {
                [subView removeFromSuperview];
            }
        }
        // Configure the view.
        //SKView * skView = (SKView *)self.UIScene;
        SKView * skView = [[SKView alloc] initWithFrame:self.view.frame];
        [self.view addSubview:skView];
        skView.tag = 1;
        skView.showsFPS = YES;
        skView.showsNodeCount = YES;
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = YES;
        
        // Create Game scene.
        GameScene *scene = [GameScene unarchiveFromFile:@"GameScene"];
        scene.scaleMode = SKSceneScaleModeAspectFit;
        
        // Present the scene.
        [skView presentScene:scene];
        
        // bring UI to front
        [self.view bringSubviewToFront:self.UIScene];
        
        self.endGameUILabel.hidden = YES;
        self.endGameUILabel2.hidden = YES;
        
        life = 10;
        score = 0;
        winOrLose = 0;
        self.lifeUILabel.text = [NSString stringWithFormat:@"%d",life];
        self.scoreUILabel.text = @"0";
    }
}
@end






















