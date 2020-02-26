//
//  SDWebImageMapKitPluginTests.m
//  SDWebImageMapKitPluginTests
//
//  Created by lizhuoli1126@126.com on 02/26/2020.
//  Copyright (c) 2020 lizhuoli1126@126.com. All rights reserved.
//

@import XCTest;
@import SDWebImage;
@import SDWebImageMapKitPlugin;

const int64_t kAsyncTestTimeout = 5;
NSString *const kTestJPEGURL = @"http://via.placeholder.com/50x50.jpg";

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testMKAnnotationViewSetImageWithURL {
    XCTestExpectation *expectation = [self expectationWithDescription:@"MKAnnotationView setImageWithURL"];
    
    MKAnnotationView *annotationView = [[MKAnnotationView alloc] init];
    NSURL *originalImageURL = [NSURL URLWithString:kTestJPEGURL];
    [annotationView sd_setImageWithURL:originalImageURL
                             completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        XCTAssertNotNil(image);
        XCTAssertNil(error);
        XCTAssertEqual(originalImageURL, imageURL);
        XCTAssertEqual(annotationView.image, image);
        [expectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:kAsyncTestTimeout handler:nil];
}

@end

