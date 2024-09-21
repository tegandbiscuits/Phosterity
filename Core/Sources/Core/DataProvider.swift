import SwiftData

public struct DataProvider {
  public static func setup(inMemory: Bool) -> ModelContainer {
    let schema = Schema([
      PhotoDetail.self
    ])

    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: inMemory)

    do {
      return try ModelContainer(for: schema, configurations: [modelConfiguration])
    } catch {
      fatalError("Could not create ModelContainer: \(error)")
    }
  }
}
