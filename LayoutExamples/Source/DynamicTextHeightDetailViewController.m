#import "DynamicTextHeightDetailViewController.h"

@interface DynamicTextHeightDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bioLabel;
@end

@implementation DynamicTextHeightDetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
    [self reportInfo]; // For Debugging
}

- (void)updateUI
{
    self.nameLabel.text = [self.characterInfo valueForKey:@"character"];
    self.bioLabel.text = [self.characterInfo valueForKey:@"bio"];
}

// To make this adjustment from the view controller level...
//- (void)viewDidLayoutSubviews
//{
//    [super viewDidLayoutSubviews];
//    self.bioLabel.preferredMaxLayoutWidth = self.bioLabel.frame.size.width;
//    [self.view layoutIfNeeded];
//}

#pragma mark - Debugging Help

- (void)reportInfo
{
    NSLog(@"self.bioLabel.preferredMaxLayoutWidth %f", self.bioLabel.preferredMaxLayoutWidth);
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self reportInfo];
}

@end
