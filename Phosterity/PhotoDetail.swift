import Foundation
import SwiftData
import CoreLocation

@Model
final class PhotoDetail {
  var timestamp: Date

  var latitude: CLLocationDegrees

  var longitude: CLLocationDegrees

  init(time: Date, lat: CLLocationDegrees, lon: CLLocationDegrees) {
    self.timestamp = time
    self.latitude = lat
    self.longitude = lon
  }

  func formattedDate() -> String {
    return timestamp.formatted(Date.FormatStyle(date: .numeric))
  }

  func formattedTime() -> String {
    return timestamp.formatted(Date.FormatStyle(time: .standard))
  }

  func formattedLabel() -> String {
    return "\(formattedDate()) \(formattedTime())"
  }
}
