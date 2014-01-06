#import "LayoutListTableViewController.h"

typedef enum LayoutListExamples : NSUInteger {
    LayoutListExampleDynamicTextHeight = 0
} LayoutListExamples;

@interface LayoutListTableViewController ()

@end

@implementation LayoutListTableViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == LayoutListExampleDynamicTextHeight) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"DynamicTextHeight" bundle:nil];
        UINavigationController *navVC = [storyboard instantiateInitialViewController];
        [self presentViewController:navVC animated:YES completion:nil];
    }
}

@end
