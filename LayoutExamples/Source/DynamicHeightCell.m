#import "DynamicHeightCell.h"

@implementation DynamicHeightCell

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // The below call to layoutSubviews on the table view cell's contentView should NOT be necessary.
    // However, in some (but not all!) cases it appears as though the super implementation does not call
    // layoutSubviews on the contentView, which causes all the UILabels to have a frame of CGRectZero.
    [self.contentView layoutSubviews];
    
    // Set the preferredMaxLayoutWidth of the mutli-line bioLabel based on the evaluated width of the label's frame,
    // as this will allow the text to wrap correctly, and as a result allow the label to take on the correct height.
    self.bioLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.bioLabel.frame);
}

@end
