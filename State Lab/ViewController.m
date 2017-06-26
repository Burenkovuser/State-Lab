//
//  ViewController.m
//  State Lab
//
//  Created by Vasilii on 26.06.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    BOOL animate;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    CGRect bounds = self.view.bounds;
    CGRect labelFrame = CGRectMake(bounds.origin.x, CGRectGetMidY(bounds) - 50, bounds.size.width, 100);
    self.label = [[UILabel alloc] initWithFrame:labelFrame];
    self.label.font = [UIFont fontWithName:@"Helvetica" size:70];
    self.label.text = @"Bazinga!";
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.label];
    
    // Изображение из файла smiley.png размером 84 x 84
    CGRect smileyFrame = CGRectMake(CGRectGetMidX(bounds) - 42,
                                    CGRectGetMidY(bounds)/2 - 42,
                                    84, 84);
    self.smileyView = [[UIImageView alloc] initWithFrame:smileyFrame];
    self.smileyView.contentMode = UIViewContentModeCenter;
    NSString *smileyPath = [[NSBundle mainBundle] pathForResource:@"smiley"
                                                           ofType:@"png"];
    self.smiley = [UIImage imageWithContentsOfFile:smileyPath];
    self.smileyView.image = self.smiley;
    [self.view addSubview:self.smileyView];
    
    [self rotateLabelDown];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    // уведомление о переходе из активного состояния в некативное (звонок, смс)
    [center addObserver:self
               selector:@selector(applicationWillResignActive)
                   name:UIApplicationWillResignActiveNotification
                 object:nil];
    // уведомление по переводу приложения из активного состояния в неактивное
    [center addObserver:self
               selector:@selector(applicationDidBecomeActive)
                   name:UIApplicationDidBecomeActiveNotification
                 object:nil];
    
    //переход в фоновое состояние
     [center addObserver:self
                selector:@selector(applicationDidEnterBackground)
                    name:UIApplicationDidEnterBackgroundNotification
                  object:nil];
    //выход из фонового состояния
     [center addObserver:self
                selector:@selector(applicationWillEnterForeground)
                    name:UIApplicationWillEnterForegroundNotification
                  object:nil];
    
}

//посылает уведомление при событии
- (void)applicationWillResignActive {
    NSLog(@"VC: %@", NSStringFromSelector(_cmd));
    animate = NO;//сбрасывает анимацию
}
//посылает уведомление при событии
- (void)applicationDidBecomeActive {
    NSLog(@"VC: %@", NSStringFromSelector(_cmd));
    animate = YES;//возобновляет
}

- (void)applicationDidEnterBackground {
    NSLog(@"VC: %@", NSStringFromSelector(_cmd));
    self.smiley = nil;
    self.smileyView.image = nil;
}

- (void)applicationWillEnterForeground {
    NSLog(@"VC: %@", NSStringFromSelector(_cmd));
    NSString *smileyPath = [[NSBundle mainBundle] pathForResource:@"smiley"
                                                           ofType:@"png"];
    self.smiley = [UIImage imageWithContentsOfFile:smileyPath];
    self.smileyView.image = self.smiley;
}


//анимациия
- (void)rotateLabelDown {
    [UIView animateWithDuration:0.5 animations:^{
        self.label.transform = CGAffineTransformMakeRotation(M_PI);
    }
                     completion:^(BOOL finished){
                         [self rotateLabelUp];
                     }];
}
- (void)rotateLabelUp {
    [UIView animateWithDuration:0.5 animations:^{
        self.label.transform = CGAffineTransformMakeRotation(0);
    }
                     completion:^(BOOL finished){
                         if (animate) {
                         [self rotateLabelDown];
                         }
                     }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
