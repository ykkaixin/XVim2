//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Sep 30 2020 21:18:12).
//
//  Copyright (C) 1997-2019 Steve Nygard.
//

#import <objc/NSObject.h>

@interface DVTFileDataTypeDetection : NSObject
{
}

+ (id)guessFileDataTypeForFileAtPath:(id)arg1 bestCurrentGuessedFileDataType:(id)arg2;
+ (id)_guessFileDataTypeUsingMagicForFileAtPath:(id)arg1 bestCurrentGuessedFileDataType:(id)arg2 fileLength:(unsigned long long)arg3 fileBytes:(const char *)arg4;
+ (id)_magicCaches;

@end

