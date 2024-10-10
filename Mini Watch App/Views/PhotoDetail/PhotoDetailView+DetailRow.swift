import SwiftUI

extension PhotoDetailView {
  struct DetailRow: View {
    let title: String

    let value: String

    var body: some View {
      VStack(alignment: .leading) {
        Text("\(title):")
        Text(value).foregroundStyle(.secondary)
      }
      .accessibilityElement(children: .ignore)
      .accessibilityLabel("\(title): \(value)")
      .accessibilityIdentifier("\(title) row")
    }
  }
}

#Preview {
  List {
    PhotoDetailView.DetailRow(title: "Some Title", value: "Some Value")
  }
}
