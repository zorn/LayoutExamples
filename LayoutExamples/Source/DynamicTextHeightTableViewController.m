#import "DynamicTextHeightTableViewController.h"
#import "DynamicTextHeightDetailViewController.h"

@interface DynamicTextHeightTableViewController ()
@property (strong, nonatomic) NSArray *fireflyCharacters;
@end

@implementation DynamicTextHeightTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self importFireflyCharacters];
}

- (void)importFireflyCharacters
{
    NSURL *fireflyCharactersURL = [[NSBundle mainBundle] URLForResource:@"firefly" withExtension:@"json"];
    NSData *fireflyCharactersData = [NSData dataWithContentsOfURL:fireflyCharactersURL];
    NSError *error = nil;
    self.fireflyCharacters = [NSJSONSerialization JSONObjectWithData:fireflyCharactersData options:0 error:&error];
    if (!self.fireflyCharacters) {
        NSLog(@"Could not import fireflyCharacters, had error: %@", error);
    }
}

#pragma mark - Actions

- (IBAction)doneAction:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"loadDetailSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        DynamicTextHeightDetailViewController *detailVC = [segue destinationViewController];
        detailVC.characterInfo = [self.fireflyCharacters objectAtIndex:indexPath.row];
    }
}

#pragma mark - UITableViewDataSource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"FireFly Characters";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.fireflyCharacters count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Basic";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSDictionary *characterInfo = [self.fireflyCharacters objectAtIndex:indexPath.row];
    cell.textLabel.text = [characterInfo valueForKey:@"character"];
    return cell;
}

@end
