//
//  PuzzleView.h
//  DDCrosswordPuzzle
//
//  Created by DADA on 2016/12/5.
//  Copyright © 2016年 DADA. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DDPuzzleUnitView;
@protocol DDPuzzleUnitViewDelegate
- (void)isTapped:(DDPuzzleUnitView*)view;
@end

@interface DDPuzzleUnitView : UIView

@property(weak, nonatomic)id<DDPuzzleUnitViewDelegate>delegate;
@property(strong, nonatomic)UITextView *textView;
@end
