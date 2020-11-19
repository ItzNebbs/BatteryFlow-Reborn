#import <AudioToolbox/AudioServices.h>
#import <SpringBoard/SpringBoard.h>
#import <Cephei/HBPreferences.h>
#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <dlfcn.h>

static int kBannerLimit = 0;
static int kPopupLimit = 0;

static bool kEnabledBFR;
static int kAlertType;

static int kFirstBanner;
static int kSecondBanner;
static int kThirdBanner;
static int kFourthBanner;

static NSString *kFirstBannerTitle;
static NSString *kFirstBannerMessage;
static bool kFirstBannerVibration;

static NSString *kSecondBannerTitle;
static NSString *kSecondBannerMessage;
static bool kSecondBannerVibration;

static NSString *kThirdBannerTitle;
static NSString *kThirdBannerMessage;
static bool kThirdBannerVibration;

static NSString *kFourthBannerTitle;
static NSString *kFourthBannerMessage;
static bool kFourthBannerVibration;

static int kFirstPopup;
static int kSecondPopup;
static int kThirdPopup;
static int kFourthPopup;

static NSString *kFirstPopupTitle;
static NSString *kFirstPopupMessage;
static NSString *kFirstPopupOK;
static bool kFirstPopupVibration;

static NSString *kSecondPopupTitle;
static NSString *kSecondPopupMessage;
static NSString *kSecondPopupOK;
static bool kSecondPopupVibration;

static NSString *kThirdPopupTitle;
static NSString *kThirdPopupMessage;
static NSString *kThirdPopupOK;
static bool kThirdPopupVibration;

static NSString *kFourthPopupTitle;
static NSString *kFourthPopupMessage;
static NSString *kFourthPopupOK;
static bool kFourthPopupVibration;

@interface UIApplication (Private)
- (void)_simulateHomeButtonPress;
@end

@interface BFRBannerTester : NSObject
+ (void)firstBanner;
+ (void)secondBanner;
+ (void)thirdBanner;
+ (void)fourthBanner;
@end

@interface BFRPopupTester : NSObject
+ (void)firstPopup;
+ (void)secondPopup;
+ (void)thirdPopup;
+ (void)fourthPopup;
@end

@interface CPNotification : NSObject
+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message userInfo:(NSDictionary *)userInfo badgeCount:(int)badgeCount soundName:(NSString *)soundName delay:(double)delay repeats:(BOOL)repeats bundleId:(nonnull NSString *)bundleId uuid:(NSString *)uuid silent:(BOOL)silent;
+ (void)hideAlertWithBundleId:(NSString *)bundleId uuid:(NSString *)uuid;
@end