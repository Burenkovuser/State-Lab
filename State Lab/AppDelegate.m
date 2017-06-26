//
//  AppDelegate.m
//  State Lab
//
//  Created by Vasilii on 26.06.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//встроенная переменная _cmd, которая всегда содержит селектор текущего метода. Напомним, что селектор — это способ, применяемый в Objective-C для обращения к методу. В частности, функция NSStringFromSelector() возвращает строковое представление типа NSString заданного селектора. В рассматриваемом здесь коде эта функция служит в качестве сокращения для вывода имени текущего метода, исключая необходимость набирать или копировать и вставлять его каждый раз в код.

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    return YES;
}

//переход из активного состояния в некативное (звонок, смс) переход к фоновому стоятоянию
- (void)applicationWillResignActive:(UIApplication *)application {

    NSLog(@"%@", NSStringFromSelector(_cmd));
}

//когда завершается работа сохраняются данные пользователя
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

//переход из фонового состояния в активное
- (void)applicationWillEnterForeground:(UIApplication *)application {

    NSLog(@"%@", NSStringFromSelector(_cmd));
}

//действия по переводу приложения из активного состояния в неактивное и служит удобным местом для активизации или отмены любой анимации, звука или других элементов в приложении, имеющих отношение к представлению приложения пользователю.
- (void)applicationDidBecomeActive:(UIApplication *)application {

    NSLog(@"%@", NSStringFromSelector(_cmd));
}

//Вызывается, когда приложение собирается прекращать. Сохранить данные в случае необходимости.
- (void)applicationWillTerminate:(UIApplication *)application {

  NSLog(@"%@", NSStringFromSelector(_cmd));
}


@end
