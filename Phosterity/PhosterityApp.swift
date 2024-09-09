import Core
import SwiftData
import SwiftUI

@main
struct PhosterityApp: App {
  var sharedModelContainer: ModelContainer = {
    var inMemory = false

    #if DEBUG
    if CommandLine.arguments.contains("enable-testing") {
      inMemory = true
    }
    #endif

    return DataProvider.Init(inMemory: inMemory)
  }()

  var body: some Scene {
    WindowGroup {
      IndexView()
    }
    .modelContainer(sharedModelContainer)
  }
}
