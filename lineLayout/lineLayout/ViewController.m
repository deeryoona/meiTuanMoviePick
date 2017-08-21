//
//  ViewController.m
//  lineLayout
//
//  Created by jhyw12 on 2017/8/18.
//  Copyright © 2017年 jhyw12fulankeji. All rights reserved.
//

#import "ViewController.h"
#import "YWlineLayout.h"
#import "YWMovieCell.h"
@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation ViewController

static NSString * const cellID = @"YWMovieCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    YWlineLayout *layout = [[YWlineLayout alloc] init];
    layout.itemSize = CGSizeMake(100, 150);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    UICollectionView *collectV = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 200) collectionViewLayout:layout];
    collectV.backgroundColor = [UIColor yellowColor];
    collectV.dataSource = self;
    collectV.delegate = self;
    [collectV registerNib:[UINib nibWithNibName:NSStringFromClass([YWMovieCell class]) bundle:nil] forCellWithReuseIdentifier:cellID];
    [self.view addSubview:collectV];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 50;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    YWMovieCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor orangeColor];
    return cell;
}

@end
