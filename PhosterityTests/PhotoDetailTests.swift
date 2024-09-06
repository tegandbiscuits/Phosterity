import CoreLocation
import XCTest

@testable import Phosterity

final class PhotoDetailTests: XCTestCase {
  var photoDetail: PhotoDetail!

  override func setUp() {
    let someDate = Date(timeIntervalSince1970: 1725656213)
    photoDetail = PhotoDetail(
      time: someDate,
      lat: CLLocationDegrees(123),
      lon: CLLocationDegrees(-73)
    )
  }

  func testFormattedDateReturnsANiceDate() {
    XCTAssertEqual(photoDetail.formattedDate(), "9/6/2024")
  }

  func testFormattedTimeReturnsANiceTime() {
    XCTAssertEqual(photoDetail.formattedTime(), "4:56:53 PM")
  }

  func testFormattedLabelReturnsTheDateAndTimeInANiceWay() {
    XCTAssertEqual(photoDetail.formattedLabel(), "9/6/2024 4:56:53 PM")
  }
}
