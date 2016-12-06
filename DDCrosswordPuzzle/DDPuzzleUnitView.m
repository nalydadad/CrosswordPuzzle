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
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(1, 1, self.frame.size.width - 2, self.frame.size.height - 2)];
        [self.label setTextAlignment:NSTextAlignmentCenter];
        [self.label setBackgroundColor:[UIColor grayColor]];
        [self addSubview:self.label];
        [self setBackgroundColor:[UIColor blackColor]];
    }
    return self;
}

- (void) isTapped {
    [self.delegate isTapped:self];
}

@end
