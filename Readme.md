Simple example to demonstrate adjusting the kerning of a UILabel.

Based on NSAttributedString, the code introduces a category so you can write

    label.kerning = -1.0;
    
after setting its text. The current implementation has some limitations, though. Read the comment for `setKerning:` to learn more about this.    