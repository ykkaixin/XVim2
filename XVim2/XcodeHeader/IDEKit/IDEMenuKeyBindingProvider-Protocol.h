//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Sep 30 2020 21:18:12).
//
//  Copyright (C) 1997-2019 Steve Nygard.
//

#import <IDEKit/NSObject-Protocol.h>

@class IDEMenuKeyBindingSet, NSArray, NSString;

@protocol IDEMenuKeyBindingProvider <NSObject>

@optional
+ (void)registerMenuKeyBindingsToMenuKeyBindingSet:(IDEMenuKeyBindingSet *)arg1;
+ (NSArray *)defaultMenuKeyBindingsForGroup:(NSString *)arg1;
@end

