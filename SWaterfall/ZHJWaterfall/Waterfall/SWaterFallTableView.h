//
//  ITTWaterFallTableView.h
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
@protocol SWaterFallTableViewDataSource;
@protocol SWaterFallTableViewDelegate;

#define ITTWaterFallTableViewColumnNumber       3
#define ITTWaterFallTableViewColumnPadding      5
#define ITTWaterFallTableViewRowPadding         5
#define ITTWaterFallTableViewRecyclePoolSize    6

@interface SWaterFallTableView : UIView<UIScrollViewDelegate>
{
}

@property (nonatomic, assign) BOOL waterfallIsLoadingMore;
@property (nonatomic, assign) BOOL waterfallIsRefreshing;
@property (nonatomic, assign) BOOL enablePullToRefresh;

@property (nonatomic, unsafe_unretained) IBOutlet id<SWaterFallTableViewDelegate> delegate;
@property (nonatomic, unsafe_unretained) IBOutlet id<SWaterFallTableViewDataSource> datasource;

- (void) reloadData;
- (void) didFinishLoading;

- (SWaterFallTableCell*)dequeueReusableCellWithIdentifier:(NSString*)reusableCellId;

@end

#pragma mark - delegate
@protocol SWaterFallTableViewDelegate <NSObject>
    
@required
- (void)waterFallTableView:(SWaterFallTableView*)tableView didSelectedCellAtIndex:(NSInteger)index;
    
@optional
- (void)waterFallTableViewDidDrigglerFrefresh:(SWaterFallTableView*)tableView;
- (void)waterFallTableViewDidTriggleLoadMore:(SWaterFallTableView*)tableView;
@end

#pragma mark - datasource
@protocol SWaterFallTableViewDataSource <NSObject>

@required
- (SWaterFallTableCell*)waterFallTableView:(SWaterFallTableView*)tableView cellAtIndex:(NSInteger)index;
- (NSInteger)waterFallTableView:(SWaterFallTableView*)tableView heightOfCellAtIndex:(NSInteger)index;
- (NSInteger)numberOfRowsWaterFallTableView:(SWaterFallTableView*)tableView;

@end