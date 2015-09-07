//
//  ViewController.m
//  CCRating
//
//  Created by Cocoa Lee on 9/7/15.
//  Copyright (c) 2015 Cocoa Lee. All rights reserved.
//

#import "ViewController.h"
#import "CCRating.h"
@interface ViewController ()<CCRatingDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CCRating *rating = [[CCRating alloc] initWithFrame:CGRectMake(16, 120, CGRectGetWidth(self.view.bounds) - 32, 44) andTotal:5];
    rating.delegate = self;
//    设置分数
    [rating setCCRatingValue:3];
    [self.view addSubview:rating];
    
    
    
}


-(void)CCRating:(CCRating *)tating clickAtIndex:(float)index{
    NSLog(@"点击了：%g",index);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
