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
}

- (void)updateUI
{
    self.nameLabel.text = [self.characterInfo valueForKey:@"character"];
    self.bioLabel.text = [self.characterInfo valueForKey:@"bio"];
}

@end
