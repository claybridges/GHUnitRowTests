//
//  RowTestsUsing.m
//  GHUnitRowTests
//
//  Created by Clay Bridges on 1/11/11.
//  Copyright 2011 change machine. All rights reserved.
//

#import "RowTestTemplate.h"

@interface RowTestUsing1 : RowTestTemplate {}
@end

@implementation RowTestUsing1

+ (void)initialize {
	[self activateRowTests];
}

- (void)setUpClass {
	exampleParam = 1;
}

@end

@interface RowTestUsing2 : RowTestTemplate {}
@end

@implementation RowTestUsing2

+ (void)initialize {
	[self activateRowTests];
}

- (void)setUpClass {
	exampleParam = 2;
}

@end
