import CoreLocation
import Foundation

@Observable
final class LocationManager {
  var location: CLLocation?

  private let locationManager = CLLocationManager()

  func requestUserAuthorization() async throws {
    locationManager.requestWhenInUseAuthorization()
  }

  func startCurrentLocationUpdates() async throws {
    for try await locationUpdate in CLLocationUpdate.liveUpdates() {
      guard let location = locationUpdate.location else {
        return
      }
      self.location = location
    }
  }
}
