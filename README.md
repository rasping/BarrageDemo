#BarrageDemo
***
##弹幕
#### 1. 创建BarrageView对象

```
    BarrageView *view = [[BarrageView alloc] initWithFrame:CGRectMake(0, 100, 320, 250)];
    view.delegate = self;
    view.dataSouce = self;
    [self.view addSubview:view];
```
#### 2. 实现数据源协议
* 返回轨道数(required)

```
- (NSUInteger)numberOfRowsInTableView:(BarrageView *)barrageView
{
    return 5;
}
```
* 返回自定义cell样式(required)

```
- (BarrageViewCell *)barrageView:(BarrageView *)barrageView cellForRowAtIndex:(NSInteger)index
{
    CustomCell *cell = [CustomCell cellWithBarrageView:barrageView];
    cell.model = self.dataArray[index];
    return cell;
}
```
#### 3. 实现代理协议
* cell点击代理(optional)

```
- (void)barrageView:(BarrageView *)barrageView didSelectedCell:(BarrageViewCell *)cell
{
    CustomCell *customCell = (CustomCell *)cell;
    NSLog(@"你点击了:%@", customCell.model.message);
}
```
* 即将展示代理(optional)

```
- (void)barrageView:(BarrageView *)barrageView willDisplayCell:(BarrageViewCell *)cell
{
    CustomCell *customCell = (CustomCell *)cell;
    NSLog(@"%@即将展示", customCell.model.message);
}
```
* 展示完成代理(optional)

```
- (void)barrageView:(BarrageView *)barrageView didEndDisplayingCell:(BarrageViewCell *)cell
{
    CustomCell *customCell = (CustomCell *)cell;
    NSLog(@"%@展示完成", customCell.model.message);
}
```
#### 4. 插入数据
* 插入弹幕消息

```
[self.barrageView insertBarrages:self.dataArray immediatelyShow:YES];
```
* 暂停与继续

```
- (IBAction)stopBtnClicked:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if (btn.selected) {
        [self.barrageView pauseAnimation];
    }else {
        [self.barrageView resumeAnimation];
    }
}
```

IOS弹幕实现原理及代码分析详见http://www.jianshu.com/p/69b3c388670a
实现效果如下：
![Mou icon](http://upload-images.jianshu.io/upload_images/1344789-af2ef8a6723fdc19.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)