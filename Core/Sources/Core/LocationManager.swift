import CoreLocation
import Foundation

@Observable
public class LocationManager: NSObject, CLLocationManagerDelegate {
  public var location: CLLocation?

  private let locationManager = CLLocationManager()

  public override init() {
    super.init()
    locationManager.delegate = self
  }

  public func requestUserAuthorization() async throws {
    locationManager.requestWhenInUseAuthorization()
  }

  public func startCurrentLocationUpdates() {
    locationManager.startUpdatingLocation()
  }

  public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.first else {
      return
    }

    self.location = location
  }
}
