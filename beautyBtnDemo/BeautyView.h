//
//  BeautyView.h
//  beautyBtnDemo
//
//  Created by 公安信息 on 17/4/13.
//  Copyright © 2017年 zyx. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^Buttonblock)(NSInteger);
@interface BeautyView : UIView
@property(nonatomic, copy) Buttonblock indexBlock;
@end
