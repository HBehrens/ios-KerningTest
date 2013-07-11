Simple example to demonstrate adjusting the kerning of a UILabel.

Based on NSAttributedString, the code introduces a category so you can write

    label.kerning = -1.0;
    
after setting its text. The demo has been tests on iOS 6.0 to 7.0.DP3 compiled agains SDK 6.0 and SDK 7.0.DP3.


The current implementation has some limitations, though. Read the comment for `setKerning:` to learn more about this.    
