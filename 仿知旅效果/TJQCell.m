//
//  TJQCell.m
//  仿知旅效果
//
//  Created by qianfeng on 15-9-6.
//  Copyright (c) 2015年 dreamFactory. All rights reserved.
//

#import "TJQCell.h"

@interface TJQCell()

@property (nonatomic, strong) UIImageView *imageView_;

@end

@implementation TJQCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) [self setupImageView];
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) [self setupImageView];
    return self;
}


#pragma mark - Setup Method
- (void)setupImageView
{
    self.clipsToBounds = YES;
    
    // Add image subview
    self.imageView_ = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, IMAGE_HEIGHT)];
    self.imageView_.backgroundColor = [UIColor redColor];
    self.imageView_.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView_.clipsToBounds = NO;
    [self addSubview:self.imageView_];
}

# pragma mark - Setters

- (void)setImage:(UIImage *)image
{
    self.imageView_.image = image;

    [self setImageOffset:self.imageOffset];
}

- (void)setImageOffset:(CGPoint)imageOffset
{
    
    _imageOffset = imageOffset;
    
    CGRect frame = self.imageView_.bounds;
    CGRect offsetFrame = CGRectOffset(frame, _imageOffset.x, _imageOffset.y);
    self.imageView_.frame = offsetFrame;
}

@end
