//
//  GRActivityListView.swift
//  GhostRing
//
//  Created by coulson on 4/19/25.
//

import SwiftUI
import SwiftData

struct GRActivityListView: View {
    @EnvironmentObject var navigationManager: GRNavigationManager
    
    @Environment(\.modelContext) private var context
    //    @Query private var records: [GRModel] // SwiftData에서 자동 로딩됨
    @Query(sort: \GRModel.date, order: .reverse) private var records: [GRModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("활동명").bold().frame(maxWidth: .infinity, alignment: .center)
                //사각형 넣기
                Text("날짜").bold().frame(maxWidth: .infinity, alignment: .center)
                Text("집중 시간").bold().frame(maxWidth: .infinity, alignment: .center)
                Text("비고").bold().frame(maxWidth: .infinity, alignment: .center)
            }
        
//            .padding(10)
            
            
            List {
                ForEach(Array(records.enumerated()), id: \.element.id) { index, record in
                    GRFocusRow(record: record)
                        .foregroundColor(.black)
                    //                        .background(index % 2 == 0 ? Color.cyan.opacity(0.1) : Color.purple.opacity(0.1))
                    
                    
                        .background(
                            Color(
                                uiColor: index % 2 == 0
                                ? UIColor(red: 0.85, green: 1.0, blue: 1.0, alpha: 1.0) // 연한 cyan
                                : UIColor(red: 0.94, green: 0.9, blue: 1.0, alpha: 1.0) // 연한 연보라
                            )
                        )
                    
//                        .lineLimit(1)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
                }
                .onDelete(perform: deleteRecord)
            }
            .listStyle(.plain)
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 0)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("저장된 활동")

        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    navigationManager.popToRoot()
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("처음으로")
                    }
                }
            }
        }

        
        
    }
    private func deleteRecord(at offsets: IndexSet) {
        for index in offsets {
            let record = records[index]
            context.delete(record)
        }
        try? context.save()
    }
    
}

#Preview {
    GRActivityListView()
//        .preferredColorScheme(.dark)
        .modelContainer(for: GRModel.self, inMemory: true)
}
