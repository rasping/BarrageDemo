//
//  ViewController.m
//  BarrageDemo
//
//  Created by siping ruan on 16/9/8.
//  Copyright © 2016年 siping ruan. All rights reserved.
//

#import "ViewController.h"
#import "BarrageView.h"
#import "BarrageModel.h"
#import "MJExtension.h"
#import "CustomCell.h"

@interface ViewController ()<BarrageViewDataSouce, BarrageViewDelegate>

//数据源
@property (strong, nonatomic) NSArray *dataArray;

@property (weak, nonatomic) IBOutlet UILabel *lable;
@property (weak, nonatomic) IBOutlet BarrageView *barrageView;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (weak, nonatomic) IBOutlet UIButton *stopBtn;
- (IBAction)startBtnClicked:(UIButton *)btn;
- (IBAction)stopBtnClicked:(UIButton *)btn;

@end

@implementation ViewController

- (NSArray *)dataArray
{
    if (!_dataArray) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"BarrageFile" ofType:@"plist"];
        NSMutableArray *array = [BarrageModel mj_objectArrayWithFile:path];
        _dataArray = array;
    }
    return _dataArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.barrageView.delegate = self;
    self.barrageView.dataSouce = self;
}

#pragma mark - Action

- (IBAction)startBtnClicked:(UIButton *)btn
{
    btn.enabled = NO;
    self.stopBtn.enabled = YES;
    [self.barrageView insertBarrages:self.dataArray immediatelyShow:YES];
}

- (IBAction)stopBtnClicked:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if (btn.selected) {
        [self.barrageView pauseAnimation];
    }else {
        [self.barrageView resumeAnimation];
    }
}

#pragma mark - BarrageViewDataSource

- (NSUInteger)numberOfRowsInTableView:(BarrageView *)barrageView
{
    return 5;
}

- (BarrageViewCell *)barrageView:(BarrageView *)barrageView cellForRowAtIndex:(NSInteger)index
{
    CustomCell *cell = [CustomCell cellWithBarrageView:barrageView];
    cell.model = self.dataArray[index];
    return cell;
}

#pragma mark - BarrageViewDelegate

- (void)barrageView:(BarrageView *)barrageView didSelectedCell:(BarrageViewCell *)cell
{
    CustomCell *customCell = (CustomCell *)cell;
    NSLog(@"你点击了:%@", customCell.model.message);
}

- (void)barrageView:(BarrageView *)barrageView willDisplayCell:(BarrageViewCell *)cell
{
    CustomCell *customCell = (CustomCell *)cell;
    NSLog(@"%@即将展示", customCell.model.message);
}

- (void)barrageView:(BarrageView *)barrageView didEndDisplayingCell:(BarrageViewCell *)cell
{
    CustomCell *customCell = (CustomCell *)cell;
    NSLog(@"%@展示完成", customCell.model.message);
}

@end
