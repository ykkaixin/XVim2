//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Sep 30 2020 21:18:12).
//
//  Copyright (C) 1997-2019 Steve Nygard.
//

#import <DVTFoundation/DVTObservingToken.h>

@interface DVTPrivateObservingToken : DVTObservingToken
{
    BOOL _isCancelled;
}

- (void)dealloc;
- (BOOL)isCancelled;
- (void)cancel;
- (id)observedKeyPath;
- (Class)observedObjectClass;
- (void)_primitiveCancelObservation;

@end

