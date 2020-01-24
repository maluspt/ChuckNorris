//
//  main.m
//  ChuckNorrisObjC
//
//  Created by Maria Luiza Carvalho Sperotto on 23/01/20.
//  Copyright © 2020 Maria Luiza Carvalho Sperotto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
