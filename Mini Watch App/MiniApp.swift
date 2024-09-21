import Core
import SwiftData
import SwiftUI

@main
struct MiniApp: App {
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
    .modelContainer(DataProvider.setup(inMemory: false))
  }
}
