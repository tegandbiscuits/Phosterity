import CoreLocation
import Foundation
import SwiftData

@Model
public final class PhotoDetail {
  var timestamp: Date

  public var latitude: CLLocationDegrees

  public var longitude: CLLocationDegrees

  public init(time: Date, lat: CLLocationDegrees, lon: CLLocationDegrees) {
    self.timestamp = time
    self.latitude = lat
    self.longitude = lon
  }

  public static func build(location: CLLocation?) -> PhotoDetail {
    var date: Date
    if location == nil {
      let tzOffset = TimeZone.current.secondsFromGMT()
      let offsetDate = Calendar.current.date(byAdding: .second, value: tzOffset, to: Date())
      date = offsetDate ?? Date()
    } else {
      date = Date()
    }

    return PhotoDetail(
      time: date,
      lat: location?.coordinate.latitude ?? 0,
      lon: location?.coordinate.longitude ?? 0
    )
  }

  public func formattedDate() -> String {
    timestamp.formatted(Date.FormatStyle(date: .numeric))
  }

  public func formattedTime() -> String {
    timestamp.formatted(Date.FormatStyle(time: .standard))
  }

  public func formattedLabel() -> String {
    "\(formattedDate()) \(formattedTime())"
  }
}

extension CLLocationCoordinate2D {
  public init(photoDetail: PhotoDetail) {
    self.init(
      latitude: photoDetail.latitude,
      longitude: photoDetail.longitude
    )
  }
}
