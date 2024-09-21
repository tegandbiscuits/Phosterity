import Core
import SwiftData
import SwiftUI

struct PhotoDetailListView: View {
  @Environment(\.modelContext)
  private var modelContext

  @Query private var photoDetails: [PhotoDetail]

  var body: some View {
    List {
      ForEach(photoDetails) { photoDetail in
        NavigationLink(photoDetail.formattedLabel()) {
          PhotoDetailView(photoDetail: photoDetail)
        }
      }
      .onDelete(perform: onDelete)
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
