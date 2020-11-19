#import <CepheiPrefs/HBListController.h>
#import <Preferences/PSSpecifier.h>

@interface BFRThirdPopup : HBListController {
	NSArray *_allSpecifiers;
}
- (void)applyModificationsToSpecifiers:(NSMutableArray *)specifiers;
- (void)removeDisabledGroups:(NSMutableArray *)specifiers;
@end