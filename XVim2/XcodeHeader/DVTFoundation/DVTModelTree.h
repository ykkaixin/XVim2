//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Sep 30 2020 21:18:12).
//
//  Copyright (C) 1997-2019 Steve Nygard.
//

#import <objc/NSObject.h>

#import <DVTFoundation/DVTInvalidation-Protocol.h>
#import <DVTFoundation/DVTModelObject-Protocol.h>

@class DVTModelObjectGraph, DVTModelTreeNode, DVTStackBacktrace, NSString;

@interface DVTModelTree : NSObject <DVTModelObject, DVTInvalidation>
{
    DVTModelTreeNode *_rootNode;
    DVTModelObjectGraph *_objectGraph;
}

+ (BOOL)automaticallyNotifiesObserversOfSubclass_rootNode;
+ (void)synthesizeCoverAPIWithKeyForRootNode:(id)arg1;
+ (BOOL)automaticallyNotifiesObserversOfObjectGraph;
+ (void)initialize;
- (void).cxx_destruct;
@property(retain, nonatomic) DVTModelObjectGraph *objectGraph; // @synthesize objectGraph=_objectGraph;
@property(readonly) DVTModelTreeNode *subclass_rootNode; // @synthesize subclass_rootNode=_rootNode;
- (id)subclass_createRootNode;
- (void)_recursivelyMoveNode:(id)arg1 fromObjectGraph:(id)arg2 toObjectGraph:(id)arg3;
- (void)primitiveInvalidate;
- (id)initWithObjectGraph:(id)arg1;

// Remaining properties
@property(retain) DVTStackBacktrace *creationBacktrace;
@property(readonly, copy) NSString *debugDescription;
@property(readonly, copy) NSString *description;
@property(readonly) unsigned long long hash;
@property(readonly) DVTStackBacktrace *invalidationBacktrace;
@property(readonly) Class superclass;
@property(readonly, nonatomic, getter=isValid) BOOL valid;

@end

