#import "DynamicTextHeightLabel.h"

@implementation DynamicTextHeightLabel

- (void)layoutSubviews
{
    self.preferredMaxLayoutWidth = self.frame.size.width;
    [super layoutSubviews];
}

@end
