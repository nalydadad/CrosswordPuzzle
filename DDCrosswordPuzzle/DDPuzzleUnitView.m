//
//  PuzzleView.m
//  DDCrosswordPuzzle
//
//  Created by DADA on 2016/12/5.
//  Copyright © 2016年 DADA. All rights reserved.
//

#import "DDPuzzleUnitView.h"

@implementation DDPuzzleUnitView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UITapGestureRecognizer *tgr =
        [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(isTapped)];
        [self addGestureRecognizer:tgr];
        
        
//        UIBezierPath *aPath = [UIBezierPath bezierPath];
//        [aPath setLineWidth:0.1];
//        [aPath moveToPoint:CGPointMake(0, 0)];
//        [aPath addLineToPoint:CGPointMake(0, self.frame.size.height)];
//        [aPath addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
//        [aPath addLineToPoint:CGPointMake(self.frame.size.width, 0)];
//        [aPath closePath];
//        CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
//        [shapeLayer setPath:aPath.CGPath];
//        [[self layer] addSublayer:shapeLayer];
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:self.label];
        
        [self setBackgroundColor:[UIColor blueColor]];
        
    }
    return self;
}

- (void) isTapped {
    [self.delegate isTapped:self];
}

@end
