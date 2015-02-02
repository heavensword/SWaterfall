//
//  ITTWaterFallTableCell.h
//  ZHJWaterfall
//
//  Created by Sword on 5/21/12.
//  Copyright (c) 2012 Sword. All rights reserved.
//  Modifyed by Sword on 24/10/28
//  Convert to ARC, optimization, format
//  Refacotring refresh and load more function
//

#import <UIKit/UIKit.h>
@protocol SWaterFallTableCellDelegate;

@interface SWaterFallTableCell : UIView
{    
}

+ (id)cellFromNib;

+ (id)cellFromNibWithIdentifier:(NSString*)identifier;

@property (nonatomic, unsafe_unretained) id<SWaterFallTableCellDelegate> delegate;
@property (nonatomic, assign) BOOL scrolling;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) NSString *reusableCellId;

- (BOOL)isVisibleInRect:(CGRect)rect;
- (void)recyleAllComponents;
@end

@protocol SWaterFallTableCellDelegate <NSObject>
@optional
- (void)waterFallTableCellSelected:(SWaterFallTableCell*)cell;
@end
