import SwiftUI
import MapKit

struct DetailRow: View {
  let title: String
  let value: String

  var body: some View {
    HStack {
      Text(title).foregroundStyle(.secondary)
      Spacer()
      Text(value)
    }
  }
}

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
    Map(bounds: MapCameraBounds(minimumDistance: 500)) {
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
  }
}

#Preview {
  PhotoDetailView(
    photoDetail: PhotoDetail(
      time: Date(),
      lat: CLLocationDegrees(40.748817),
      lon: CLLocationDegrees(-73.985428)
    )
  )
}
