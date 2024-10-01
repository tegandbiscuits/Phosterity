import SwiftUI

extension PhotoDetailView {
  struct DetailRow: View {
    let title: String

    let value: String

    var body: some View {
      HStack {
        Text("\(title):").foregroundStyle(.secondary)
        Spacer()
        Text(value)
      }
      .accessibilityElement(children: .ignore)
      .accessibilityLabel("\(title): \(value)")
      .accessibilityIdentifier("\(title) row")
      .contextMenu {
        Button("Copy Value", action: copy)
      }
    }

    func copy() {
      UIPasteboard.general.string = value
    }
  }
}

#Preview {
  List {
    PhotoDetailView.DetailRow(title: "Some Title", value: "Some Value")
  }
}
