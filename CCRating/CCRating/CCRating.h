//
//  CCRating.h
//  CCRating
//
//  Created by Cocoa Lee on 9/7/15.
//  Copyright (c) 2015 Cocoa Lee. All rights reserved.
//

#import <UIKit/UIKit.h>




@class CCRating;

@protocol CCRatingDelegate <NSObject>

-(void)CCRating:(CCRating*)tating clickAtIndex:(float )index;

@end


@interface CCRating : UIView

@property (nonatomic,assign) id <CCRatingDelegate > delegate;
/**
 *  初始化 frame 和 总数
 *
 *  @param frame frame
 *  @param total 总数
 *
 *  @return id
 */
-(id)initWithFrame:(CGRect)frame andTotal:(float )total;

-(void)setCCRatingValue:(float )value;



@end
