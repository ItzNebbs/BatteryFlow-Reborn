#import <CepheiPrefs/HBListController.h>
#import <Preferences/PSSpecifier.h>
#import <NEBLinkCell.h>
#import <spawn.h>

@interface BFRRootListController : HBListController {
	NSArray *_allSpecifiers;
}
- (void)applyModificationsToSpecifiers:(NSMutableArray *)specifiers;
- (void)removeDisabledGroups:(NSMutableArray *)specifiers;
- (void)apply:(id)sender;
@end