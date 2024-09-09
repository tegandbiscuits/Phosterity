import AppIntents
import Core
import SwiftData
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
    let modelContext = ModelContext(DataProvider.Init(inMemory: false))
    modelContext.insert(PhotoDetail.build(location: nil))
    do {
      try modelContext.save()
    } catch {
      print("Unexpected error occured saving the model context")
    }
    return .result()
  }
}
