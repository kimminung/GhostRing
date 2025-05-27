//
//  Untitled.swift
//  GhostRing
//
//  Created by coulson on 4/20/25.
//

import SwiftUI

struct GRFocusRow: View {
    var record: GRModel
    
    var body: some View {
        HStack {
            Text(record.activityName)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(record.date.formatted(.dateTime.year().month().day()))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(formatTime(from: record.duration))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(record.memo ?? "-")
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}


func formatTime(from duration: TimeInterval) -> String {
    let totalSeconds = Int(duration)
    let hours = totalSeconds / 3600
    let minutes = (totalSeconds % 3600) / 60
    let seconds = totalSeconds % 60
    return "\(hours)시간 \(minutes)분 \(seconds)초"
}

#Preview {
    GRFocusRow(record: GRModel(activityName: "코딩작업중", date: Date(), duration: TimeInterval(), memo: "-"))
        .preferredColorScheme(.dark)
        .modelContainer(for: GRModel.self, inMemory: true)
}
