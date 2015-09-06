//
//  ViewController.m
//  仿知旅效果
//
//  Created by qianfeng on 15-9-6.
//  Copyright (c) 2015年 dreamFactory. All rights reserved.
//

#import "ViewController.h"
#import "TJQCell.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>

@property (weak, nonatomic) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray* images;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSUInteger index;
    for (index = 1; index < 100; ++index) {

        NSString *name = @"美女00.jpg";
        if(!self.images)
            self.images = [NSMutableArray arrayWithCapacity:0];
        [self.images addObject:name];
    }
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [layout setItemSize:CGSizeMake(180.f, 200.f)];
    [layout setSectionInset:UIEdgeInsetsMake(5.f, 5.f, 5.f, 5.f)];
    [layout setMinimumInteritemSpacing:5.f];
    [layout setMinimumLineSpacing:5.f];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0.f, 0.f, 375.f, 667.f) collectionViewLayout:layout];
    [self.view addSubview:collectionView];
    
    [collectionView registerClass:[TJQCell class] forCellWithReuseIdentifier:@"cell"];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    self.collectionView = collectionView;
    
    [self.collectionView reloadData];
    NSLog(@"xxx");
}


#pragma mark - UICollectionViewDatasource Methods


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"cnt: %zi", self.images.count);
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TJQCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];

    NSString* imageName = [self.images objectAtIndex:indexPath.item];
    cell.image = [UIImage imageNamed:imageName];
    
    //set offset accordingly
    CGFloat yOffset = ((self.collectionView.contentOffset.y - cell.frame.origin.y) / IMAGE_HEIGHT) * IMAGE_OFFSET_SPEED;
    cell.imageOffset = CGPointMake(0.0f, yOffset);
    
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    for(TJQCell *view in self.collectionView.visibleCells) {
        CGFloat yOffset = ((self.collectionView.contentOffset.y - view.frame.origin.y) / IMAGE_HEIGHT) * IMAGE_OFFSET_SPEED;
        view.imageOffset = CGPointMake(0.0f, yOffset);
    }
}

@end
