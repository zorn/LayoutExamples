#import "MenuExpandViewController.h"

@interface MenuExpandViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintForBottomOfButtonAToTopOfButtonB;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintForBottomOfButtonAToTopOfSubmenuView;
@property (weak, nonatomic) IBOutlet UIView *submenuView;
@property (weak, nonatomic) IBOutlet UIButton *submenuButton;

@end

@implementation MenuExpandViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view sendSubviewToBack:self.submenuView];
}

#pragma mark - Actions

- (IBAction)doneAction:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)isSubmenuViewShowing
{
    return (self.constraintForBottomOfButtonAToTopOfSubmenuView.priority > 500);
}

- (IBAction)buttonAction:(id)sender
{
    CGFloat animationTime = 0.2;
    
    if ([self isSubmenuViewShowing]) {
        [UIView animateWithDuration:animationTime animations:^{
            self.submenuButton.alpha = 0.0;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:animationTime animations:^{
                self.constraintForBottomOfButtonAToTopOfSubmenuView.priority = 499;
                [self.view layoutIfNeeded];
            }];
        }];
    } else {
        [UIView animateWithDuration:animationTime animations:^{
            self.constraintForBottomOfButtonAToTopOfSubmenuView.priority = 501;
            [self.view layoutIfNeeded];
            
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:animationTime animations:^{
                self.submenuButton.alpha = 1.0;
            }];
        }];
    }
}

@end
