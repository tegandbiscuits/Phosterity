import SwiftUI
import SwiftData
import Core

@main
struct Mini_Watch_AppApp: App {
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
    .modelContainer(DataProvider.Init(inMemory: false))
  }
}
