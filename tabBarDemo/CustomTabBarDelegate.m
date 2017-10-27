//
//  CustomTabBarDelegate.m
//  tabBarDemo
//
//  Created by quanght on 10/26/17.

#import "CustomTabBarDelegate.h"
#import "CustomViewControllerAnimatedTransitioning.h"

@implementation CustomTabBarDelegate

- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    return [[CustomViewControllerAnimatedTransitioning alloc]initWithTabBar:tabBarController andIndex:tabBarController.selectedIndex];
}

@end
