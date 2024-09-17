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
    if location == nil {
      return PhotoDetail(time: Date(), lat: 0, lon: 0)
    }

    return PhotoDetail(
      time: location!.timestamp,
      lat: location!.coordinate.latitude,
      lon: location!.coordinate.longitude
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
