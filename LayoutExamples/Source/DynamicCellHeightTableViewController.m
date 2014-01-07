#import "DynamicCellHeightTableViewController.h"
#import "FireflyService.h"
#import "DynamicHeightCell.h"

static NSString *dynamicHeightCellID = @"DynamicHeightCell";

@interface DynamicCellHeightTableViewController ()
@property (strong, nonatomic) NSArray *fireflyCharacters;
@end

@implementation DynamicCellHeightTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self importFireflyCharacters];
}

- (void)importFireflyCharacters
{
    FireflyService *fireflyService = [[FireflyService alloc] init];
    self.fireflyCharacters = [fireflyService fireflyCharacters];
}

#pragma mark - Actions

- (IBAction)doneAction:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.fireflyCharacters count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DynamicHeightCell *cell = [tableView dequeueReusableCellWithIdentifier:dynamicHeightCellID forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(DynamicHeightCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *characterInfo = [self.fireflyCharacters objectAtIndex:indexPath.row];
    cell.nameLabel.text = [characterInfo valueForKey:@"character"];
    cell.bioLabel.text = [characterInfo valueForKey:@"bio"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static DynamicHeightCell *offscreenCell;
    
    if (!offscreenCell) {
        offscreenCell = [tableView dequeueReusableCellWithIdentifier:dynamicHeightCellID];
    }
    [self configureCell:offscreenCell atIndexPath:indexPath];
    
    [offscreenCell.contentView setNeedsLayout];
    [offscreenCell.contentView layoutIfNeeded];
    
    CGSize maximumSize = CGSizeMake(320.0, UILayoutFittingCompressedSize.height);
    CGFloat height = [offscreenCell.contentView systemLayoutSizeFittingSize:maximumSize].height;
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

@end
