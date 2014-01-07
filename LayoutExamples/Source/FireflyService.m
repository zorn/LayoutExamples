#import "FireflyService.h"

@implementation FireflyService

- (NSArray *)fireflyCharacters
{
    if (!_fireflyCharacters) {
        NSURL *fireflyCharactersURL = [[NSBundle mainBundle] URLForResource:@"firefly" withExtension:@"json"];
        NSData *fireflyCharactersData = [NSData dataWithContentsOfURL:fireflyCharactersURL];
        NSError *error = nil;
        _fireflyCharacters = [NSJSONSerialization JSONObjectWithData:fireflyCharactersData options:0 error:&error];
        if (!_fireflyCharacters) {
            NSLog(@"Could not import fireflyCharacters, had error: %@", error);
        }
    }
    return _fireflyCharacters;
}

@end
