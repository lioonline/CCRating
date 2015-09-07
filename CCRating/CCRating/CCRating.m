//
//  CCRating.m
//  CCRating
//
//  Created by Cocoa Lee on 9/7/15.
//  Copyright (c) 2015 Cocoa Lee. All rights reserved.
//

#import "CCRating.h"

@interface CCRating()

@property (nonatomic,strong)NSMutableArray *ratingArray;
@property (nonatomic,assign)float  index;

@end


@implementation CCRating

-(id)initWithFrame:(CGRect)frame andTotal:(float)total{
    self = [super initWithFrame:frame];
    if (self) {
        [self drawRatingWithNum:total];
        _index = 0;
    }
    
    return self;
}

-(void)drawRatingWithNum:(float )num{
    
    _ratingArray = [NSMutableArray array];
    float d = (CGRectGetWidth(self.bounds) - (30 *num))/(num + 1.0);
    
    for (int i = 0; i < num; i ++) {
        UIButton *button = [UIButton new];
        [button setImage:[UIImage imageNamed:@"dk_ wrench"] forState:normal];
        [button setImage:[UIImage imageNamed:@"dk_ wrench_sel"] forState:UIControlStateSelected];
        [button setImage:[UIImage imageNamed:@"dk_ wrench_sel"] forState:UIControlStateHighlighted];
        button.frame = CGRectMake((30 + d)*i + d, CGRectGetHeight(self.bounds)/2.0-15, 30, 30);
        [self addSubview:button];
        button.tag = i;
        button.selected = NO;
        [button addTarget:self action:@selector(changRating:) forControlEvents:UIControlEventTouchUpInside];
        [_ratingArray addObject:button];
    }
    
}

-(void)changRating:(UIButton *)button{
  
    
    for (UIButton *btn in _ratingArray) {
        if (btn.tag < button.tag || btn.tag == button.tag) {
            btn.selected = YES;
        }
        else{
            btn.selected = NO;
        }
    }
    
    
    _index = button.tag;
    
    
    if ([self.delegate respondsToSelector:@selector(CCRating:clickAtIndex:)]) {
        [self.delegate CCRating:self clickAtIndex:_index + 1];
    }
    
}


-(void)setCCRatingValue:(float )value{
    
    value = value - 1;
    for (UIButton *btn in _ratingArray) {
        if (btn.tag < value || btn.tag  == value) {
            btn.selected = YES;
        }
        else{
            btn.selected = NO;
        }
    }
    
    
    
    
    
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
