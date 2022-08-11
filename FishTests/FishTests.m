//
//  FishTests.m
//  FishTests
//
//  Created by Arnold Sylvestre on 8/9/22.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
#import "NetworkManager.h"
#import "FishModel.h"
#import "FishTableViewCell.h"
#import "DetailVc.h"
#import "FishTests-Swift.h"
@interface FishTests : XCTestCase
@property FishTests *vcToTest;

@end

@implementation FishTests

- (void)setUp {
    [super setUp];
    
    _vcToTest = [[FishTests alloc]init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testNameDigimon {
    NSString *expectedName = @"self.DigimonInfos[1].name"; //koro or tsu
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
