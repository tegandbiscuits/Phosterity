import SwiftUI
import CoreLocation

struct PhotoDetailView: View {
  let location: CLLocation?
  let photoDetail: PhotoDetail

  var body: some View {
    Text("the location: \(location?.description ?? "jk")")
    Text("Second screen")
    Text("Value is \(photoDetail)")
  }
}

#Preview {
  PhotoDetailView(location: nil, photoDetail: PhotoDetail())
}
