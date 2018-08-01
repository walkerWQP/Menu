//
//  HEMenuC.m
//  YHMenu
//
//  Created by Boris on 2018/5/10.
//  Copyright © 2018年 Boris. All rights reserved.
//

#import "HEMenu.h"
#import "MenuView.h"

@interface HEMenu ()

@property (nonatomic, strong) MenuView *menuView;

@end

@implementation HEMenu


+ (HEMenu *) shareManager {
    static HEMenu *menu = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        menu = [[HEMenu alloc]init];
    });
    return menu;
}

- (void) showPopMenuSelecteWithFrameWidth:(CGFloat)width
                                   height:(CGFloat)height
                                    point:(CGPoint)point
                                     item:(NSArray *)item
                                imgSource:(NSArray *)imgSource
                                   action:(void (^)(NSInteger index))action{
    __weak __typeof(&*self)weakSelf = self;
    if (self.menuView != nil) {
        [weakSelf hideMenu];
    }
    UIWindow * window = [[[UIApplication sharedApplication] windows] firstObject];
    self.menuView = [[MenuView alloc]initWithFrame:window.bounds
                                         menuWidth:width height:height point:point items:item imgSource:imgSource action:^(NSInteger index) {
                                             action(index);
                                             [weakSelf hideMenu];
                                         }];

    _menuView.touchBlock = ^{
        [weakSelf hideMenu];
    };
    
    self.menuView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.1];
    [window addSubview:self.menuView];

    
    
}

- (void) hideMenu {
        [self.menuView removeFromSuperview];
        self.menuView = nil;
}



@end
