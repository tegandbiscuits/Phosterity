//
//  Item.swift
//  Phosterity
//
//  Created by Tegan Rauh on 8/23/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
