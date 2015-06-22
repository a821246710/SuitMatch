//
//  StartViewController.m
//  Game
//
//  Created by Graphics on 2015/6/22.
//  Copyright (c) 2015年 IOS. All rights reserved.
//

#import "StartViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.startLabel.alpha = 0.4;
    
    [UIView animateWithDuration:0.7
                          delay:0
                        options:UIViewAnimationCurveEaseInOut | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         //self.startLabel.center = CGPointMake(381, 410);
                         self.startLabel.alpha = 1;
                         self.startLabel.transform = CGAffineTransformMakeScale(1.05, 1.05);
                     }
                     completion:^(BOOL fin) {
                     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)click:(id)sender {
    UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"Game"];
    [self presentViewController:controller animated:YES completion:NULL];
}
@end
