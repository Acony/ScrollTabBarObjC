//
//  CustomViewControllerAnimatedTransitioning.h
//  tabBarDemo
//
//  Created by quanght on 10/26/17.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CustomViewControllerAnimatedTransitioning : NSObject<UIViewControllerAnimatedTransitioning>

- (id)initWithTabBar:(UITabBarController *) tabBar andIndex:(NSInteger)index;


@end
