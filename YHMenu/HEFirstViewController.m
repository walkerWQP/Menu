//
//  HEFirstViewController.m
//  YHMenu
//
//  Created by Boris on 2018/5/10.
//  Copyright © 2018年 Boris. All rights reserved.
//

#import "HEFirstViewController.h"
#import "HEMenu.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
@interface HEFirstViewController ()
@end

@implementation HEFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"首页";
    self.navigationItem.rightBarButtonItem = ({
        
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemAdd)
                                                                                   target:self
                                                                                   action:@selector(rightBarButtonItemAction:)];
        rightItem;
    });
    
    // Do any additional setup after loading the view.
}


- (void)rightBarButtonItemAction:(UIBarButtonItem *)sender
{
    [[HEMenu shareManager] showPopMenuSelecteWithFrameWidth:120 height:160 point:CGPointMake(kWidth - 25, 5) item:@[@"发起群聊", @"添加朋友", @"扫一扫", @"收付款", @"小程序"] imgSource:@[@"123", @"123", @"123", @"123", @"123"] action:^(NSInteger index) {
        NSLog(@"%ld", index);
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
