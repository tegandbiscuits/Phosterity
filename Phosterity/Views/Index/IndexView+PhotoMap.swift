import Core
import MapKit
import SwiftData
import SwiftUI

extension IndexView {
  struct PhotoMap: View {
    @Query private var photoDetails: [PhotoDetail]

    @State private var mapPosition: MapCameraPosition = .userLocation(fallback: .automatic)

    var body: some View {
      Map(position: $mapPosition) {
        UserAnnotation()
        ForEach(photoDetails) { photoDetail in
          Marker(coordinate: CLLocationCoordinate2D(photoDetail: photoDetail)) {
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
