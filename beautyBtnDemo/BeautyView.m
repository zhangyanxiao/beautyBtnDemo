//
//  BeautyView.m
//  beautyBtnDemo
//
//  Created by 公安信息 on 17/4/13.
//  Copyright © 2017年 zyx. All rights reserved.
//

#import "BeautyView.h"
#import "Masonry.h"

@interface BeautyView ()
@property (nonatomic, strong) UIView * contentView;
@property (nonatomic, strong) UIImageView * leftImv;
@property (nonatomic, strong) UIImageView * centerImv;
@property (nonatomic, strong) UIImageView * rightImv;
@property (nonatomic, strong) UILabel * beautyLabel;
@property (nonatomic, assign) BOOL isBeautied;
@end

@implementation BeautyView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_setupViews];
    }
    return self;
}

-(void)p_setupViews{
    UIView * contentView = [[UIView alloc] init];
//    contentView.backgroundColor = [UIColor yellowColor];
    [self addSubview:contentView];
    self.contentView = contentView;
    
    self.centerImv = [[UIImageView alloc] init];
//    self.centerImv.frame = CGRectMake((contentView.frame.size.width-50)/2.0, (contentView.frame.size.height-50)/2.0, 50, 50);
    [self.contentView addSubview:self.centerImv];
    
    self.leftImv = [[UIImageView alloc] init];
//    self.leftImv.frame = CGRectMake(2.5, 40, 20, 20);
    [self.contentView addSubview:self.leftImv];
    
    self.rightImv = [[UIImageView alloc] init];
//    self.rightImv.frame = CGRectMake(82.5, 45, 10, 10);
    [self.contentView addSubview:self.rightImv];
    self.centerImv.image = [UIImage imageNamed:@"beauty_img"];
    self.leftImv.image = [UIImage imageNamed:@"beauty_point"];
    self.rightImv.image = [UIImage imageNamed:@"beauty_point"];
    
    self.beautyLabel = [[UILabel alloc] init];
//    self.beautyLabel.frame = CGRectMake(0, 90, 100, 30);
    [self.contentView addSubview:self.beautyLabel];
    self.beautyLabel.text = @"美颜开启";
//    self.beautyLabel.backgroundColor = [UIColor redColor];
    self.beautyLabel.font = [UIFont systemFontOfSize:12];
    self.beautyLabel.textAlignment = NSTextAlignmentCenter;
    self.isBeautied = NO;
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
    [self.contentView addGestureRecognizer:tapRecognizer];
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.contentView.frame = CGRectMake(0, 0, 65, 65);
    self.centerImv.frame = CGRectMake(15, 0, 35, 35);
//    self.leftImv.frame = CGRectMake(2.5, 40, 20, 20);
    [self.leftImv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.centerImv);
        make.centerX.equalTo(self.centerImv).offset(-25);
        make.width.height.mas_equalTo(7);
    }];
    [self.rightImv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.centerImv);
//        make.centerX.mas_equalTo(42.5);
        make.centerX.equalTo(self.centerImv).offset(25);
        make.width.height.mas_equalTo(2);
    }];
    
    self.beautyLabel.frame = CGRectMake(0, 35, 65, 30);
    [self ani];
}
-(void)ani{
    CAKeyframeAnimation *keyAnima=[CAKeyframeAnimation animation];
    //1.1告诉系统要执行什么样的动画
    keyAnima.keyPath=@"bounds";
    //设置通过动画，将layer从哪儿移动到哪儿
    NSValue *value1=[NSValue valueWithCGRect:CGRectMake(0, 0, 2, 2)];
    NSValue *value2=[NSValue valueWithCGRect:CGRectMake(0, 0, 7, 7)];
    
    keyAnima.values=@[value2,value1,value2];
    //1.2设置动画执行完毕后，不删除动画
    keyAnima.removedOnCompletion=NO;
    //1.3设置保存动画的最新状态
    keyAnima.fillMode=kCAFillModeForwards;
    //1.4设置动画执行的时间
    keyAnima.duration=2.0;

    //设置代理，开始—结束
    keyAnima.delegate=self;
    keyAnima.repeatCount = 10;
    [self.leftImv.layer addAnimation:keyAnima forKey:@"demoAni"];
    
    CAKeyframeAnimation *keyAnima1=[CAKeyframeAnimation animation];
    //1.1告诉系统要执行什么样的动画
    keyAnima1.keyPath=@"bounds";
    
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
    
    
}
-(void)handleTapFrom:(UITapGestureRecognizer *)sender{
    
    
    if (self.isBeautied == NO) {
        
        [self.leftImv.layer removeAllAnimations];
        [self.rightImv.layer removeAllAnimations];
        self.centerImv.image = [UIImage imageNamed:@"beauty_img_close"];

        self.centerImv.frame = CGRectMake(0, 0, 65, 35);
//        self.centerImv.frame = CGRectMake(0, 15, 35, 35);
        [self.leftImv mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.centerImv);
            make.centerX.equalTo(self.centerImv);
            make.width.height.mas_equalTo(0);
            
        }];
        [self.rightImv mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.centerImv);
            make.centerX.equalTo(self.centerImv);
            make.width.height.mas_equalTo(0);
        }];
    
        self.beautyLabel.text = @"美颜关闭";
        
        self.isBeautied = YES;
        [UIView animateWithDuration:0.5 animations:^{
            [self layoutIfNeeded];
        }];
        
    }else{
//        self.centerImv.frame = CGRectMake((self.contentView.frame.size.width-50)/2.0, (self.contentView.frame.size.height-50)/2.0, 50, 50);
//        self.leftImv.frame = CGRectMake(2.5, 40, 20, 20);
//        self.rightImv.frame = CGRectMake(82.5, 45, 10, 10);

        self.centerImv.frame = CGRectMake(15, 0, 35, 35);
        [self.leftImv mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.centerImv);
            make.centerX.equalTo(self.centerImv).offset(-25);
            make.width.height.mas_equalTo(7);

        }];
        [self.rightImv mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.centerImv);
            make.centerX.equalTo(self.centerImv).offset(25);
            make.width.height.mas_equalTo(2);
        }];

        self.centerImv.image = [UIImage imageNamed:@"beauty_img"];
        
        self.beautyLabel.text = @"美颜开启";
       
        [self ani];
        self.isBeautied = NO;
        [UIView animateWithDuration:0.5 animations:^{
            [self layoutIfNeeded];
        }];
        
    }
    if (self.indexBlock) {
        
        self.indexBlock(self.isBeautied);
        
    }
}

@end
