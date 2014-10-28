#import <Preferences/Preferences.h>

@interface SpringBoard : UIApplication
- (void)_relaunchSpringBoardNow;
- (void)reboot;
- (void)powerDown;
@end

static void respring(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
    [(SpringBoard *)[UIApplication sharedApplication] _relaunchSpringBoardNow];
}

static void reboot(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
    [(SpringBoard *)[UIApplication sharedApplication] reboot];
}
static void powerOff(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
    [(SpringBoard *)[UIApplication sharedApplication] powerDown];
}


%ctor {
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                NULL,
                                (CFNotificationCallback)respring,
                                CFSTR("respringDevice"),
                                NULL,
                                CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                NULL,
                                (CFNotificationCallback)reboot,
                                CFSTR("rebootDevice"),
                                NULL,
                                CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                NULL,
                                (CFNotificationCallback)powerOff,
                                CFSTR("powerOffDevice"),
                                NULL,
                                CFNotificationSuspensionBehaviorDeliverImmediately);
}