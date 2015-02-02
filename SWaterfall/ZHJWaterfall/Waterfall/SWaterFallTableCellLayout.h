//
//  ITTWaterFallTableCellLayoutPosition.h
//  ZHJWaterfall
//
//  Created by Sword on 5/21/12.
//  Copyright (c) 2012 Sword. All rights reserved.
//  Modifyed by Sword on 24/10/28
//  Convert to ARC, optimization, format
//  Refacotring refresh and load more function
//

#import <UIKit/UIKit.h>

@class SWaterFallTableCell;

@interface SWaterFallTableCellLayout : NSObject

@property (nonatomic, assign) float x;
@property (nonatomic, assign) float y;
@property (nonatomic, assign) float width;
@property (nonatomic, assign) float height;
@property (nonatomic, assign) CGRect frame;
@property (nonatomic, assign) NSInteger column;
@property (nonatomic, assign) NSInteger cellIndex;
@property (nonatomic, assign) BOOL hasDrawnInTableView;
@property (nonatomic, weak) SWaterFallTableCell *cell;

- (id)initWithColumn:(NSInteger)column frame:(CGRect)frame cellIndex:(NSInteger)cellIndex;
- (float)getBottom;
- (BOOL)isVisibleInRect:(CGRect)rect;
- (CGRect)getFrame;
@end
