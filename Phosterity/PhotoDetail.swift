import Foundation
import SwiftData

@Model
final class PhotoDetail {
  var timestamp: Date

  init() {
    self.timestamp = Date()
  }
}
