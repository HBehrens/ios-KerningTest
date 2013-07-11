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
	// Do any additional setup after loading the view, typically from a nib.
    self.kerning = 0;
}

-(void)setKerning:(CGFloat)kerning {
    _kerning = kerning;
    self.slider.value = kerning;
    self.testLabel.kerning = kerning;
}


- (IBAction)sliderChanged:(UISlider*)sender {
    self.kerning = sender.value;
}

- (IBAction)resetKerning:(id)sender {
    self.kerning = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
