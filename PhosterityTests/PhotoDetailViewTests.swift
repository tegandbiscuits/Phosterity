import Core
import CoreLocation
import Testing
import ViewInspector

@testable import Phosterity

@MainActor
@Suite struct PhotoDetailViewTests {
  var view: PhotoDetailView
  var photoDetail: PhotoDetail

  init() async throws {
    let someDate = Date(timeIntervalSince1970: 1725656213)
    photoDetail = PhotoDetail(
      time: someDate,
      lat: CLLocationDegrees(123),
      lon: CLLocationDegrees(-73)
    )

    view = PhotoDetailView(photoDetail: photoDetail)
  }

  @Test func setsTheTitle() async throws {
    let foo = view.inspect().fin
    print("fuck")
  }

  @Test func showsTheLatitudeAndLongitude() async throws {
    let locationSection = try! view
      .inspect()
      .find(text: "Location")
      .find(ViewType.Section.self, relation: .parent)

    #expect(throws: Never.self) {
      try! locationSection.find(viewWithAccessibilityLabel: "Latitude: 123.0")
      try! locationSection.find(viewWithAccessibilityLabel: "Longitude: -73.0")
    }
  }

  @Test func showsTheDateAndTime() async throws {
    let dateTimeSection = try! view
      .inspect()
      .find(text: "Date & Time")
      .find(ViewType.Section.self, relation: .parent)

    #expect(throws: Never.self) {
      try! dateTimeSection.find(viewWithAccessibilityLabel: "Date: 9/6/2024")
      try! dateTimeSection.find(viewWithAccessibilityLabel: "Time: 4:56:53 PM")
    }
  }
}
