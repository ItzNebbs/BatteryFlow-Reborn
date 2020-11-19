#import "BFRRootListController.h"

@implementation BFRRootListController
+ (NSString *)hb_specifierPlist {
	return @"Root";
}
- (NSMutableArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
		[self applyModificationsToSpecifiers:_specifiers];
	}
	return _specifiers;
}
- (void)loadView {
	[super loadView];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]  initWithTitle:@"Apply" style:UIBarButtonItemStylePlain target:self action:@selector(apply:)];
}
- (void)applyModificationsToSpecifiers:(NSMutableArray *)specifiers {
	_allSpecifiers = [specifiers copy];
	[self removeDisabledGroups:specifiers];
}
- (void)removeDisabledGroups:(NSMutableArray *)specifiers {
	for (PSSpecifier *specifier in [specifiers reverseObjectEnumerator]) {
		NSNumber *nestedEntryCount = [[specifier properties] objectForKey:@"nestedEntryCount"];
		if (nestedEntryCount) {
			BOOL enabled = [[self readPreferenceValue:specifier] boolValue];
			if (!enabled) {
				NSMutableArray *nestedEntries = [[_allSpecifiers subarrayWithRange:NSMakeRange([_allSpecifiers indexOfObject:specifier]+1, [nestedEntryCount intValue])] mutableCopy];
				BOOL containsNestedEntries = NO;
				for (PSSpecifier *nestedEntry in nestedEntries) {
					NSNumber *nestedNestedEntryCount = [[nestedEntry properties] objectForKey:@"nestedEntryCount"];
					if (nestedNestedEntryCount) {
						containsNestedEntries = YES;
						break;
					}
				}
				if (containsNestedEntries) {
					[self removeDisabledGroups:nestedEntries];
				}
				[specifiers removeObjectsInArray:nestedEntries];
			}
		}
	}
}
- (void)setPreferenceValue:(id)value specifier:(PSSpecifier *)specifier {
	[super setPreferenceValue:value specifier:specifier];
	if (specifier.cellType == PSSwitchCell) {
		NSNumber *numValue = (NSNumber *)value;
		NSNumber *nestedEntryCount = [[specifier properties] objectForKey:@"nestedEntryCount"];
		if (nestedEntryCount) {
			NSInteger index = [_allSpecifiers indexOfObject:specifier];
			NSMutableArray *nestedEntries = [[_allSpecifiers subarrayWithRange:NSMakeRange(index + 1, [nestedEntryCount intValue])] mutableCopy];
			[self removeDisabledGroups:nestedEntries];
			if ([numValue boolValue]) {
				[self insertContiguousSpecifiers:nestedEntries afterSpecifier:specifier animated:YES];
			} else {
				[self removeContiguousSpecifiers:nestedEntries animated:YES];
			}
		}
	}
}
- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	CGRect frame = self.table.bounds;
	frame.origin.y = -frame.size.height;
	[self.navigationController.navigationController.navigationBar setShadowImage: [UIImage new]];
	self.navigationController.navigationController.navigationBar.translucent = YES;
}
- (void)apply:(id)sender {
	UIAlertController *ApplyChanges = [
		UIAlertController alertControllerWithTitle:@"Apply Changes?"
		message:@"Are you sure you want to apply changes?"
		preferredStyle:UIAlertControllerStyleAlert
	];
	UIAlertAction *noApply = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault handler:nil];
	UIAlertAction *yesApply = [
		UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
			pid_t pid;
			const char* args[] = {"sbreload", NULL, NULL};
			posix_spawn(&pid, "/usr/bin/sbreload", NULL, NULL, (char* const*)args, NULL);
		}
	];
	[ApplyChanges addAction:noApply];
	[ApplyChanges addAction:yesApply];
	[self presentViewController:ApplyChanges animated: YES completion: nil];
}
@end