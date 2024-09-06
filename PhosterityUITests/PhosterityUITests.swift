import XCTest

final class PhosterityUITests: XCTestCase {
  // Test will fail if location services aren't granted.
  // Need to handle that (both in the tests and in the app)
  func testCanAddPhotoDetails() throws {
    let app = XCUIApplication()
    app.launchArguments = ["enable-testing"]
    app.launch()

    let photoDetailList = app.collectionViews["Photo detail list"]
    XCTAssertEqual(photoDetailList.cells.count, 0)
    app.buttons["Save Photo Data"].tap()
    XCTAssertEqual(photoDetailList.cells.count, 1)

    let newDetailLabel = photoDetailList.cells.staticTexts.firstMatch.label
    let labelPattern = try Regex("^\\d+/\\d+/\\d+ \\d+:\\d+:\\d+ AM|PM")
    XCTAssertNotNil(newDetailLabel.firstMatch(of: labelPattern))
  }

  func testLaunchPerformance() throws {
    if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
      // This measures how long it takes to launch your application.
      measure(metrics: [XCTApplicationLaunchMetric()]) {
        XCUIApplication().launch()
      }
    }
  }
}
