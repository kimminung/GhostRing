//
//  ContentView.swift
//  GhostRing
//
//  Created by coulson on 4/13/25.
//

import SwiftUI

struct GRStartView: View {
    
    @StateObject private var navigationManager = GRNavigationManager()
    
    @State private var showPopover = true
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            ZStack {
                // 메인 콘텐츠
                VStack {
                    VStack {
                        Text("고스트링\n\n집중 도우미")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 32, weight: .bold))
                    }
                    .frame(maxHeight: .infinity)
                    .frame(maxWidth: .infinity)
                    .background(Color.clear)
                    
                    VStack {
                        
                        Button(action: {
                            navigationManager.nextView(to: .concentration)
                        }) {
                            Text("시작")
                                .multilineTextAlignment(.center)
                                .frame(width: 200, height: 80)
                                .font(.system(size: 30, weight: .bold))
                                .background(Color(red: 223/255, green: 196/255, blue: 254/255)) // HEX: DFC4FE
                                .foregroundColor(Color.black)
                                .clipShape(Capsule())
                            
                        }
                        
                        Spacer()
                    }
                    .offset(y: 0)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 50)
                    
                }
                
                // 팝오버 오버레이
                GRPopOver(isShowingPopover: $showPopover, message: "집중을 시작합니다.")
            }
            
            .navigationDestination(for: ViewType.self) { value in
                switch value {
                case .start:
                    GRStartView().environmentObject(navigationManager)
                case .concentration:
                    GRConcentrationView().environmentObject(navigationManager)
                case .summary(let activityName, let duration):
                    GRSummaryView(activityName: activityName, duration: duration)
                        .environmentObject(navigationManager)
                case .activity:
                    GRActivityListView().environmentObject(navigationManager)
                }
            }
            
            
        }
        
    }
    
}

//#Preview {
//    GRStartView()
//}
