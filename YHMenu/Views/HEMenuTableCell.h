//
//  HEMenuTableCell.h
//  YHMenu
//
//  Created by Boris on 2018/5/27.
//
//

#import <UIKit/UIKit.h>

@interface HEMenuTableCell : UITableViewCell
{
    CGFloat _width;
    CGFloat _height;
}
@property (nonatomic, strong) UIImageView *iconImg;
@property (nonatomic, strong) UILabel *conLabel;
@property (nonatomic, strong) UIView *lineView;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier width:(CGFloat)width height:(CGFloat)height;
- (void)setContentByTitArray:(NSMutableArray *)titArray ImgArray:(NSMutableArray *)imgArray row:(NSInteger)row;
@end
