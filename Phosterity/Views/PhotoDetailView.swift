import SwiftUI
import CoreLocation

struct PhotoDetailView: View {
  let photoDetail: PhotoDetail

  var body: some View {
    Text("Second screen")
    Text("Value is \(photoDetail)")
  }
}

#Preview {
  PhotoDetailView(
    photoDetail: PhotoDetail(time: Date(), lat: CLLocationDegrees(0), lon: CLLocationDegrees(0))
  )
}
