//
//  GHRowTestCase.h
//  EXModelTest
//
//  Created by Clay Bridges on 1/9/11.
//  claybridges@gmail.com
//  Copyright 2011 change machine. You are free to use and modify as you like. Attribution 
//  not required, but appreciated if it makes sense to you.
//
// Purpose: In GHUnit, allows you to define test methods which can be reused, aka row tests.
//
// Usage: 
// 1. Derive a template test class from this, as you would with GHTestCase
// 2. Define your template test methods with the form -(void)rowTest...
// 3. Derive your test classes from that template class. Change parameters.
// 4. In each of your test classes, create the following method:
// + (void)initialize {
//   [self activateRowTests];
// }
//
// Warning: This may hide or overwrite methods with names prefixed by "test_alias_". 

#import <GHUnit/GHUnit.h>

@interface GHRowTestCase : GHTestCase {}

+ (void)activateRowTests;

@end
