import CoreLocation
import Foundation

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
  var location: CLLocation?

  private let locationManager = CLLocationManager()

  override init() {
    super.init()
    locationManager.delegate = self
  }

  func requestUserAuthorization() async throws {
    locationManager.requestWhenInUseAuthorization()
  }

  func startCurrentLocationUpdates() {
    locationManager.startUpdatingLocation()
  }

  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.first else {
      return
    }

    self.location = location
  }
}
