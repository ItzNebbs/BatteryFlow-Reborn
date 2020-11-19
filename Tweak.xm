#import "Tweak.h"

@implementation BFRBannerTester
+ (void)firstBanner {
	[[UIApplication sharedApplication] _simulateHomeButtonPress];
	void *handle = dlopen("/usr/lib/libnotifications.dylib", RTLD_LAZY);
	if (handle != NULL) {
		NSString *uid = [[NSUUID UUID] UUIDString];
		[objc_getClass("CPNotification") showAlertWithTitle:kFirstBannerTitle message:kFirstBannerMessage userInfo:@{@"" : @""} badgeCount:1 soundName:nil delay:1.00 repeats:NO bundleId:@"com.apple.Preferences" uuid:uid silent:!kFirstBannerVibration];
		dlclose(handle);
	}
}
+ (void)secondBanner {
	[[UIApplication sharedApplication] _simulateHomeButtonPress];
	void *handle = dlopen("/usr/lib/libnotifications.dylib", RTLD_LAZY);
	if (handle != NULL) {
		NSString *uid = [[NSUUID UUID] UUIDString];
		[objc_getClass("CPNotification") showAlertWithTitle:kSecondBannerTitle message:kSecondBannerMessage userInfo:@{@"" : @""} badgeCount:1 soundName:nil delay:1.00 repeats:NO bundleId:@"com.apple.Preferences" uuid:uid silent:!kSecondBannerVibration];
		dlclose(handle);
	}
}
+ (void)thirdBanner {
	[[UIApplication sharedApplication] _simulateHomeButtonPress];
	void *handle = dlopen("/usr/lib/libnotifications.dylib", RTLD_LAZY);
	if (handle != NULL) {
		NSString *uid = [[NSUUID UUID] UUIDString];
		[objc_getClass("CPNotification") showAlertWithTitle:kThirdBannerTitle message:kThirdBannerMessage userInfo:@{@"" : @""} badgeCount:1 soundName:nil delay:1.00 repeats:NO bundleId:@"com.apple.Preferences" uuid:uid silent:!kThirdBannerVibration];
		dlclose(handle);
	}
}
+ (void)fourthBanner {
	[[UIApplication sharedApplication] _simulateHomeButtonPress];
	void *handle = dlopen("/usr/lib/libnotifications.dylib", RTLD_LAZY);
	if (handle != NULL) {
		NSString *uid = [[NSUUID UUID] UUIDString];
		[objc_getClass("CPNotification") showAlertWithTitle:kFourthBannerTitle message:kFourthBannerMessage userInfo:@{@"" : @""} badgeCount:1 soundName:nil delay:1.00 repeats:NO bundleId:@"com.apple.Preferences" uuid:uid silent:!kFourthBannerVibration];
		dlclose(handle);
	}
}
@end

@implementation BFRPopupTester
+ (void)firstPopup {
	UIAlertController *BFRFirstPopup = [
		UIAlertController alertControllerWithTitle:kFirstPopupTitle
		message:kFirstPopupMessage
		preferredStyle:UIAlertControllerStyleAlert
	];
	UIAlertAction *BFRDismissAlert = [
		UIAlertAction actionWithTitle:kFirstPopupOK
		style:UIAlertActionStyleDefault
		handler:nil
	];
	[BFRFirstPopup addAction:BFRDismissAlert];
	[[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:BFRFirstPopup animated: YES completion: nil];
}
+ (void)secondPopup {
	UIAlertController *BFRSecondPopup = [
		UIAlertController alertControllerWithTitle:kSecondPopupTitle
		message:kSecondPopupMessage
		preferredStyle:UIAlertControllerStyleAlert
	];
	UIAlertAction *BFRDismissAlert = [
		UIAlertAction actionWithTitle:kSecondPopupOK
		style:UIAlertActionStyleDefault
		handler:nil
	];
	[BFRSecondPopup addAction:BFRDismissAlert];
	[[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:BFRSecondPopup animated: YES completion: nil];
}
+ (void)thirdPopup {
	UIAlertController *BFRThirdPopup = [
		UIAlertController alertControllerWithTitle:kThirdPopupTitle
		message:kThirdPopupMessage
		preferredStyle:UIAlertControllerStyleAlert
	];
	UIAlertAction *BFRDismissAlert = [
		UIAlertAction actionWithTitle:kThirdPopupOK
		style:UIAlertActionStyleDefault
		handler:nil
	];
	[BFRThirdPopup addAction:BFRDismissAlert];
	[[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:BFRThirdPopup animated: YES completion: nil];
}
+ (void)fourthPopup {
	UIAlertController *BFRFourthPopup = [
		UIAlertController alertControllerWithTitle:kFourthPopupTitle
		message:kFourthPopupMessage
		preferredStyle:UIAlertControllerStyleAlert
	];
	UIAlertAction *BFRDismissAlert = [
		UIAlertAction actionWithTitle:kFourthPopupOK
		style:UIAlertActionStyleDefault
		handler:nil
	];
	[BFRFourthPopup addAction:BFRDismissAlert];
	[[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:BFRFourthPopup animated: YES completion: nil];
}
@end

%hook SBLowPowerAlertItem
	+ (unsigned)_thresholdForLevel:(unsigned)level {
		// Banners
		if (!([kFirstBannerTitle rangeOfString:@"%p"].location == NSNotFound)) {
			kFirstBannerTitle = [kFirstBannerTitle stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
		}
		if (!([kFirstBannerMessage rangeOfString:@"%p"].location == NSNotFound)) {
			kFirstBannerMessage = [kFirstBannerMessage stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
		}
		if (!([kSecondBannerTitle rangeOfString:@"%p"].location == NSNotFound)) {
			kSecondBannerTitle = [kSecondBannerTitle stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
		}
		if (!([kSecondBannerMessage rangeOfString:@"%p"].location == NSNotFound)) {
			kSecondBannerMessage = [kSecondBannerMessage stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
		}
		if (!([kThirdBannerTitle rangeOfString:@"%p"].location == NSNotFound)) {
			kThirdBannerTitle = [kThirdBannerTitle stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
		}
		if (!([kThirdBannerMessage rangeOfString:@"%p"].location == NSNotFound)) {
			kThirdBannerMessage = [kThirdBannerMessage stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
		}
		if (!([kFourthBannerTitle rangeOfString:@"%p"].location == NSNotFound)) {
			kFourthBannerTitle = [kFourthBannerTitle stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
		}
		if (!([kFourthBannerMessage rangeOfString:@"%p"].location == NSNotFound)) {
			kFourthBannerMessage = [kFourthBannerMessage stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
		}
		// Popups
		if (!([kFirstPopupTitle rangeOfString:@"%p"].location == NSNotFound)) {
			kFirstPopupTitle = [kFirstPopupTitle stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
		}
		if (!([kFirstPopupMessage rangeOfString:@"%p"].location == NSNotFound)) {
			kFirstPopupMessage = [kFirstPopupMessage stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
		}
		if (!([kFirstPopupOK rangeOfString:@"%p"].location == NSNotFound)) {
			kFirstPopupOK = [kFirstPopupOK stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
		}
		if (!([kSecondPopupTitle rangeOfString:@"%p"].location == NSNotFound)) {
			kSecondPopupTitle = [kSecondPopupTitle stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
		}
		if (!([kSecondPopupMessage rangeOfString:@"%p"].location == NSNotFound)) {
			kSecondPopupMessage = [kSecondPopupMessage stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
		}
		if (!([kSecondPopupOK rangeOfString:@"%p"].location == NSNotFound)) {
			kSecondPopupOK = [kSecondPopupOK stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
		}
		if (!([kThirdPopupTitle rangeOfString:@"%p"].location == NSNotFound)) {
			kThirdPopupTitle = [kThirdPopupTitle stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
		}
		if (!([kThirdPopupMessage rangeOfString:@"%p"].location == NSNotFound)) {
			kThirdPopupMessage = [kThirdPopupMessage stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
		}
		if (!([kThirdPopupOK rangeOfString:@"%p"].location == NSNotFound)) {
			kThirdPopupOK = [kThirdPopupOK stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
		}
		if (!([kFourthPopupTitle rangeOfString:@"%p"].location == NSNotFound)) {
			kFourthPopupTitle = [kFourthPopupTitle stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
		}
		if (!([kFourthPopupMessage rangeOfString:@"%p"].location == NSNotFound)) {
			kFourthPopupMessage = [kFourthPopupMessage stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
		}
		if (!([kFourthPopupOK rangeOfString:@"%p"].location == NSNotFound)) {
			kFourthPopupOK = [kFourthPopupOK stringByReplacingOccurrencesOfString:@"%p" withString:[NSString stringWithFormat:@"%u%%", level]];
		}
		// Tweak
		[[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
		if (!([[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateCharging)) {
			if (kAlertType == 0) {
				// Do Nothing
			} else if (kAlertType == 1) {
				// Banners
				if (level == kFirstBanner && kBannerLimit == 0) {
					void *handle = dlopen("/usr/lib/libnotifications.dylib", RTLD_LAZY);
					if (handle != NULL) {
						NSString *uid = [[NSUUID UUID] UUIDString];
						[objc_getClass("CPNotification") showAlertWithTitle:kFirstBannerTitle message:kFirstBannerMessage userInfo:@{@"" : @""} badgeCount:1 soundName:nil delay:1.00 repeats:NO bundleId:@"com.apple.Preferences" uuid:uid silent:!kFirstBannerVibration];
						dlclose(handle);
					}
					kBannerLimit = 1;
				}
				if (level == kSecondBanner && kBannerLimit == 0) {
					void *handle = dlopen("/usr/lib/libnotifications.dylib", RTLD_LAZY);
					if (handle != NULL) {
						NSString *uid = [[NSUUID UUID] UUIDString];
						[objc_getClass("CPNotification") showAlertWithTitle:kSecondBannerTitle message:kSecondBannerMessage userInfo:@{@"" : @""} badgeCount:1 soundName:nil delay:1.00 repeats:NO bundleId:@"com.apple.Preferences" uuid:uid silent:!kSecondBannerVibration];
						dlclose(handle);
					}
					kBannerLimit = 1;
				}
				if (level == kThirdBanner && kBannerLimit == 0) {
					void *handle = dlopen("/usr/lib/libnotifications.dylib", RTLD_LAZY);
					if (handle != NULL) {
						NSString *uid = [[NSUUID UUID] UUIDString];
						[objc_getClass("CPNotification") showAlertWithTitle:kThirdBannerTitle message:kThirdBannerMessage userInfo:@{@"" : @""} badgeCount:1 soundName:nil delay:1.00 repeats:NO bundleId:@"com.apple.Preferences" uuid:uid silent:!kThirdBannerVibration];
						dlclose(handle);
					}
					kBannerLimit = 1;
				}
				if (level == kFourthBanner && kBannerLimit == 0) {
					void *handle = dlopen("/usr/lib/libnotifications.dylib", RTLD_LAZY);
					if (handle != NULL) {
						NSString *uid = [[NSUUID UUID] UUIDString];
						[objc_getClass("CPNotification") showAlertWithTitle:kFourthBannerTitle message:kFourthBannerMessage userInfo:@{@"" : @""} badgeCount:1 soundName:nil delay:1.00 repeats:NO bundleId:@"com.apple.Preferences" uuid:uid silent:!kFourthBannerVibration];
						dlclose(handle);
					}
					kBannerLimit = 1;
				}
			} else if (kAlertType == 2) {
				// Popups
				if (level == kFirstPopup && kPopupLimit == 0) {
					UIAlertController *BFRFirstPopup = [
						UIAlertController alertControllerWithTitle:kFirstPopupTitle
						message:kFirstPopupMessage
						preferredStyle:UIAlertControllerStyleAlert
					];
					UIAlertAction *BFRDismissAlert = [
						UIAlertAction actionWithTitle:kFirstPopupOK
						style:UIAlertActionStyleDefault
						handler:nil
					];
					[BFRFirstPopup addAction:BFRDismissAlert];
					[[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:BFRFirstPopup animated: YES completion: nil];
					if (kFirstPopupVibration) {
						AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
					}
					kPopupLimit = 1;
				}
				if (level == kSecondPopup && kPopupLimit == 0) {
					UIAlertController *BFRSecondPopup = [
						UIAlertController alertControllerWithTitle:kSecondPopupTitle
						message:kSecondPopupMessage
						preferredStyle:UIAlertControllerStyleAlert
					];
					UIAlertAction *BFRDismissAlert = [
						UIAlertAction actionWithTitle:kSecondPopupOK
						style:UIAlertActionStyleDefault
						handler:nil
					];
					[BFRSecondPopup addAction:BFRDismissAlert];
					[[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:BFRSecondPopup animated: YES completion: nil];
					if (kSecondPopupVibration) {
						AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
					}
					kPopupLimit = 1;
				}
				if (level == kThirdPopup && kPopupLimit == 0) {
					UIAlertController *BFRThirdPopup = [
						UIAlertController alertControllerWithTitle:kThirdPopupTitle
						message:kThirdPopupMessage
						preferredStyle:UIAlertControllerStyleAlert
					];
					UIAlertAction *BFRDismissAlert = [
						UIAlertAction actionWithTitle:kThirdPopupOK
						style:UIAlertActionStyleDefault
						handler:nil
					];
					[BFRThirdPopup addAction:BFRDismissAlert];
					[[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:BFRThirdPopup animated: YES completion: nil];
					if (kThirdPopupVibration) {
						AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
					}
					kPopupLimit = 1;
				}
				if (level == kFourthPopup && kPopupLimit == 0) {
					UIAlertController *BFRFourthPopup = [
						UIAlertController alertControllerWithTitle:kFourthPopupTitle
						message:kFourthPopupMessage
						preferredStyle:UIAlertControllerStyleAlert
					];
					UIAlertAction *BFRDismissAlert = [
						UIAlertAction actionWithTitle:kFourthPopupOK
						style:UIAlertActionStyleDefault
						handler:nil
					];
					[BFRFourthPopup addAction:BFRDismissAlert];
					[[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:BFRFourthPopup animated: YES completion: nil];
					if (kFourthPopupVibration) {
						AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
					}
					kPopupLimit = 1;
				}
			}
		} else if ([[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateCharging) {
			// Do Nothing
		}
		if ((level == kFirstBanner - 1 || level == kFirstBanner + 1 || level == kSecondBanner - 1 || level == kSecondBanner + 1 || level == kThirdBanner - 1 || level == kThirdBanner + 1 || level == kFourthBanner - 1 || level == kFourthBanner + 1) && kBannerLimit == 1) {
			kBannerLimit = 0;
		}
		if ((level == kFirstPopup - 1 || level == kFirstPopup + 1 || level == kSecondPopup - 1 || level == kSecondPopup + 1 || level == kThirdPopup - 1 || level == kThirdPopup + 1 || level == kFourthPopup - 1 || level == kFourthPopup + 1) && kPopupLimit == 1) {
			kPopupLimit = 0;
		}
		return 99;
	}
%end

void testFirstBanner() {
	[BFRBannerTester firstBanner];
}

void testSecondBanner() {
	[BFRBannerTester secondBanner];
}

void testThirdBanner() {
	[BFRBannerTester thirdBanner];
}

void testFourthBanner() {
	[BFRBannerTester fourthBanner];
}

void testFirstPopup() {
	[BFRPopupTester firstPopup];
}

void testSecondPopup() {
	[BFRPopupTester secondPopup];
}

void testThirdPopup() {
	[BFRPopupTester thirdPopup];
}

void testFourthPopup() {
	[BFRPopupTester fourthPopup];
}

void BFREnable() {
	if (kEnabledBFR) {
		%init();
	}
}

void BFRLoad() {
	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"xyz.itznebbs.batteryflow-reborn"];
	kEnabledBFR = [[prefs objectForKey:@"kEnabledBFR"] boolValue];
	kAlertType = [[prefs objectForKey:@"kAlertType"] intValue];
	// Banners
	kFirstBanner = [[prefs objectForKey:@"kFirstBanner"] integerValue];
	kFirstBannerTitle = [prefs objectForKey:@"kFirstBannerTitle"];
	kFirstBannerMessage = [prefs objectForKey:@"kFirstBannerMessage"];
	kFirstBannerVibration = [[prefs objectForKey:@"kFirstBannerVibration"] boolValue];
	kSecondBanner = [[prefs objectForKey:@"kSecondBanner"] integerValue];
	kSecondBannerTitle = [prefs objectForKey:@"kSecondBannerTitle"];
	kSecondBannerMessage = [prefs objectForKey:@"kSecondBannerMessage"];
	kSecondBannerVibration = [[prefs objectForKey:@"kSecondBannerVibration"] boolValue];
	kThirdBanner = [[prefs objectForKey:@"kThirdBanner"] integerValue];
	kThirdBannerTitle = [prefs objectForKey:@"kThirdBannerTitle"];
	kThirdBannerMessage = [prefs objectForKey:@"kThirdBannerMessage"];
	kThirdBannerVibration = [[prefs objectForKey:@"kThirdBannerVibration"] boolValue];
	kFourthBanner = [[prefs objectForKey:@"kFourthBanner"] integerValue];
	kFourthBannerTitle = [prefs objectForKey:@"kFourthBannerTitle"];
	kFourthBannerMessage = [prefs objectForKey:@"kFourthBannerMessage"];
	kFourthBannerVibration = [[prefs objectForKey:@"kFourthBannerVibration"] boolValue];
	// Popups
	kFirstPopup = [[prefs objectForKey:@"kFirstPopup"] integerValue];
	kFirstPopupTitle = [prefs objectForKey:@"kFirstPopupTitle"];
	kFirstPopupMessage = [prefs objectForKey:@"kFirstPopupMessage"];
	kFirstPopupOK = [prefs objectForKey:@"kFirstPopupOK"];
	kFirstPopupVibration = [[prefs objectForKey:@"kFirstPopupVibration"] boolValue];
	kSecondPopup = [[prefs objectForKey:@"kSecondPopup"] integerValue];
	kSecondPopupTitle = [prefs objectForKey:@"kSecondPopupTitle"];
	kSecondPopupMessage = [prefs objectForKey:@"kSecondPopupMessage"];
	kSecondPopupOK = [prefs objectForKey:@"kSecondPopupOK"];
	kSecondPopupVibration = [[prefs objectForKey:@"kSecondPopupVibration"] boolValue];
	kThirdPopup = [[prefs objectForKey:@"kThirdPopup"] integerValue];
	kThirdPopupTitle = [prefs objectForKey:@"kThirdPopupTitle"];
	kThirdPopupMessage = [prefs objectForKey:@"kThirdPopupMessage"];
	kThirdPopupOK = [prefs objectForKey:@"kThirdPopupOK"];
	kThirdPopupVibration = [[prefs objectForKey:@"kThirdPopupVibration"] boolValue];
	kFourthPopup = [[prefs objectForKey:@"kFourthPopup"] integerValue];
	kFourthPopupTitle = [prefs objectForKey:@"kFourthPopupTitle"];
	kFourthPopupMessage = [prefs objectForKey:@"kFourthPopupMessage"];
	kFourthPopupOK = [prefs objectForKey:@"kFourthPopupOK"];
	kFourthPopupVibration = [[prefs objectForKey:@"kFourthPopupVibration"] boolValue];
	BFREnable();
}

%ctor {
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)testFirstBanner, CFSTR("xyz.itznebbs.batteryflow-reborn/firstbannertest"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)testSecondBanner, CFSTR("xyz.itznebbs.batteryflow-reborn/secondbannertest"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)testThirdBanner, CFSTR("xyz.itznebbs.batteryflow-reborn/thirdbannertest"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)testFourthBanner, CFSTR("xyz.itznebbs.batteryflow-reborn/fourthbannertest"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)testFirstPopup, CFSTR("xyz.itznebbs.batteryflow-reborn/firstpopuptest"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)testSecondPopup, CFSTR("xyz.itznebbs.batteryflow-reborn/secondpopuptest"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)testThirdPopup, CFSTR("xyz.itznebbs.batteryflow-reborn/thirdpopuptest"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)testFourthPopup, CFSTR("xyz.itznebbs.batteryflow-reborn/fourthpopuptest"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	BFRLoad();
}