import SwiftUI

extension PhotoDetailView {
  struct DetailRow: View {
    let title: String
    let value: String

    var body: some View {
      HStack {
        Text(title).foregroundStyle(.secondary)
        Spacer()
        Text(value)
      }
    }
  }
}

#Preview {
  List {
    PhotoDetailView.DetailRow(title: "Some Title", value: "Some Value")
  }
}
