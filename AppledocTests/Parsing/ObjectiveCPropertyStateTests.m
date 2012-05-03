//
//  ObjectiveCPropertyStateTests.m
//  appledoc
//
//  Created by Tomaž Kragelj on 3/28/12.
//  Copyright (c) 2012 Tomaz Kragelj. All rights reserved.
//

#import "ObjectiveCPropertyState.h"
#import "ObjectiveCStateTestsBase.h"

@interface ObjectiveCPropertyStateTests : ObjectiveCStateTestsBase
@end

@interface ObjectiveCPropertyStateTests (CreationMethods)
- (void)runWithState:(void(^)(ObjectiveCPropertyState *state))handler;
@end

#pragma mark - 

@implementation ObjectiveCPropertyStateTests

#pragma mark - Properties without attributes
/*
- (void)testParseStreamForParserStoreShouldDetectPropertyWithNoAttributes {
	[self runWithState:^(ObjectiveCPropertyState *state) {
		[self runWithString:@"@property type name;" block:^(id parser, id tokens) {
			// setup
			id store = [OCMockObject mockForClass:[Store class]];
			[[store expect] setCurrentSourceInfo:OCMOCK_ANY];
			[[store expect] beginPropertyDefinition];
			[[store expect] beginPropertyTypes];
			[[store expect] appendType:@"type"];
			[[store expect] endCurrentObject];
			[[store expect] appendPropertyName:@"name"];
			[[store expect] endCurrentObject];
			[[parser expect] popState];
			// execute
			[state parseStream:tokens forParser:parser store:store];
			// verify
			STAssertNoThrow([store verify], nil);
			STAssertNoThrow([parser verify], nil);
		}];
	}];
}

- (void)testParseStreamForParserStoreShouldDetectPropertyWithNoAttributesWithMultipleTypes {
	[self runWithState:^(ObjectiveCPropertyState *state) {
		[self runWithString:@"@property type1 type2 type3 name;" block:^(id parser, id tokens) {
			// setup
			id store = [OCMockObject mockForClass:[Store class]];
			[[store expect] setCurrentSourceInfo:OCMOCK_ANY];
			[[store expect] beginPropertyDefinition];
			[[store expect] beginPropertyTypes];
			[[store expect] appendType:@"type1"];
			[[store expect] appendType:@"type2"];
			[[store expect] appendType:@"type3"];
			[[store expect] endCurrentObject];
			[[store expect] appendPropertyName:@"name"];
			[[store expect] endCurrentObject];
			[[parser expect] popState];
			// execute
			[state parseStream:tokens forParser:parser store:store];
			// verify
			STAssertNoThrow([store verify], nil);
			STAssertNoThrow([parser verify], nil);
		}];
	}];
}

#pragma mark - Properties with attributes

- (void)testParseStreamForParserStoreShouldDetectPropertyWithSingleAttribute {
	[self runWithState:^(ObjectiveCPropertyState *state) {
		[self runWithString:@"@property (attr) type name;" block:^(id parser, id tokens) {
			// setup
			id store = [OCMockObject mockForClass:[Store class]];
			[[store expect] setCurrentSourceInfo:OCMOCK_ANY];
			[[store expect] beginPropertyDefinition];
			[[store expect] beginPropertyAttributes];
			[[store expect] appendAttribute:@"attr"];
			[[store expect] endCurrentObject];
			[[store expect] beginPropertyTypes];
			[[store expect] appendType:@"type"];
			[[store expect] endCurrentObject];
			[[store expect] appendPropertyName:@"name"];
			[[store expect] endCurrentObject];
			[[parser expect] popState];
			// execute
			[state parseStream:tokens forParser:parser store:store];
			// verify
			STAssertNoThrow([store verify], nil);
			STAssertNoThrow([parser verify], nil);
		}];
	}];
}

- (void)testParseStreamForParserStoreShouldDetectPropertyWithMultipleAttributes {
	[self runWithState:^(ObjectiveCPropertyState *state) {
		[self runWithString:@"@property (attr1, attr2, attr3) type name;" block:^(id parser, id tokens) {
			// setup
			id store = [OCMockObject mockForClass:[Store class]];
			[[store expect] setCurrentSourceInfo:OCMOCK_ANY];
			[[store expect] beginPropertyDefinition];
			[[store expect] beginPropertyAttributes];
			[[store expect] appendAttribute:@"attr1"];
			[[store expect] appendAttribute:@"attr2"];
			[[store expect] appendAttribute:@"attr3"];
			[[store expect] endCurrentObject];
			[[store expect] beginPropertyTypes];
			[[store expect] appendType:@"type"];
			[[store expect] endCurrentObject];
			[[store expect] appendPropertyName:@"name"];
			[[store expect] endCurrentObject];
			[[parser expect] popState];
			// execute
			[state parseStream:tokens forParser:parser store:store];
			// verify
			STAssertNoThrow([store verify], nil);
			STAssertNoThrow([parser verify], nil);
		}];
	}];
}

- (void)testParseStreamForParserStoreShouldDetectPropertyWithMultipleAttributesAndTypes {
	[self runWithState:^(ObjectiveCPropertyState *state) {
		[self runWithString:@"@property (attr1, attr2, attr3) type1 type2 type3 name;" block:^(id parser, id tokens) {
			// setup
			id store = [OCMockObject mockForClass:[Store class]];
			[[store expect] setCurrentSourceInfo:OCMOCK_ANY];
			[[store expect] beginPropertyDefinition];
			[[store expect] beginPropertyAttributes];
			[[store expect] appendAttribute:@"attr1"];
			[[store expect] appendAttribute:@"attr2"];
			[[store expect] appendAttribute:@"attr3"];
			[[store expect] endCurrentObject];
			[[store expect] beginPropertyTypes];
			[[store expect] appendType:@"type1"];
			[[store expect] appendType:@"type2"];
			[[store expect] appendType:@"type3"];
			[[store expect] endCurrentObject];
			[[store expect] appendPropertyName:@"name"];
			[[store expect] endCurrentObject];
			[[parser expect] popState];
			// execute
			[state parseStream:tokens forParser:parser store:store];
			// verify
			STAssertNoThrow([store verify], nil);
			STAssertNoThrow([parser verify], nil);
		}];
	}];
}

- (void)testParseStreamForParserStoreShouldDetectPropertyWithCustomGetterAndSetter {
	[self runWithState:^(ObjectiveCPropertyState *state) {
		[self runWithString:@"@property (getter=isName, setter=setName:) type name;" block:^(id parser, id tokens) {
			// setup
			id store = [OCMockObject mockForClass:[Store class]];
			[[store expect] setCurrentSourceInfo:OCMOCK_ANY];
			[[store expect] beginPropertyDefinition];
			[[store expect] beginPropertyAttributes];
			[[store expect] appendAttribute:@"getter"];
			[[store expect] appendAttribute:@"="];
			[[store expect] appendAttribute:@"isName"];
			[[store expect] appendAttribute:@"setter"];
			[[store expect] appendAttribute:@"="];
			[[store expect] appendAttribute:@"setName"];
			[[store expect] appendAttribute:@":"];
			[[store expect] endCurrentObject];
			[[store expect] beginPropertyTypes];
			[[store expect] appendType:@"type"];
			[[store expect] endCurrentObject];
			[[store expect] appendPropertyName:@"name"];
			[[store expect] endCurrentObject];
			[[parser expect] popState];
			// execute
			[state parseStream:tokens forParser:parser store:store];
			// verify
			STAssertNoThrow([store verify], nil);
			STAssertNoThrow([parser verify], nil);
		}];
	}];
}

#pragma mark - Properties with descriptors

- (void)testParseStreamForParserStoreShouldDetectDescriptorsIfFirstWordStartsWithDoubleUnderscore {
	[self runWithState:^(ObjectiveCPropertyState *state) {
		[self runWithString:@"@property BOOL name __something" block:^(id parser, id tokens) {
			// setup
			id store = [OCMockObject mockForClass:[Store class]];
			[[store expect] setCurrentSourceInfo:OCMOCK_ANY];
			[[store expect] beginPropertyDefinition];
			[[store expect] beginPropertyTypes];
			[[store expect] appendType:@"BOOL"];
			[[store expect] endCurrentObject]; // types
			[[store expect] appendPropertyName:@"name"];
			[[store expect] beginPropertyDescriptors];
			[[store expect] appendDescriptor:@"__something"];
			[[store expect] endCurrentObject]; // descriptors
			[[store expect] endCurrentObject]; // property
			[[parser expect] popState];
			// execute
			[state parseStream:tokens forParser:parser store:store];
			// verify
			STAssertNoThrow([store verify], nil);
			STAssertNoThrow([parser verify], nil);
		}];
	}];
}

- (void)testParseStreamForParserStoreShouldDetectAllDescriptorsAfterDoubleUnderscore {
	[self runWithState:^(ObjectiveCPropertyState *state) {
		[self runWithString:@"@property BOOL name __attribute__((deprecated))" block:^(id parser, id tokens) {
			// setup
			id store = [OCMockObject mockForClass:[Store class]];
			[[store expect] setCurrentSourceInfo:OCMOCK_ANY];
			[[store expect] beginPropertyDefinition];
			[[store expect] beginPropertyTypes];
			[[store expect] appendType:@"BOOL"];
			[[store expect] endCurrentObject]; // types
			[[store expect] appendPropertyName:@"name"];
			[[store expect] beginPropertyDescriptors];
			[[store expect] appendDescriptor:@"__attribute__"];
			[[store expect] appendDescriptor:@"("];
			[[store expect] appendDescriptor:@"("];
			[[store expect] appendDescriptor:@"deprecated"];
			[[store expect] appendDescriptor:@")"];
			[[store expect] appendDescriptor:@")"];
			[[store expect] endCurrentObject]; // descriptors
			[[store expect] endCurrentObject]; // property
			[[parser expect] popState];
			// execute
			[state parseStream:tokens forParser:parser store:store];
			// verify
			STAssertNoThrow([store verify], nil);
			STAssertNoThrow([parser verify], nil);
		}];
	}];
}

- (void)testParseStreamForParserStoreShouldDetectDescriptorsIfFirstWordIsUppercase {
	[self runWithState:^(ObjectiveCPropertyState *state) {
		[self runWithString:@"@property BOOL name THIS_IS_DESCRIPTOR" block:^(id parser, id tokens) {
			// setup
			id store = [OCMockObject mockForClass:[Store class]];
			[[store expect] setCurrentSourceInfo:OCMOCK_ANY];
			[[store expect] beginPropertyDefinition];
			[[store expect] beginPropertyTypes];
			[[store expect] appendType:@"BOOL"];
			[[store expect] endCurrentObject]; // types
			[[store expect] appendPropertyName:@"name"];
			[[store expect] beginPropertyDescriptors];
			[[store expect] appendDescriptor:@"THIS_IS_DESCRIPTOR"];
			[[store expect] endCurrentObject]; // descriptors
			[[store expect] endCurrentObject]; // property
			[[parser expect] popState];
			// execute
			[state parseStream:tokens forParser:parser store:store];
			// verify
			STAssertNoThrow([store verify], nil);
			STAssertNoThrow([parser verify], nil);
		}];
	}];
}

- (void)testParseStreamForParserStoreShouldDetectAllDescriptorsAfterUppercaseWord {
	[self runWithState:^(ObjectiveCPropertyState *state) {
		[self runWithString:@"@property BOOL name THIS_IS_DESCRIPTOR and another" block:^(id parser, id tokens) {
			// setup
			id store = [OCMockObject mockForClass:[Store class]];
			[[store expect] setCurrentSourceInfo:OCMOCK_ANY];
			[[store expect] beginPropertyDefinition];
			[[store expect] beginPropertyTypes];
			[[store expect] appendType:@"BOOL"];
			[[store expect] endCurrentObject]; // types
			[[store expect] appendPropertyName:@"name"];
			[[store expect] beginPropertyDescriptors];
			[[store expect] appendDescriptor:@"THIS_IS_DESCRIPTOR"];
			[[store expect] appendDescriptor:@"and"];
			[[store expect] appendDescriptor:@"another"];
			[[store expect] endCurrentObject]; // descriptors
			[[store expect] endCurrentObject]; // property
			[[parser expect] popState];
			// execute
			[state parseStream:tokens forParser:parser store:store];
			// verify
			STAssertNoThrow([store verify], nil);
			STAssertNoThrow([parser verify], nil);
		}];
	}];
}

#pragma mark - Handling edge cases / limitations for supporting descriptors

- (void)testParseStreamForParserStoreShouldAllowPropertyNameWithDoubleUnderscore {
	[self runWithState:^(ObjectiveCPropertyState *state) {
		[self runWithString:@"@property NSString *__name" block:^(id parser, id tokens) {
			// setup
			id store = [OCMockObject mockForClass:[Store class]];
			[[store expect] setCurrentSourceInfo:OCMOCK_ANY];
			[[store expect] beginPropertyDefinition];
			[[store expect] beginPropertyTypes];
			[[store expect] appendType:@"NSString"];
			[[store expect] appendType:@"*"];
			[[store expect] endCurrentObject]; // types
			[[store expect] appendPropertyName:@"__name"];
			[[store expect] endCurrentObject]; // property
			[[parser expect] popState];
			// execute
			[state parseStream:tokens forParser:parser store:store];
			// verify
			STAssertNoThrow([store verify], nil);
			STAssertNoThrow([parser verify], nil);
		}];
	}];
}

- (void)testParseStreamForParserStoreShouldAllowPropertyNameWithUppercase {
	[self runWithState:^(ObjectiveCPropertyState *state) {
		[self runWithString:@"@property NSString *NAME" block:^(id parser, id tokens) {
			// setup
			id store = [OCMockObject mockForClass:[Store class]];
			[[store expect] setCurrentSourceInfo:OCMOCK_ANY];
			[[store expect] beginPropertyDefinition];
			[[store expect] beginPropertyTypes];
			[[store expect] appendType:@"NSString"];
			[[store expect] appendType:@"*"];
			[[store expect] endCurrentObject]; // types
			[[store expect] appendPropertyName:@"NAME"];
			[[store expect] endCurrentObject]; // property
			[[parser expect] popState];
			// execute
			[state parseStream:tokens forParser:parser store:store];
			// verify
			STAssertNoThrow([store verify], nil);
			STAssertNoThrow([parser verify], nil);
		}];
	}];
}

- (void)testParseStreamForParserStoreShouldDetectPropertyNameWithDoubleUnderscoreFollowedByAttributes {
	[self runWithState:^(ObjectiveCPropertyState *state) {
		[self runWithString:@"@property BOOL __name __something" block:^(id parser, id tokens) {
			// setup
			id store = [OCMockObject mockForClass:[Store class]];
			[[store expect] setCurrentSourceInfo:OCMOCK_ANY];
			[[store expect] beginPropertyDefinition];
			[[store expect] beginPropertyTypes];
			[[store expect] appendType:@"BOOL"];
			[[store expect] endCurrentObject]; // types
			[[store expect] appendPropertyName:@"__name"];
			[[store expect] beginPropertyDescriptors];
			[[store expect] appendDescriptor:@"__something"];
			[[store expect] endCurrentObject]; // descriptors
			[[store expect] endCurrentObject]; // property
			[[parser expect] popState];
			// execute
			[state parseStream:tokens forParser:parser store:store];
			// verify
			STAssertNoThrow([store verify], nil);
			STAssertNoThrow([parser verify], nil);
		}];
		[self runWithString:@"@property NSString ***__name __something" block:^(id parser, id tokens) {
			// setup
			id store = [OCMockObject mockForClass:[Store class]];
			[[store expect] setCurrentSourceInfo:OCMOCK_ANY];
			[[store expect] beginPropertyDefinition];
			[[store expect] beginPropertyTypes];
			[[store expect] appendType:@"NSString"];
			[[store expect] appendType:@"*"];
			[[store expect] appendType:@"*"];
			[[store expect] appendType:@"*"];
			[[store expect] endCurrentObject]; // types
			[[store expect] appendPropertyName:@"__name"];
			[[store expect] beginPropertyDescriptors];
			[[store expect] appendDescriptor:@"__something"];
			[[store expect] endCurrentObject]; // descriptors
			[[store expect] endCurrentObject]; // property
			[[parser expect] popState];
			// execute
			[state parseStream:tokens forParser:parser store:store];
			// verify
			STAssertNoThrow([store verify], nil);
			STAssertNoThrow([parser verify], nil);
		}];
	}];
}

- (void)testParseStreamForParserStoreShouldDetectPropertyNameWithUppercaseFollowedByAttributes {
	[self runWithState:^(ObjectiveCPropertyState *state) {
		[self runWithString:@"@property BOOL NAME SOMETHING" block:^(id parser, id tokens) {
			// setup
			id store = [OCMockObject mockForClass:[Store class]];
			[[store expect] setCurrentSourceInfo:OCMOCK_ANY];
			[[store expect] beginPropertyDefinition];
			[[store expect] beginPropertyTypes];
			[[store expect] appendType:@"BOOL"];
			[[store expect] endCurrentObject]; // types
			[[store expect] appendPropertyName:@"NAME"];
			[[store expect] beginPropertyDescriptors];
			[[store expect] appendDescriptor:@"SOMETHING"];
			[[store expect] endCurrentObject]; // descriptors
			[[store expect] endCurrentObject]; // property
			[[parser expect] popState];
			// execute
			[state parseStream:tokens forParser:parser store:store];
			// verify
			STAssertNoThrow([store verify], nil);
			STAssertNoThrow([parser verify], nil);
		}];
		[self runWithString:@"@property NSString ***NAME SOMETHING" block:^(id parser, id tokens) {
			// setup
			id store = [OCMockObject mockForClass:[Store class]];
			[[store expect] setCurrentSourceInfo:OCMOCK_ANY];
			[[store expect] beginPropertyDefinition];
			[[store expect] beginPropertyTypes];
			[[store expect] appendType:@"NSString"];
			[[store expect] appendType:@"*"];
			[[store expect] appendType:@"*"];
			[[store expect] appendType:@"*"];
			[[store expect] endCurrentObject]; // types
			[[store expect] appendPropertyName:@"NAME"];
			[[store expect] beginPropertyDescriptors];
			[[store expect] appendDescriptor:@"SOMETHING"];
			[[store expect] endCurrentObject]; // descriptors
			[[store expect] endCurrentObject]; // property
			[[parser expect] popState];
			// execute
			[state parseStream:tokens forParser:parser store:store];
			// verify
			STAssertNoThrow([store verify], nil);
			STAssertNoThrow([parser verify], nil);
		}];
	}];
}

#pragma mark - Multiple properties

- (void)testParseStreamForParserStoreShouldDetectMultipleProperties {
	[self runWithState:^(ObjectiveCPropertyState *state) {
		[self runWithFile:@"PropertyStateMultipleDefinitions.h" block:^(id parser, id tokens) {
			// setup
			id store = [OCMockObject mockForClass:[Store class]];
			[[store expect] setCurrentSourceInfo:OCMOCK_ANY];
			[[store expect] beginPropertyDefinition];
			[[store expect] beginPropertyAttributes];
			[[store expect] appendAttribute:@"nonatomic"];
			[[store expect] appendAttribute:@"strong"];
			[[store expect] endCurrentObject]; // attributes
			[[store expect] beginPropertyTypes];
			[[store expect] appendType:@"NSString"];
			[[store expect] appendType:@"*"];
			[[store expect] endCurrentObject]; // types
			[[store expect] appendPropertyName:@"property1"];
			[[store expect] endCurrentObject]; // property
			[[store expect] setCurrentSourceInfo:OCMOCK_ANY];
			[[store expect] beginPropertyDefinition];
			[[store expect] beginPropertyAttributes];
			[[store expect] appendAttribute:@"nonatomic"];
			[[store expect] appendAttribute:@"copy"];
			[[store expect] appendAttribute:@"readonly"];
			[[store expect] endCurrentObject]; // attributes
			[[store expect] beginPropertyTypes];
			[[store expect] appendType:@"NSArray"];
			[[store expect] appendType:@"*"];
			[[store expect] endCurrentObject]; // types
			[[store expect] appendPropertyName:@"property2"];
			[[store expect] endCurrentObject]; // property
			// execute
			[state parseStream:tokens forParser:parser store:store];
			[state parseStream:tokens forParser:parser store:store];
			// verify
			STAssertNoThrow([store verify], nil);
		}];
	}];
}
*/
@end

#pragma mark - 

@implementation ObjectiveCPropertyStateTests (CreationMethods)

- (void)runWithState:(void(^)(ObjectiveCPropertyState *state))handler {
	ObjectiveCPropertyState* state = [ObjectiveCPropertyState new];
	handler(state);
}

@end