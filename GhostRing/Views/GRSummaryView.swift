//
//  GRSummaryView.swift
//  GhostRing
//
//  Created by coulson on 4/19/25.
//

import SwiftUI

struct GRSummaryView: View {
    
    @EnvironmentObject var navigationManager: GRNavigationManager
    
    var activityName: String
    var duration: TimeInterval
    
    @Environment(\.modelContext) private var context
    
    
    var body: some View {
        
        ZStack {
            VStack {
                VStack {
                    
                    Text("활동\n종료")
                        .font(.system(size: UIScreen.main.bounds.width * 0.1, weight: .bold))
                        .multilineTextAlignment(.center)
                }
                .frame(maxHeight: .infinity)
                .frame(maxWidth: .infinity)
//                .background(Color.clear)
                
                
                VStack {
                    Spacer()
                    Button("저장") {
                        let newRecord = GRModel(activityName: activityName, date: Date(), duration: duration)
                        context.insert(newRecord)
                        navigationManager.nextView(to: .activity)
                    }

                    .multilineTextAlignment(.center)
                    .frame(width: 200, height: 80)
                    .font(.system(size: 30, weight: .bold))
                    .background(Color(red: 223/255, green: 196/255, blue: 254/255)) // HEX: DFC4FE
                    .foregroundColor(Color.black)
                    .clipShape(Capsule())
                    Spacer()
                    
                }
                .offset(y: 0)
                .frame(maxWidth: .infinity)
                .padding(.top, 50)
            }
        }
        .navigationBarBackButtonHidden(true)
        .frame(height: 500)
        .ignoresSafeArea()
    }
}
