import Core
import MapKit
import SwiftUI

struct PhotoDetailView: View {
  let photoDetail: PhotoDetail

  private let mapZoom: Double = 500

  var body: some View {
    List {
      Section(header: Text("Date Time")) {
        DetailRow(title: "Date", value: String(photoDetail.formattedDate()))
        DetailRow(title: "Time", value: String(photoDetail.formattedTime()))
      }

      Section(header: Text("Location")) {
        DetailRow(title: "Latitude", value: String(photoDetail.latitude))
        DetailRow(title: "Longitude", value: String(photoDetail.longitude))
      }

      Section {
        DetailMap(photoDetail: photoDetail)
      }
      .listRowInsets(EdgeInsets())
      .accessibilityLabel(Text("Map"))
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
      lat: esbLat,
      lon: esbLon
    )
  )
}
