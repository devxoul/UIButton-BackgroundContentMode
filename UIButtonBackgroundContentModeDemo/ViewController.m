// The MIT License (MIT)
//
// Copyright (c) 2015 Suyeol Jeon (http://xoul.kr)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#import "ViewController.h"
#import <UIButton_BackgroundContentMode/UIButton+BackgroundContentMode.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    button.backgroundColor = [UIColor blackColor];
    button.layer.cornerRadius = 100;
    button.clipsToBounds = YES;
    button.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    button.backgroundContentMode = UIViewContentModeScaleAspectFill;
    [button setBackgroundImage:[UIImage imageNamed:@"picture"] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:24];
    button.titleLabel.layer.shadowColor = [UIColor blackColor].CGColor;
    button.titleLabel.layer.shadowOpacity = 0.85;
    button.titleLabel.layer.shadowRadius = 4;
    button.titleLabel.layer.shadowOffset = CGSizeMake(0, 2);
    [button setTitle:@"Paris" forState:UIControlStateNormal];
    [self.view addSubview:button];
}

@end
