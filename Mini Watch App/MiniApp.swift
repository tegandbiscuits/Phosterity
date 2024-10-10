import Core
import SwiftData
import SwiftUI

@main
struct MiniApp: App {
  var sharedModelContainer: ModelContainer = {
    var inMemory = false

    #if DEBUG
    if CommandLine.arguments.contains("enable-testing") {
      inMemory = true
    }
    #endif

    return DataProvider.setup(inMemory: inMemory)
  }()

  var body: some Scene {
    WindowGroup {
      NavigationStack {
        TabView {
          Tab {
            NewPhotoDetailView()
          }
          Tab {
            PhotoDetailListView()
          }
        }
      }
    }
    .modelContainer(sharedModelContainer)
  }
}
