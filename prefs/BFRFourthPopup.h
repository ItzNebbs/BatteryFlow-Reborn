#import <CepheiPrefs/HBListController.h>
#import <Preferences/PSSpecifier.h>

@interface BFRFourthPopup : HBListController {
	NSArray *_allSpecifiers;
}
- (void)applyModificationsToSpecifiers:(NSMutableArray *)specifiers;
- (void)removeDisabledGroups:(NSMutableArray *)specifiers;
@end