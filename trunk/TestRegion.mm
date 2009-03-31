//
//  TestRegion.m
//  ImageProcessing
//
//  Created by Alan Wostenberg on 3/30/09.
//  Copyright 2009 Wosterware.com. All rights reserved.
//

#import "TestRegion.h"
#import "Region.h"

@implementation TestRegion

// constructors
- (void)testEmptyRegion {
	Region* r = [Region new];
	
	STAssertEquals(0,[r area], @"");
	int w = r.bb.size.width;
	STAssertEquals(0,w,@"");
	int h = r.bb.size.height;
	STAssertEquals(0,h,@"");
}


- (void)testTinyRegion {
	Region* r = [Region new];
	[r addPoint: NSMakePoint(2,3)];
	[r addPoint: NSMakePoint(12,23)];
	
	STAssertEquals(200,[r area],@"");
}

- (void)testSmallRegionReversed {
	Region* r = [Region new];
	[r addPoint: NSMakePoint(12,23)];
	[r addPoint: NSMakePoint(2,3)];
	[r addPoint: NSMakePoint(5,5)];

	int x = r.bb.origin.x;
	STAssertEquals(2,x,@"");
	int y = r.bb.origin.y;
	STAssertEquals(3,y,@"");

	STAssertEquals(200,[r area],@"");


}

- (void)testSmallRegionOutlier {
	Region* r = [Region new];
	[r addPoint: NSMakePoint(12,23)];
	[r addPoint: NSMakePoint(100,5)];
	[r addPoint: NSMakePoint(5,3)];
	
	int w = r.bb.size.width;
	STAssertEquals(100-5,w,@"");
	int h = r.bb.size.height;
	STAssertEquals(23-3,h,@"");

	
	
}

@end