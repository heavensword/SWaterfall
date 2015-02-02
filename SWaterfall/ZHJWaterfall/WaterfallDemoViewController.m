//
//  WaterFallDemoViewController.m
//  ZHJWaterfall
//
//  Created by Sword on 13-10-23.
//  Copyright (c) 2013年 Sword. All rights reserved.
//

#import "WaterfallDemoViewController.h"
#import "SWaterFallTableView.h"
#import "TestWaterfallTableCell.h"
#import "ImageInfoModel.h"

@interface WaterfallDemoViewController ()<SWaterFallTableViewDataSource, SWaterFallTableViewDelegate>
{
    NSMutableArray  *_picArray;
}

@property (strong, nonatomic) IBOutlet UIView *view;
@property (strong, nonatomic) SWaterFallTableView *waterFallTableView;

@end

@implementation WaterfallDemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadData];
    self.waterFallTableView = [[SWaterFallTableView alloc] initWithFrame:self.view.bounds];
    self.waterFallTableView.datasource = self;
    self.waterFallTableView.delegate = self;
    self.waterFallTableView.enablePullToRefresh = TRUE;
    [self.view addSubview:self.waterFallTableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [NSObject cancelPreviousPerformRequestsWithTarget:_waterFallTableView selector:@selector(didFinishLoading) object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ITTWaterFallTableViewDataSource methods
- (NSInteger)numberOfRowsWaterFallTableView:(SWaterFallTableView*)tableView
{
    return [_picArray count];
}

- (SWaterFallTableCell*)waterFallTableView:(SWaterFallTableView*)tableView cellAtIndex:(NSInteger)index
{
    static NSString *reusableCellId = @"TestWaterfallTableCell";
    TestWaterfallTableCell *testWaterfallCell = (TestWaterfallTableCell*)[tableView dequeueReusableCellWithIdentifier:reusableCellId];
    if (!testWaterfallCell) {
        testWaterfallCell = [TestWaterfallTableCell cellFromNibWithIdentifier:reusableCellId];
    }
    ImageInfoModel *imageInfo = [_picArray objectAtIndex:index];
    testWaterfallCell.index = index;
    testWaterfallCell.imageInfo = imageInfo;
    return testWaterfallCell;
}

- (NSInteger)waterFallTableView:(SWaterFallTableView*)tableView heightOfCellAtIndex:(NSInteger)index
{
    ImageInfoModel *imageInfo = [_picArray objectAtIndex:index];
    if(index == 0) {
        return 72;
    }
    else if(1 == index) {
        return 144;
    }
    else if(2 == index) {
        return 96;
    }
    else {
        int height = 0;
        NSString *wh = imageInfo.image_wh;
        NSRange range = [wh rangeOfString:@"|"];
        if(range.length > 0) {
            height = [[wh substringFromIndex:range.location + 1] intValue];
        }
        if(height < 500) {
            return 72;
        }
        else if(height > 500 && height < 1000) {
            return 96;
        }
        else {
            return 144;
        }
    }
}

#pragma mark - ITTWaterFallTableViewDelegate
- (void)waterFallTableView:(SWaterFallTableView*)tableView didSelectedCellAtIndex:(NSInteger)index
{
    //    [ITTAlertView alertWithMessage:[NSString stringWithFormat:@"Index:%d", index] inView:self.view onCancel:^{
    //    } onConfirm:^{
    //    }];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"index:%ld", index] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}

- (void)waterFallTableViewDidDrigglerFrefresh:(SWaterFallTableView*)tableView
{
    [tableView performSelector:@selector(didFinishLoading) withObject:nil afterDelay:1.0];
}

- (void)waterFallTableViewDidTriggleLoadMore:(SWaterFallTableView*)tableView
{
    [tableView performSelector:@selector(didFinishLoading) withObject:nil afterDelay:1.0];
}

#pragma mark - private methods
- (void)loadData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"pictures" ofType:@"txt"];
    NSString *jsonString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
    NSArray *pidDicArray = dataDic[@"data"][@"image_list"];
    _picArray = [NSMutableArray array];
    for (id picDic in pidDicArray) {
        ImageInfoModel *imageInfo = [[ImageInfoModel alloc] init];
        imageInfo.image_small = picDic[@"image_small"];
        imageInfo.image_wh = picDic[@"image_wh"];
        [_picArray addObject:imageInfo];
    }
    [_waterFallTableView reloadData];
}

@end
