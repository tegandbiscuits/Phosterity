import MapKit
import SwiftUI

extension PhotoDetailView {
  struct DetailMap: View {
    private let mapZoom: Double = 500
    private let mapHeight: CGFloat = 250

    let photoDetail: PhotoDetail

    var body: some View {
      Map(bounds: MapCameraBounds(minimumDistance: mapZoom)) {
        let coord = CLLocationCoordinate2D(
          latitude: photoDetail.latitude,
          longitude: photoDetail.longitude
        )
        Marker(coordinate: coord) {
          Text(photoDetail.formattedLabel())
        }
      }
      .mapControls {
        MapScaleView()
        MapCompass()
      }
      .mapStyle(.standard(elevation: .realistic))
      .frame(height: mapHeight)
    }
  }
}

#Preview {
  let esbLat = 40.748817
  let esbLon = -73.985428

  return PhotoDetailView.DetailMap(
    photoDetail: PhotoDetail(
      time: Date(),
      lat: CLLocationDegrees(esbLat),
      lon: CLLocationDegrees(esbLon)
    )
  )
}
