import Core
import SwiftUI

struct NewPhotoDetailView: View {
  @Environment(\.modelContext)
  private var modelContext

  @State private var locationManager = LocationManager()

  var body: some View {
    Button("Save Photo Data", systemImage: "camera", action: addPhotoDetail)
      .buttonStyle(.borderedProminent)
      .controlSize(.large)
      .task { [locationManager] in
        try? await locationManager.requestUserAuthorization()
        locationManager.startCurrentLocationUpdates()
      }
  }

  private func addPhotoDetail() {
    let photoDetail = PhotoDetail.build(location: locationManager.location)
    modelContext.insert(photoDetail)
  }
}

#Preview {
  NewPhotoDetailView()
}
