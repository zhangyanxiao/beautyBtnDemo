//
//  CViewController.m
//  beautyBtnDemo
//
//  Created by 公安信息 on 17/4/13.
//  Copyright © 2017年 zyx. All rights reserved.
//

#import "CViewController.h"
#import "BeautyView.h"

@interface CViewController ()

@end

@implementation CViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beautyControl:) name:@"photoBeauty" object:nil];
    BeautyView * bea = [[BeautyView alloc] initWithFrame:CGRectMake(100, 100, 65, 65)];
//    bea.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:bea];
    bea.indexBlock = ^(NSInteger index){
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"photoBeauty" object:[NSString stringWithFormat:@"%ld",(long)index]];
    };

}

-(void)beautyOpen{
    NSLog(@"美颜开启");
}
-(void)beautyClose{
    NSLog(@"美颜关闭");
    // 这里写照片美颜的代码
}

-(void)beautyControl:(NSNotification *)isBeauty{
    NSInteger * index = [isBeauty.object integerValue];
    if (index == 0) {
        [self loadViewIfNeeded];
        [self beautyOpen];
        
    }else{
        [self loadViewIfNeeded];
        [self beautyClose];
    }
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
