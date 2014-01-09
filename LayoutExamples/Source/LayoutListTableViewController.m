#import "LayoutListTableViewController.h"

typedef enum LayoutListExamples : NSUInteger {
    LayoutListExampleDynamicTextHeight = 0,
    LayoutListExampleDynamicCellHeight,
    LayoutListExampleMenuExpand
} LayoutListExamples;

@interface LayoutListTableViewController ()

@end

@implementation LayoutListTableViewController

- (void)launchDynamicTextHeight
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"DynamicTextHeight" bundle:nil];
    UINavigationController *navVC = [storyboard instantiateInitialViewController];
    [self presentViewController:navVC animated:YES completion:nil];
}

- (void)launchDynamicCellHeight
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"DynamicCellHeight" bundle:nil];
    UINavigationController *navVC = [storyboard instantiateInitialViewController];
    [self presentViewController:navVC animated:YES completion:nil];
}

- (void)launchMenuExpand
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MenuExpand" bundle:nil];
    UINavigationController *navVC = [storyboard instantiateInitialViewController];
    [self presentViewController:navVC animated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case LayoutListExampleDynamicTextHeight:
            [self launchDynamicTextHeight];
            break;
        case LayoutListExampleDynamicCellHeight:
            [self launchDynamicCellHeight];
            break;
        case LayoutListExampleMenuExpand:
            [self launchMenuExpand];
            break;
    }
}

@end
