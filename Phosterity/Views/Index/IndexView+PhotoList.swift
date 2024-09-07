import SwiftData
import SwiftUI

extension IndexView {
  struct PhotoList: View {
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
      .scrollContentBackground(.hidden)
      .accessibilityLabel("Photo detail list")
    }

    var onDelete: (IndexSet) -> Void
  }
}

#Preview {
  IndexView.PhotoList { offset in
    print("want to delete \(offset)")
  }
}
