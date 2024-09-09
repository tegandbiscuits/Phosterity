import AppIntents
import SwiftUI
import WidgetKit

struct NotePhotoControl: ControlWidget {
  static let kind: String = "com.tegandbiscuits.Phosterity.NotePhoto"

  var body: some ControlWidgetConfiguration {
    StaticControlConfiguration(kind: Self.kind) {
      ControlWidgetButton(action: NotePhotoIntent()) {
        Label("Note Photo", systemImage: "camera.on.rectangle.fill")
      }
    }
  }
}

struct NotePhotoIntent: AppIntent {
  static let title: LocalizedStringResource = "Note Photo"

  func perform() async throws -> some IntentResult {
    print("hello")
    return .result()
  }
}
