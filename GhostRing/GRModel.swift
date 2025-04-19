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

/*
import SwiftData
import Foundation

@Model
class GRModel {
    var id: UUID
    var title: String
    var startTime: Date
    var endTime: Date
    var duration: TimeInterval

    init(title: String, startTime: Date, endTime: Date, duration: TimeInterval) {
        self.id = UUID()
        self.title = title
        self.startTime = startTime
        self.endTime = endTime
        self.duration = duration
    }
}
*/
