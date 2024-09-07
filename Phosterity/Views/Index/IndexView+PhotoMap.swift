import MapKit
import SwiftData
import SwiftUI

extension IndexView {
  struct PhotoMap: View {
    @Query private var photoDetails: [PhotoDetail]

    @State private var mapPosition: MapCameraPosition = .userLocation(fallback: .automatic)

    var body: some View {
      Map(position: $mapPosition) {
        ForEach(photoDetails) { photoDetail in
          let coord = CLLocationCoordinate2D(
            latitude: photoDetail.latitude,
            longitude: photoDetail.longitude
          )
          Marker(coordinate: coord) {
            Text(photoDetail.formattedLabel())
          }
        }
      }
      .mapControls {
        MapScaleView()
        MapCompass()
        MapUserLocationButton()
      }
      .mapStyle(.standard(elevation: .realistic))
    }
  }
}

//#Preview {
//  IndexView.PhotoMap()
//}
