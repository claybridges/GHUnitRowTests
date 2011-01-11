//
//  GHRowTestCase.m
//  EXModelTest
//
//  Created by Clay Bridges on 1/9/11.
//  Copyright 2011 change machine. All rights reserved.
//

#import "GHRowTestCase.h"
#import <objc/runtime.h>

@implementation GHRowTestCase

static NSString * const kGHRowTestMethodPrefix = @"rowTest";
static NSString * const kGHTestMethodPrefix = @"test_alias_";

// this function was inspired by Eimantas @
// http://walkingsmarts.com/aliasing-methods-on-objective-c-and-chaining-methods-part-deux/
//
void aliasMethod(Class srcClass, Class dstClass, SEL srcSelector, SEL dstSelector) {
  Method srcMethod = class_getInstanceMethod(srcClass, srcSelector);
  IMP srcMethodImplementation = method_getImplementation(srcMethod);
  class_addMethod(dstClass, dstSelector, srcMethodImplementation, 
									method_getTypeEncoding(srcMethod));
}

// parts of this code was shamelessly aped from Mike Ash's MAObjCRuntime, here:
// https://github.com/mikeash/MAObjCRuntime
//
+ (void)activateRowTestsForClass:(Class)theClass {
	NSLog(@"-Aliasing row tests in %@", NSStringFromClass(theClass));
	uint count;
	Method *methods = class_copyMethodList(theClass, &count);
	
	for (uint i = 0; i < count; i++) {
		Method method = methods[i];
		SEL origSelector = method_getName(method);
		NSString *methodName = NSStringFromSelector(origSelector);

		// If you happen to have another method named test_alias_#{methodName} then this will overwrite
		// it, I think.
		if ([methodName hasPrefix:kGHRowTestMethodPrefix]) {
			NSString *newMethodName = [kGHTestMethodPrefix stringByAppendingString:methodName];
			NSLog(@"--Aliasing \"%@\" matching method %@ to %@", kGHRowTestMethodPrefix, methodName, 
						newMethodName);
			SEL newSelector = sel_registerName([newMethodName UTF8String]);
			aliasMethod(theClass, self, origSelector, newSelector);
		}
	}
	
	free(methods);
	
	// recurse up the super chain, until you hit GHRowTestCase or, just in case, NSObject
	Class theSuperclass = [theClass superclass];
	if (theSuperclass != [GHRowTestCase class] && theSuperclass != [NSObject class]) 
		[self activateRowTestsForClass:theSuperclass];
}

+ (void)activateRowTests {
	NSLog(@"Activating row tests for %@", NSStringFromClass(self));
	[self activateRowTestsForClass:self];
}

@end
