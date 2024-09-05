import SwiftUI
import CoreLocation

struct PhotoDetailScreen: View {
  let location: CLLocation?
  let photoDetail: PhotoDetail

  var body: some View {
    Text("the location: \(location?.description ?? "jk")")
    Text("Second screen")
    Text("Value is \(photoDetail)")
  }
}

//#Preview {
//    PhotoDetailScreen()
//}
