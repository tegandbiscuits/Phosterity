import Core
import SwiftData
import SwiftUI

struct PhotoDetailListView: View {
  @Environment(\.modelContext)
  private var modelContext

  @Query private var photoDetails: [PhotoDetail]

  var body: some View {
    if photoDetails.isEmpty {
      VStack {
        Spacer()
        Text("No Photo Details...").foregroundStyle(.secondary)
        Spacer()
      }
    } else {
      List {
        ForEach(photoDetails) { photoDetail in
          NavigationLink(photoDetail.formattedLabel()) {
            PhotoDetailView(photoDetail: photoDetail)
          }
        }
        .onDelete(perform: onDelete)
      }
      .accessibilityLabel("Photo detail list")
    }
  }

  private func onDelete(offsets: IndexSet) {
    for index in offsets {
      modelContext.delete(photoDetails[index])
    }
  }
}

#Preview {
  PhotoDetailListView()
}
