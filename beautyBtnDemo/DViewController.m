//
//  DViewController.m
//  beautyBtnDemo
//
//  Created by 公安信息 on 17/4/13.
//  Copyright © 2017年 zyx. All rights reserved.
//

#import "DViewController.h"

@interface DViewController ()<CAAnimationDelegate>

@property (nonatomic, strong) UIView * contentView;
@property (nonatomic, strong) UIImageView * leftImv;
@property (nonatomic, strong) UIImageView * centerImv;
@property (nonatomic, strong) UIImageView * rightImv;
@property (nonatomic, strong) UILabel * beautyLabel;
@property (nonatomic, assign) BOOL isBeautied;

@end

@implementation DViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    CAKeyframeAnimation *keyAnima=[CAKeyframeAnimation animation];
    //1.1告诉系统要执行什么样的动画
    keyAnima.keyPath=@"bounds";
    //设置通过动画，将layer从哪儿移动到哪儿
    NSValue *value1=[NSValue valueWithCGRect:CGRectMake(0, 0, 10, 10)];
    NSValue *value2=[NSValue valueWithCGRect:CGRectMake(0, 0, 20, 20)];
    
    keyAnima.values=@[value2,value1,value2];
    //1.2设置动画执行完毕后，不删除动画
    keyAnima.removedOnCompletion=NO;
    //1.3设置保存动画的最新状态
    keyAnima.fillMode=kCAFillModeForwards;
    //1.4设置动画执行的时间
    keyAnima.duration=2.0;
    //1.5设置动画的节奏
//    keyAnima.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //设置代理，开始—结束
    keyAnima.delegate=self;
    keyAnima.repeatCount = 10;
    [self.leftImv.layer addAnimation:keyAnima forKey:@"demoAni"];
    
    CAKeyframeAnimation *keyAnima1=[CAKeyframeAnimation animation];
    //1.1告诉系统要执行什么样的动画
    keyAnima1.keyPath=@"bounds";
    //设置通过动画，将layer从哪儿移动到哪儿
//        NSValue *value1=[NSValue valueWithCGRect:CGRectMake(0, 0, 10, 10)];
//        NSValue *value2=[NSValue valueWithCGRect:CGRectMake(0, 0, 20, 20)];
//        NSValue *value3=[NSValue valueWithCGRect:CGRectMake(0, 0,10, 10)];

    keyAnima1.values = @[value1,value2,value1];;
    //1.2设置动画执行完毕后，不删除动画
    keyAnima1.removedOnCompletion=NO;
    //1.3设置保存动画的最新状态
    keyAnima1.fillMode=kCAFillModeForwards;
    //1.4设置动画执行的时间
    keyAnima1.duration=2.0;

    //设置代理，开始—结束
    keyAnima1.delegate=self;
    keyAnima1.repeatCount = 10;

    [self.rightImv.layer addAnimation:keyAnima1 forKey:@"demoAni1"];
//    // 缩放动画
//    CABasicAnimation *a2 = [CABasicAnimation animation];
//    a2.keyPath = @"transform.scale";
//    a2.toValue = @(0.0);
    
//    // 旋转动画
//    CABasicAnimation *a3 = [CABasicAnimation animation];
//    a3.keyPath = @"transform.rotation";
//    a3.toValue = @(M_PI_2);
//    // 组动画
//    CAAnimationGroup *groupAnima = [CAAnimationGroup animation];
//    groupAnima.animations = @[a1, a2, a3];
//    //设置组动画的时间
//    groupAnima.duration = 2;
//    groupAnima.fillMode = kCAFillModeForwards;
//    groupAnima.removedOnCompletion = NO;
//    [self.contentView.layer addAnimation:groupAnima forKey:nil];
    
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
