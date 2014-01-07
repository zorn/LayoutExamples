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
    DynamicHeightCell *cell = [tableView dequeueReusableCellWithIdentifier:dynamicHeightCellID];
    
    // Configure the cell for this indexPath
    [self configureCell:cell atIndexPath:indexPath];
    
    // Set the width of the cell to match the width of the table view. This is important so that we'll get the
    // correct height for different table view widths, since our cell's height depends on its width due to
    // the multi-line UILabel word wrapping. Don't need to do this above in -[tableView:cellForRowAtIndexPath]
    // because it happens automatically when the cell is used in the table view.
    cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
    
    // Do the layout pass on the cell, which will calculate the frames for all the views based on the constraints
    // (Note that the preferredMaxLayoutWidth is set on multi-line UILabels inside the -[layoutSubviews] method
    // in the UITableViewCell subclass
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    // Get the actual height required for the cell
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    
    // Add an extra point to the height to account for internal rounding errors that are occasionally observed in
    // the Auto Layout engine, which cause the returned height to be slightly too small in some cases.
    height += 1;
    
    return height;
}


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150.0f;
}

@end
