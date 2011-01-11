//
//  RowTests.m
//  GHUnitRowTests
//
//  Created by Clay Bridges on 1/11/11.
//  Copyright 2011 change machine. All rights reserved.
//

#import "RowTestTemplate.h"

@implementation RowTestTemplate

- (void)rowTestGT0 {
	GHAssertTrue(exampleParam > 0, @"GT0");
}

- (void)rowTestGT1 {
	GHAssertTrue(exampleParam > 1, @"GT1");
}

- (void)rowTestGT2 {
	GHAssertTrue(exampleParam > 2, @"GT2");
}

@end
