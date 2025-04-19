//
//  GRSummaryView.swift
//  GhostRing
//
//  Created by coulson on 4/19/25.
//

import SwiftUI

struct GRSummaryView: View {
    var activityName: String
    var duration: TimeInterval
    
    @Environment(\.modelContext) private var context
    @State private var navigateToList = false
    
    var body: some View {
        VStack {
            Spacer()

            Text("활동\n종료")
                .font(.system(size: UIScreen.main.bounds.width * 0.1, weight: .bold))
                .multilineTextAlignment(.center)

            Spacer()

            HStack {
                Spacer()

                Button("저장") {
                    let newRecord = GRModel(activityName: activityName, date: Date(), duration: duration)
                    context.insert(newRecord)
                    navigateToList = true
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .clipShape(Capsule())
                .padding(.trailing, 20)
                .padding(.bottom, 20)
            }
        }
        .navigationDestination(isPresented: $navigateToList) {
            GRActivityListView()
        }
    }

    func saveActivity() {
        // 저장 로직은 이후 SwiftData or UserDefaults 선택에 따라
    }
}
