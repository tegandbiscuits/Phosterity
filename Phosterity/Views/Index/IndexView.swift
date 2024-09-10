import BottomSheet
import Core
import SwiftData
import SwiftUI

let kSheetMediumHeight: CGFloat = 375

struct IndexView: View {
  @Environment(\.modelContext)
  private var modelContext

  @Query private var photoDetails: [PhotoDetail]

  @State private var locationManager = LocationManager()

  @State private var bottomSheetPosition: BottomSheetPosition = .absolute(kSheetMediumHeight)

  var body: some View {
    NavigationStack {
      PhotoMap()
        .bottomSheet(
          bottomSheetPosition: $bottomSheetPosition,
          switchablePositions: [
            .dynamicTop,
            .absolute(kSheetMediumHeight)
          ]
        ) {
          PhotoList(onDelete: deletePhotoDetail)
        }
        .toolbar {
          ToolbarItemGroup(placement: .bottomBar) {
            Button("Save Photo Data", systemImage: "camera", action: addPhotoDetail)
              .buttonStyle(.borderedProminent)
              .controlSize(.extraLarge)
          }
        }
        .toolbar(.hidden)
        .toolbarBackground(.visible, for: .bottomBar)
    }
    .task { [locationManager] in
      try? await locationManager.requestUserAuthorization()
      try? await locationManager.startCurrentLocationUpdates()
    }
  }

  private func addPhotoDetail() {
    withAnimation {
      let photoDetail = PhotoDetail.build(location: locationManager.location)
      modelContext.insert(photoDetail)
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
  IndexView()
    .modelContainer(for: PhotoDetail.self, inMemory: true)
}
