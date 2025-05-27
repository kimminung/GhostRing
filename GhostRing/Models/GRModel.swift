//
//  GRModel.swift
//  GhostRing
//
//  Created by coulson on 4/18/25.
//

import SwiftData
import Foundation

@Model
class GRModel: Identifiable {
    var id: UUID
    var activityName: String
    var date: Date
    var duration: TimeInterval
    var endTime: Date?
    var memo: String?
    
    init(activityName: String, date: Date, duration: TimeInterval, memo: String? = nil) {
        self.id = UUID()
        self.activityName = activityName
        self.date = date
        self.duration = duration
        self.endTime = endTime
        self.memo = memo
    }
}
