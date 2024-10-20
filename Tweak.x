#import <UIKit/UIKit.h>

%hook BCBatteryDevice

- (BOOL)isCharging {
    return NO;
}

- (NSInteger)percentCharge {
    return 100;
}

%end

%hook _UIStatusBarStringView

- (void)setText:(NSString *)text {
    if ([text containsString:@":"]) {
        text = @"9:41";
    }

    %orig;
}

%end

%hook _UIStatusBarDataCellularEntry

- (NSInteger)type {
  return 5;
}

- (NSInteger)status {
  return 5;
}

- (NSInteger)displayValue {
  return 3;
}

- (BOOL)isEnabled {
  return YES;
}

- (NSString *)string {
  return @"Carrier";
}

%end

%hook _UIStatusBarData

- (id)secondaryCellularEntry {
    return nil;
}

%end

%hook _UIStatusBarCellularSignalView

- (NSInteger)numberOfActiveBars {
  return 4;
}

%end