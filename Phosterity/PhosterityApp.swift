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

    let schema = Schema([
      PhotoDetail.self
    ])

    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: inMemory)

    do {
      return try ModelContainer(for: schema, configurations: [modelConfiguration])
    } catch {
      fatalError("Could not create ModelContainer: \(error)")
    }
  }()

  var body: some Scene {
    WindowGroup {
      IndexView()
    }
    .modelContainer(sharedModelContainer)
  }
}
