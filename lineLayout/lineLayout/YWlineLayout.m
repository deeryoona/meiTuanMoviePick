//
//  YWlineLayout.m
//  lineLayout
//
//  Created by jhyw12 on 2017/8/18.
//  Copyright © 2017年 jhyw12fulankeji. All rights reserved.
//

#import "YWlineLayout.h"

@implementation YWlineLayout

- (void)prepareLayout {
    [super prepareLayout];
    CGFloat contentW = (self.collectionView.frame.size.width-self.itemSize.width)*0.5;
    self.sectionInset = UIEdgeInsetsMake(0, contentW, 0, contentW);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    //NSArray *array = [super layoutAttributesForElementsInRect:rect].copy;
    NSArray *array = [[NSArray alloc] initWithArray:[super layoutAttributesForElementsInRect:rect] copyItems:YES];
    for (UICollectionViewLayoutAttributes *attrs in array) {
        CGFloat cellCenterX = attrs.center.x;
        CGFloat delta = ABS(centerX - cellCenterX);
        CGFloat scale = 1-delta/self.collectionView.frame.size.width*0.5;
        CGPoint originCenter = attrs.center;
        originCenter.y -= (attrs.size.height*scale-attrs.size.height)*0.5;
        attrs.center = originCenter;
        attrs.transform = CGAffineTransformMakeScale(scale, scale);
    }
    return array;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    CGRect endRect = CGRectMake(proposedContentOffset.x, 0, self.collectionView.frame.size.width, self.collectionView.frame.size.height);
    NSArray *array = [super layoutAttributesForElementsInRect:endRect];
    
    CGFloat minDelta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attrs in array) {
        CGFloat delta = ABS(centerX-attrs.center.x);
        if (ABS(minDelta)  > delta) {
            minDelta = attrs.center.x - centerX;
        }
    }
    proposedContentOffset.x += minDelta;
    return proposedContentOffset;
}


@end
