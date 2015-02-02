//
//  MDDishCell.m
//  ZHJWaterfall
//
//  Created by Sword on 13-10-23.
//  Copyright (c) 2013年 Sword. All rights reserved.
//

#import "TestWaterfallTableCell.h"
#import "ImageInfoModel.h"
#import "UIImageView+WebCache.h"

@interface TestWaterfallTableCell()

@property (retain, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (retain, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation TestWaterfallTableCell

- (void)dealloc
{

}

- (void)recyleAllComponents
{
    self.imageView.image = nil;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)setImageInfo:(ImageInfoModel *)imageInfo
{
    _imageInfo = imageInfo;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:_imageInfo.image_small]];
}
@end
