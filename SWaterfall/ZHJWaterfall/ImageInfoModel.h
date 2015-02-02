//
//  PictureModel.h
//  ZHJWaterfall
//
//  Created by Sword on 12-9-21.
//  Copyright (c) 2012年 Sword. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface ImageInfoModel : NSObject

/* data format:
    {
        "id": "xxxx",
        "title": "金秋十月魅力伊利草原",
        "dec": "中国廊桥是桥梁与房屋的珠联合璧之作。回溯两千多年历史长河...",
        "author": "绝版青春",
        "source": "来源",
        "image_small": "http://www.fjldf.jmm/image/0001.jpg",
        "image_big": "http://www.fjldf.jmm/image/0001.jpg",
        "image_type": "1",
        "image_wh": "640|480",//前为宽，后为高
        "fav_count": 0	//每个图片的被赞次数          
    }
*/

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *image_small;
@property (nonatomic, strong) NSString *image_big;
@property (nonatomic, strong) NSString *image_wh;

@end
