//
//  GRActivityListView.swift
//  GhostRing
//
//  Created by coulson on 4/19/25.
//

import SwiftUI
import SwiftData

struct GRActivityListView: View {
    
    @Environment(\.modelContext) private var context
    //    @Query private var records: [GRModel] // SwiftData에서 자동 로딩됨
    @Query(sort: \GRModel.date, order: .reverse) private var records: [GRModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("활동명").bold().frame(maxWidth: .infinity, alignment: .leading)
                Text("날짜").bold().frame(maxWidth: .infinity, alignment: .leading)
                Text("집중 시간").bold().frame(maxWidth: .infinity, alignment: .leading)
                Text("비고").bold().frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            
            List {
                ForEach(records) { record in
                    GRFocusRow(record: record)
                }
                .onDelete(perform: deleteRecord)
            }
        }
        .navigationTitle("저장된 활동")
    }
    private func deleteRecord(at offsets: IndexSet) {
        for index in offsets {
            let record = records[index]
            context.delete(record)
        }
        try? context.save()
    }

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
}

func formatTime(from duration: TimeInterval) -> String {
    let totalSeconds = Int(duration)
    let hours = totalSeconds / 3600
    let minutes = (totalSeconds % 3600) / 60
    let seconds = totalSeconds % 60
    return "\(hours)시간 \(minutes)분 \(seconds)초"
}

/*
struct GRActivityListView: View {
    @Query(sort: \GRModel.date, order: .reverse) var records: [GRModel]

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("활동명").bold().frame(maxWidth: .infinity, alignment: .leading)
                Text("날짜").bold().frame(maxWidth: .infinity, alignment: .leading)
                Text("집중 시간").bold().frame(maxWidth: .infinity, alignment: .leading)
                Text("비고").bold().frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)

            List(records) { record in
                GRFocusRow(record: record)
            }
        }
        .navigationTitle("저장된 활동")
    }
}
*/




/*
struct GRFocusRow: View {
    var record: GRModel

    var body: some View {
        HStack {
            Text(record.activityName).frame(maxWidth: .infinity, alignment: .leading)
            Text(record.date.formatted(date: .abbreviated, time: .omitted)).frame(maxWidth: .infinity, alignment: .leading)
            Text("\(Int(record.duration / 60))분").frame(maxWidth: .infinity, alignment: .leading)
            Text(record.memo ?? "-").frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
*/
