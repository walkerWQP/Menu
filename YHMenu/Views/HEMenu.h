//
//  HEMenuC.h
//  YHMenu
//
//  Created by Boris on 2018/5/10.
//  Copyright © 2018年 Boris. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>


@interface HEMenu : NSObject

+ (HEMenu *)shareManager;

// item.count != imgSource.count 或 imgSource.count == 0 时, 不显示图片, 只显示文本

/*
 * width menu的宽
 * height menu的最高高度 
 * point 顶点的point
 * item  要显示的文本数组
 * imgSource  要显示的icon数组
 * action 点击方法回调
 */
- (void) showPopMenuSelecteWithFrameWidth:(CGFloat)width
                              height:(CGFloat)height
                               point:(CGPoint)point
                                item:(NSArray *)item
                                imgSource:(NSArray *)imgSource
                              action:(void (^)(NSInteger index))action;
@end
