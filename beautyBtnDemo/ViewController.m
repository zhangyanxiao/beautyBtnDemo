//
//  ViewController.m
//  beautyBtnDemo
//
//  Created by 公安信息 on 17/4/13.
//  Copyright © 2017年 zyx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CAAnimationDelegate>

@property (nonatomic, strong) UIView * contentView;
@property (nonatomic, strong) UIImageView * leftImv;
@property (nonatomic, strong) UIImageView * centerImv;
@property (nonatomic, strong) UIImageView * rightImv;
@property (nonatomic, strong) UILabel * beautyLabel;
@property (nonatomic, assign) BOOL isBeautied;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blueColor];
    UIView * contentView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 120)];
    contentView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:contentView];
    self.contentView = contentView;
    
    self.centerImv = [[UIImageView alloc] init];
    self.centerImv.frame = CGRectMake((contentView.frame.size.width-50)/2.0, (contentView.frame.size.height-50)/2.0, 50, 50);
    [self.contentView addSubview:self.centerImv];
    
    self.leftImv = [[UIImageView alloc] init];
    self.leftImv.frame = CGRectMake(2.5, 40, 20, 20);
    [self.contentView addSubview:self.leftImv];

    self.rightImv = [[UIImageView alloc] init];
    self.rightImv.frame = CGRectMake(82.5, 45, 10, 10);
    [self.contentView addSubview:self.rightImv];
    self.centerImv.image = [UIImage imageNamed:@"beauty_img"];
    self.leftImv.image = [UIImage imageNamed:@"beauty_point"];
    self.rightImv.image = [UIImage imageNamed:@"beauty_point"];
    
    self.beautyLabel = [[UILabel alloc] init];
    self.beautyLabel.frame = CGRectMake(0, 90, 100, 30);
    [self.contentView addSubview:self.beautyLabel];
    self.beautyLabel.text = @"美颜开启";
    self.beautyLabel.textAlignment = NSTextAlignmentCenter;
    self.isBeautied = NO;
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
    [self.contentView addGestureRecognizer:tapRecognizer];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self ani];
}

-(void)ani{
    [UIView beginAnimations:nil context:nil];
    //设置动画执行时间
    [UIView setAnimationDuration:2.0];
    [UIView setAnimationRepeatCount:100];
    //设置代理
    [UIView setAnimationDelegate:self];
    [UIView setAnimationRepeatAutoreverses:YES];
    //设置动画执行完毕调用的事件
    [UIView setAnimationDidStopSelector:@selector(didStopAnimation)];
    self.leftImv.frame = CGRectMake(7.5, 45, 10, 10);
    self.rightImv.frame = CGRectMake(77.5, 40, 20, 20);
    [UIView commitAnimations];
   
}
-(void)didStopAnimation{
    
}

-(void)handleTapFrom:(UITapGestureRecognizer *)sender{

    if (self.isBeautied == NO) {
        
        [self.leftImv.layer removeAllAnimations];
        [self.rightImv.layer removeAllAnimations];
        self.centerImv.image = [UIImage imageNamed:@"beauty_img_close"];
        self.centerImv.frame = CGRectMake(0, 20, 100, 70);
        self.leftImv.frame = CGRectMake(7.5, 45, 0, 0);
        self.rightImv.frame = CGRectMake(77.5, 40, 0, 0);
        self.beautyLabel.text = @"美颜关闭";
        [self loadViewIfNeeded];
        self.isBeautied = YES;

    }else{
        self.centerImv.frame = CGRectMake((self.contentView.frame.size.width-50)/2.0, (self.contentView.frame.size.height-50)/2.0, 50, 50);
        self.leftImv.frame = CGRectMake(2.5, 40, 20, 20);
        self.rightImv.frame = CGRectMake(82.5, 45, 10, 10);
        self.centerImv.image = [UIImage imageNamed:@"beauty_img"];

        self.beautyLabel.text = @"美颜开启";
        [self loadViewIfNeeded];
        [self ani];
        self.isBeautied = NO;

    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
