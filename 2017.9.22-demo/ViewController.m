//
//  ViewController.m
//  2017.9.22-demo
//
//  Created by cchaojie on 2017/9/22.
//  Copyright © 2017年 chaojie. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
#import "NextViewController.h"
#import <AVFoundation/AVFoundation.h>


#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{

    NSArray *_arrayData1;
    NSArray *_arrayData2;
    NSArray *_arrayData3;
    NSArray *_arrayData4;
    UITableView *_rightTab;
    
    NSMutableArray *_arrayData5;
}

@end

@implementation ViewController

-(NSArray *)arrayData1{
    
    if (!_arrayData1) {
        _arrayData1 = [[NSArray alloc] initWithObjects:@"test1",@"test2",@"test3", nil];
    }
    
    return _arrayData1;
}
-(NSArray *)arrayData2{
    
    if (!_arrayData2) {
        _arrayData2 = [[NSArray alloc] initWithObjects:@"ceshi1",@"ceshi2",@"ceshi3", nil];
    }
    
    return _arrayData2;
}
-(NSArray *)arrayData3{
    
    if (!_arrayData3) {
        _arrayData3 = [[NSArray alloc] initWithObjects:@"text1",@"text2",@"text3", nil];
    }
    
    return _arrayData3;
}
-(NSArray *)arrayData4{
    
    if (!_arrayData4) {
        _arrayData4 = [[NSArray alloc] initWithObjects:@"txt1",@"txt2",@"txt3", nil];
    }
    
    return _arrayData4;
}

-(NSMutableArray *)arrayData5{
    
    if (!_arrayData5) {
        
        _arrayData5 = [NSMutableArray array];
    }
    
    return _arrayData5;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

//    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:_webView];
//    
//    NSString *path = [[NSBundle mainBundle] bundlePath];
//    NSURL *baseURL = [NSURL fileURLWithPath:path];
//    NSString * htmlPath = [[NSBundle mainBundle] pathForResource:@"home"
//                                                          ofType:@"html"];
//    NSString * htmlCont = [NSString stringWithContentsOfFile:htmlPath
//                                                    encoding:NSUTF8StringEncoding
//                                                       error:nil];
//    [_webView loadHTMLString:htmlCont baseURL:baseURL];
//    
//    _webView.delegate   = self;
    
    self.navigationItem.title = @"title";

    
    float width = 80;
    float height = 40;
    int number = 4;
    
    for (int i=0; i<4; i++) {
    
        float spacing = (kScreenWidth - number * width) / (number + 1);
        int row = i % number;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(spacing + (width + spacing) * row, 20, width, height);
        btn.backgroundColor = [UIColor greenColor];
        [btn setTitle:@"btn" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i + 100;
        [self.view addSubview:btn];
        
    }
    
        _rightTab = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _rightTab.delegate = self;
        _rightTab.dataSource = self;
        [self.view addSubview:_rightTab];
    [self.arrayData5 addObjectsFromArray:self.arrayData1];
    
}
-(void)btnClick:(UIButton *)btn{
    [self.arrayData5 removeAllObjects];
    switch (btn.tag) {
            
        case 100:
            [self.arrayData5 addObjectsFromArray:self.arrayData1];
            [_rightTab reloadData];
            NSLog(@"btn1");
            
            break;
            
        case 101:
            [self.arrayData5 addObjectsFromArray:self.arrayData2];
             [_rightTab reloadData];
            NSLog(@"btn2");
            
            break;
        
        case 102:
            [self.arrayData5 addObjectsFromArray:self.arrayData3];
             [_rightTab reloadData];
            NSLog(@"btn3");
            
            break;
            
        case 103:
            [self.arrayData5 addObjectsFromArray:self.arrayData4];
             [_rightTab reloadData];
            NSLog(@"btn4");
            
            break;
        default:
            break;
    }
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
      return self.arrayData5.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *str = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }

    
    cell.textLabel.text = self.arrayData5[indexPath.row];

    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(void)leftBar:(UIBarButtonItem *)bar{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
