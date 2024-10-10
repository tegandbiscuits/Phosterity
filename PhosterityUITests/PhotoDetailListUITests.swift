import XCTest

@MainActor
final class PhotoDetailListUITests: XCTestCase {
  private var app: XCUIApplication!

  override func setUp() async throws {
    app = XCUIApplication()
    app.launchArguments = ["enable-testing"]
    app.launch()
  }

  func testHasAMap() {
    XCTAssertTrue(app.maps.element.isHittable)
    // test that points are on map
  }

  func testCanAddAPhotoDetail() throws {
    let photoDetailList = app.collectionViews["Photo detail list"]
    let emptyLabel = app.staticTexts["No Photo Details..."]

    XCTAssertFalse(photoDetailList.exists)
    XCTAssertTrue(emptyLabel.isHittable)

    app.buttons["Save Photo Details"].tap()

    XCTAssertFalse(emptyLabel.exists)
    XCTAssertEqual(photoDetailList.cells.count, 1)

    let newDetailLabel = photoDetailList.cells.staticTexts.firstMatch.label
    let labelPattern = try Regex("^\\d+/\\d+/\\d+ \\d+:\\d+:\\d+\\s(AM|PM)$")
    XCTAssertNotNil(newDetailLabel.firstMatch(of: labelPattern))
  }

  // func testCanRemovePhotoDetails() {
  // }
}
