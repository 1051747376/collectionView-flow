//
//  TJQCell.h
//  仿知旅效果
//
//  Created by qianfeng on 15-9-6.
//  Copyright (c) 2015年 dreamFactory. All rights reserved.
//

#import <UIKit/UIKit.h>

#define IMAGE_HEIGHT 300 
#define IMAGE_OFFSET_SPEED 25

@interface TJQCell : UICollectionViewCell

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, assign) CGPoint imageOffset;

@end
