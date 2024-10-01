import Core
import SwiftData
import SwiftUI

extension IndexView {
  struct PhotoList: View {
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
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .accessibilityLabel("Photo detail list")
      }
    }

    var onDelete: (IndexSet) -> Void
  }
}

#Preview {
  IndexView.PhotoList { offset in
    print("want to delete \(offset)")
  }
}
