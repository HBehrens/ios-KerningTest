//
//  ViewController.m
//  KerningTest
//
//  Created by Heiko Behrens on 11.07.13.
//  Copyright (c) 2013 Heiko Behrens. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *testLabel;
@property (weak, nonatomic) IBOutlet UILabel *debugLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (nonatomic) CGFloat kerning;

@end


@interface UILabel (Kerning)

// NOTE: whenever self.text /.attributedText will be set, the current kerning will be lost
// use an associated value objc_setAssociatedObject to keep knowledge of the value,
// then, swizzle #setText: and #setAttributedText: to reapply the kerning after calling super
-(void)setKerning:(CGFloat)kerning;

@end

@implementation UILabel (Kerning)

-(void)setKerning:(CGFloat)kerning {
    NSMutableAttributedString *attributedString = [NSMutableAttributedString.alloc initWithString:self.text];
    [attributedString addAttribute:NSKernAttributeName value:@(kerning) range:NSMakeRange(0, attributedString.length)];
    self.attributedText = attributedString;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.kerning = 0;
}

-(void)setKerning:(CGFloat)kerning {
    _kerning = kerning;
    self.slider.value = kerning;
    self.debugLabel.text = [NSString stringWithFormat:@"%.2f", kerning];
    self.testLabel.kerning = kerning;
}

- (IBAction)sliderChanged:(UISlider*)sender {
    self.kerning = sender.value;
}

- (IBAction)resetKerning:(id)sender {
    self.kerning = 0;
}


@end
