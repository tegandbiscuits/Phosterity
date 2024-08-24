import SwiftUI
import SwiftData

struct MainScreen: View {
  @Environment(\.modelContext) private var modelContext
  @Query private var photoDetails: [PhotoDetail]

  var body: some View {
    VStack {
      List {
        ForEach(photoDetails) { photoDetail in
          Text("sup \(photoDetail.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
        }
        .onDelete(perform: deletePhotoDetail)
      }

      Spacer()

      Button("Capture Moment", systemImage: "camera", action: addPhotoDetail)
        .buttonStyle(.borderedProminent)
        .controlSize(.extraLarge)
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
