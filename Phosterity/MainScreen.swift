import SwiftUI
import SwiftData
import MapKit

struct MainScreen: View {
  @Environment(\.modelContext) private var modelContext
  @Query private var photoDetails: [PhotoDetail]

  @State private var locationManager = LocationManager()

  @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)

  var body: some View {
    NavigationStack {
      Map(position: $position)
      .mapControls {
        MapScaleView()
        MapCompass()
        MapUserLocationButton()
      }
      .mapStyle(.standard(elevation: .realistic))

      List {
        ForEach(photoDetails) { photoDetail in
          let label = photoDetail.timestamp.formatted(Date.FormatStyle(date: .numeric, time: .standard))
          NavigationLink(label, value: photoDetail)
            .navigationDestination(for: PhotoDetail.self) { value in
              Text("the location: \(locationManager.location?.description ?? "jk")")
              Text("Second screen")
              Text("Value is \(value)")
            }
        }
        .onDelete(perform: deletePhotoDetail)
      }
      .toolbar {
        ToolbarItemGroup(placement: .bottomBar)  {
          Button("Capture Moment", systemImage: "camera", action: addPhotoDetail)
            .buttonStyle(.borderedProminent)
            .controlSize(.extraLarge)
        }
      }
    }
    .task {
      try? await locationManager.requestUserAuthorization()
      try? await locationManager.startCurrentLocationUpdates()
    }
  }

  private func addPhotoDetail() {
    withAnimation {
      modelContext.insert(PhotoDetail())
    }
  }

  private func deletePhotoDetail(offsets: IndexSet) {
    withAnimation {
      for index in offsets {
        modelContext.delete(photoDetails[index])
      }
    }
  }
}

#Preview {
  MainScreen()
    .modelContainer(for: PhotoDetail.self, inMemory: true)
}
