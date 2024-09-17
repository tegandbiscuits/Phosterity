import CoreLocation
import XCTest

@testable import Core

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

  func testBuildUsesDefaultsIfLocationNotGiven() {
    let now = Date()

    // sleeping a bit to ensure the date instance is in the future
    // will use a past date for date from a location
    Thread.sleep(forTimeInterval: 1)
    let result = PhotoDetail.build(location: nil)

    XCTAssertGreaterThan(result.timestamp, now)
    XCTAssertEqual(result.latitude, 0)
    XCTAssertEqual(result.longitude, 0)
  }

  func testBuildUsesConvertsFromTimestampWhenGiven() {
    let now = Date()
    let loc = CLLocation(
      coordinate: CLLocationCoordinate2D(latitude: 90, longitude: -90),
      altitude: CLLocationDistance(),
      horizontalAccuracy: CLLocationAccuracy(),
      verticalAccuracy: CLLocationAccuracy(),
      timestamp: Date(timeIntervalSince1970: 0)
    )
    let result = PhotoDetail.build(location: loc)

    // using `now` instead of `Date()` ensures we're not using a default date
    // since a default date would be in the future from `now`
    XCTAssertLessThan(result.timestamp, now)
    XCTAssertEqual(result.latitude, 90)
    XCTAssertEqual(result.longitude, -90)
  }
}
