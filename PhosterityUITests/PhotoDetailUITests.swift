import XCTest

@MainActor
final class PhotoDetailUITests: XCTestCase {
  private var app: XCUIApplication!
  private var detailLabel: String!

  override func setUp() async throws {
    app = XCUIApplication()
    app.launchArguments = ["enable-testing"]
    app.launch()

    app.buttons["Save Photo Details"].tap()
    detailLabel = app
      .collectionViews["Photo detail list"]
      .cells
      .staticTexts
      .firstMatch
      .label

    app.buttons[detailLabel].tap()
  }

  func testSetsTheTitle() {
    XCTAssertTrue(app.navigationBars[detailLabel].exists)
  }

  func testShowsTheCoordinates() {
    let lat = app.descendants(matching: .any).matching(identifier: "Latitude row").firstMatch.label
    let lon = app.descendants(matching: .any).matching(identifier: "Longitude row").firstMatch.label

    XCTAssertNotNil(lat.firstMatch(of: try Regex("^Latitude: \\d+.\\d+$")))
    XCTAssertNotNil(lon.firstMatch(of: try Regex("^Longitude: -?\\d+.\\d+$")))
  }

  func testShowsTheTimeInfo() {
    let date = app.descendants(matching: .any).matching(identifier: "Date row").firstMatch.label
    let time = app.descendants(matching: .any).matching(identifier: "Time row").firstMatch.label

    XCTAssertNotNil(date.firstMatch(of: try Regex("^Date: \\d+/\\d+/\\d+$")))
    XCTAssertNotNil(time.firstMatch(of: try Regex("^Time: \\d+:\\d+:\\d+\\s(AM|PM)$")))
  }

  // func testPlotsTheLocationOnAMap() {
  // }
}
