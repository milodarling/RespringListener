#import <Preferences/Preferences.h>

@interface RespringListenerListController: PSListController {
}
@end

@implementation RespringListenerListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"RespringListener" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
