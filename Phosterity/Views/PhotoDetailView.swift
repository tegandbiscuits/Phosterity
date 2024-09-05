import MapKit
import SwiftUI

struct PhotoDetailView: View {
  let photoDetail: PhotoDetail

  var body: some View {
    VStack {
      map
      List {
        Section(header: Text("Location")) {
          DetailRow(title: "Latitude:", value: String(photoDetail.latitude))
          DetailRow(title: "Longitude:", value: String(photoDetail.longitude))
        }

        Section(header: Text("Date Time")) {
          DetailRow(title: "Date", value: photoDetail.formattedDate())
          DetailRow(title: "Time", value: photoDetail.formattedTime())
        }
      }
    }
  }

  @ViewBuilder private var map: some View {
    let mapZoom: Double = 500
    let mapHeight: CGFloat = 300

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

#Preview {
  let esbLat = 40.748817
  let esbLon = -73.985428

  return PhotoDetailView(
    photoDetail: PhotoDetail(
      time: Date(),
      lat: CLLocationDegrees(esbLat),
      lon: CLLocationDegrees(esbLon)
    )
  )
}
