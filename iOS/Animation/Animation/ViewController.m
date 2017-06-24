//
//  ViewController.m
//  Animation
//
//  Created by autel on 17/6/24.
//  Copyright © 2017年 zhongjiasheng. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *demoView;

@property (nonatomic, strong) NSArray *titles;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    
    [self.view addSubview:self.demoView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//UIView 代码块调用

- (void)animationWithUIViewAnimate{

    
    self.demoView.frame = CGRectMake(0, SCREEN_HEIGHT/2-50, 50, 50);
    [UIView animateWithDuration:1.0f animations:^{
        self.demoView.frame = CGRectMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-50, 50, 50);
    } completion:^(BOOL finished) {
        self.demoView.frame = CGRectMake(SCREEN_WIDTH/2-25, SCREEN_HEIGHT/2-50, 50, 50);
    }];
}

// UIView [begin commit]模式

- (void)animationWithCommitCommit{

   _demoView.frame = CGRectMake(0, SCREEN_HEIGHT/2-50, 50, 50);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0f];
    _demoView.frame = CGRectMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-50, 50, 50);
    [UIView commitAnimations];
    
}

//使用Core Animation中的类

- (void)animationWithBasicAnimtaion{

    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"position"];
    anima.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, SCREEN_HEIGHT/2-75)];
    anima.toValue = [NSValue valueWithCGPoint:CGPointMake(SCREEN_WIDTH, SCREEN_HEIGHT/2-75)];
    anima.duration = 1.0f;
    [_demoView.layer addAnimation:anima forKey:@"positionAnimation"];
    
//    CAEmitterCell;
}


#pragma UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.titles.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    

    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellIdentifer = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];

    }
    
    cell.textLabel.text = self.titles[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            [self animationWithUIViewAnimate];
        }
            break;
            
        case 1:
        {
            [self animationWithCommitCommit];
        }
            break;
            
        case 2:
        {
            [self animationWithBasicAnimtaion];
        }
            break;
            
        default:
            break;
    }
}


#pragma mark access Method

- (NSArray *)titles{

    
    if (!_titles) {
        _titles = @[@"UIView animation,",@"UIView animation,",@"UIView animation,",@"UIView animation,",@"UIView animation,"];
    }
    
    return _titles;
}

- (UIView *)demoView{

    if (!_demoView) {
        _demoView = [[UIView alloc] init];
        _demoView.backgroundColor = [UIColor redColor];
        _demoView.bounds = CGRectMake(0, 0, 50, 50);
        
    }
    return _demoView;
}


@end
