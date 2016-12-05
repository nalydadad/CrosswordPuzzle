//
//  ViewController.m
//  DDCrosswordPuzzle
//
//  Created by DADA on 2016/12/5.
//  Copyright © 2016年 DADA. All rights reserved.
//

#import "DDPuzzleViewController.h"


@interface DDPuzzleViewController() {
    DDPuzzleUnitView *__strong*focusView;
}
@property(strong, nonatomic)NSMutableArray *puzzleUnits;
@property(strong, nonatomic)UITextField *textfield;

@end


@implementation DDPuzzleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    self.textfield = [[UITextField alloc]init];
    [self.textfield addTarget:self action:@selector(textChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.textfield setBackgroundColor:[UIColor greenColor]];
    self.textfield.delegate = self;
    self.puzzleUnits  = [[NSMutableArray alloc] init];
    [self addPuzzleMap];
    [self registerPuzzleUnit];
}

- (void) addPuzzleMap {
    [self.puzzleUnits removeAllObjects];
    CGRect frame = [[UIScreen mainScreen] bounds];
    float unitWidth = frame.size.width / 8;
    DDPuzzleUnitView *puzzleUnitView = [[DDPuzzleUnitView alloc]initWithFrame:CGRectMake(0, 0, unitWidth, unitWidth)];
    DDPuzzleUnitView *puzzleUnitView1 = [[DDPuzzleUnitView alloc]initWithFrame:CGRectMake(unitWidth, unitWidth, unitWidth, unitWidth)];
    DDPuzzleUnitView *puzzleUnitView2 = [[DDPuzzleUnitView alloc]initWithFrame:CGRectMake(200, 500, unitWidth, unitWidth)];
    [self.puzzleUnits addObject:puzzleUnitView];
    [self.puzzleUnits addObject:puzzleUnitView1];
    [self.puzzleUnits addObject:puzzleUnitView2];
}

- (void)registerPuzzleUnit {
    for (DDPuzzleUnitView *puzzleUnit in self.puzzleUnits) {
        puzzleUnit.delegate = self;
        [self.view addSubview:puzzleUnit];
    }
}

- (void) keyboardWillShow:(NSNotification*)notification {

}

- (void) keyboardWillHide:(NSNotification*)notification {
    
}


-(void)isTapped:(DDPuzzleUnitView *)view {
    [self.textfield removeFromSuperview];
    self->focusView = &view;
    self.textfield.text = (*self->focusView).textView.text;
    self.textfield.frame = view.frame;
    [self.view addSubview:self.textfield];
    
}

- (void) textChanged:(UITextField*)textField {
    if(textField.text.length > 1) {
        NSString *text = textField.text;
        textField.text = [text substringWithRange:NSMakeRange(0, 1)];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.textfield removeFromSuperview];
    (*self->focusView).textView.text = self.textfield.text;
    self.textfield.text = @"";
    return YES;
}

@end
