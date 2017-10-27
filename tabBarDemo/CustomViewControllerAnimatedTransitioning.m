//
//  CustomViewControllerAnimatedTransitioning.m
//  tabBarDemo
//
//  Created by quanght on 10/26/17.
//

#import "CustomViewControllerAnimatedTransitioning.h"

@interface CustomViewControllerAnimatedTransitioning()

@property (nonatomic, strong) UITabBarController * tabBarControll;
@property (nonatomic) NSInteger index;

@end

@implementation CustomViewControllerAnimatedTransitioning

- (id)initWithTabBar:(UITabBarController *)tabBar andIndex:(NSInteger)index
{
    self = [super init];
    if (self)
    {
        _index = index;
        _tabBarControll = tabBar;
    }
    
    return  self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.4;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *containView = transitionContext.containerView;
    UIViewController * fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController * toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [containView addSubview:toVC.view];
    
    GLfloat width = toVC.view.bounds.size.width;
    
    if (_tabBarControll.selectedIndex < _index)
    {
        width = - width;
    }
    
    toVC.view.transform = CGAffineTransformMakeTranslation(width, 0);
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:1.2 initialSpringVelocity:2.5 options:UIViewAnimationOptionOverrideInheritedOptions animations:^{
        toVC.view.transform = CGAffineTransformIdentity;
        fromVC.view.transform = CGAffineTransformMakeTranslation(-width, 0);

    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        fromVC.view.transform = CGAffineTransformIdentity;

    }];
}
@end
