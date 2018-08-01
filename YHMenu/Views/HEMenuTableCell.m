//
//  HEMenuTableCell.m
//  YHMenu
//
//  Created by Boris on 2018/5/27.
//
//

#import "HEMenuTableCell.h"
#import "UIColor+Hex.h"
#define kLineXY 15.f    // 距离
#define kImgWidth 20.f    // 图片宽
#define kImgLabelWidth 10.f    // 图片和Label宽
@implementation HEMenuTableCell

- (UIView *)lineView
{
    if (!_lineView) {
        self.lineView = ({
            UIView *lineView  = [UIView new];
            lineView.backgroundColor = [UIColor colorWithHexString:@"#e4e4e4"];
            lineView.frame = CGRectMake(kLineXY, 0, _width - kLineXY * 2, 1);
            lineView;
        });
    }
    return _lineView;
}


- (UIImageView *)iconImg
{
    if (!_iconImg) {
        self.iconImg = ({
            UIImageView *imageView = [UIImageView new];
            imageView.backgroundColor = [UIColor yellowColor];
            imageView.frame = CGRectMake(kLineXY, (_height-kImgWidth)/2, kImgWidth, kImgWidth);
            imageView;
        });
    }
    return _iconImg;
}


- (UILabel *)conLabel
{
    if (!_conLabel) {
        self.conLabel = ({
            UILabel *label = [UILabel new];
            label.textColor = [UIColor colorWithHexString:@"#333333"];
            label.font = [UIFont systemFontOfSize:14];
            label.frame = CGRectMake(CGRectGetMaxX(self.iconImg.frame) + kImgLabelWidth, 0, _width - kImgLabelWidth - kLineXY - kImgWidth - 15, _height);
            label;
        });
    }
    return _conLabel;
}



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier width:(CGFloat)width height:(CGFloat)height
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _width = width;
        _height = height;
        [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.iconImg];
        [self.contentView addSubview:self.conLabel];
    }
    return self;
}


- (void)setContentByTitArray:(NSMutableArray *)titArray ImgArray:(NSMutableArray *)imgArray row:(NSInteger)row
{
    if (imgArray.count == 0) {
        _iconImg.hidden = YES;
        self.conLabel.frame = CGRectMake(kLineXY, 0, _width - kLineXY*2 , _height);
        _conLabel.textAlignment = NSTextAlignmentCenter;
    }else{
        _iconImg.hidden = NO;
        self.conLabel.frame = CGRectMake(CGRectGetMaxX(self.iconImg.frame) + kImgLabelWidth, 0, _width - kImgLabelWidth - kLineXY - kImgWidth - 15, _height);
        _iconImg.image = [UIImage imageNamed:imgArray[row]];
        _conLabel.text = titArray[row];
    }
}


@end
