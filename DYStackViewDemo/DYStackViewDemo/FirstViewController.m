//
//  FirstViewController.m
//  DYStackViewDemo
//
//  Created by yang.duan on 2019/8/3.
//  Copyright © 2019 duanyang. All rights reserved.
//

#import "FirstViewController.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface FirstViewController ()

@property (nonatomic, strong) UIStackView *stackView;

@end

@implementation FirstViewController
{
    NSInteger index;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initStackView];
    
    self.stackView.backgroundColor = [UIColor orangeColor];
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setBackgroundColor:[UIColor greenColor]];
    [addBtn setTitle:@"增加一个" forState:UIControlStateNormal];
    [addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    addBtn.frame = CGRectMake(100, 400, 100, 50);
    [addBtn addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
    
    UIButton *removeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [removeBtn setBackgroundColor:[UIColor redColor]];
    [removeBtn setTitle:@"减少一个" forState:UIControlStateNormal];
    [removeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    removeBtn.frame = CGRectMake(240, 400, 100, 50);
    [removeBtn addTarget:self action:@selector(removeClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:removeBtn];
}


- (void)initStackView{
    

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(15, 150, ScreenWidth - 30, 180)];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor lightGrayColor];

    self.stackView = [[UIStackView alloc] init];
    self.stackView.axis = UILayoutConstraintAxisHorizontal;
    self.stackView.distribution = UIStackViewDistributionEqualCentering;
    self.stackView.spacing = 8;
    self.stackView.alignment = UIStackViewAlignmentFill;
    self.stackView.frame = CGRectMake(0, 0, ScreenWidth - 30, 180);
    [view addSubview:self.stackView];
}



- (void)addClick {
    NSLog(@"添加之前 : %zd",self.stackView.subviews.count);
    index = index + 1;
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentCenter;
    NSString *str = [NSString stringWithFormat:@"视图%ld",(long)index];
    for (int i = 0; i < random() % 2; i ++) {
        str = [str stringByAppendingString:str];
    }
    label.text = str;
    label.backgroundColor = [UIColor colorWithRed:random()%256/255.0 green:random()%256/255.0 blue:random()%256/255.0 alpha:1];
    [self.stackView addArrangedSubview:label];
    __weak FirstViewController *weakSelf = self;
    [UIView animateWithDuration:1.0 animations:^{
        [weakSelf.stackView layoutIfNeeded];
    }];
    
    NSLog(@"添加之后 : %zd",self.stackView.subviews.count);
    
}

- (void)removeClick {
    index = index - 1;
    NSLog(@"移除之前 : %zd",self.stackView.subviews.count);
    
    UIView *view = [self.stackView subviews].lastObject;
    [self.stackView removeArrangedSubview:view];
    [view removeFromSuperview];
    
    __weak FirstViewController *weakSelf = self;
    [UIView animateWithDuration:0.25 animations:^{
        [weakSelf.stackView layoutIfNeeded];
    }];
    NSLog(@"移除之后 : %zd",self.stackView.subviews.count);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}





@end
