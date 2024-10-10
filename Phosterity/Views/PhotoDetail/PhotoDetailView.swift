import Core
import MapKit
import SwiftUI

struct PhotoDetailView: View {
  let photoDetail: PhotoDetail

  var body: some View {
    List {
      Section {
        DetailMap(photoDetail: photoDetail)
      }
      .listRowInsets(EdgeInsets())
      .accessibilityLabel(Text("Map"))

      Section(header: Text("Location")) {
        DetailRow(title: "Latitude", value: String(photoDetail.latitude))
        DetailRow(title: "Longitude", value: String(photoDetail.longitude))
      }

      Section(header: Text("Date & Time")) {
        DetailRow(title: "Date", value: photoDetail.formattedDate())
        DetailRow(title: "Time", value: photoDetail.formattedTime())
      }
    }
    .navigationTitle(Text(photoDetail.formattedLabel()))
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
