import Core
import MapKit
import SwiftUI

struct PhotoDetailView: View {
  let photoDetail: PhotoDetail

  var body: some View {
    VStack(spacing: 0) {
      DetailMap(photoDetail: photoDetail)

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
