//
//  Untitled.swift
//  GhostRing
//
//  Created by coulson on 4/16/25.
//

import SwiftUI

struct GRConcentrationView: View {
    
    @EnvironmentObject var navigationManager: GRNavigationManager
    
    @State private var activityName: String = ""
    @State private var selectedImage: UIImage? = nil
    @State private var isSessionReady = false
    @State private var activityTitle: String = "활동 제목"
    @State private var showNextButton = false
    
    @State private var navigateToSummary = false
    @State private var finalElapsedTime: TimeInterval = 0
    
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.modelContext) private var modelContext
    
    @StateObject private var sessionManager = GRSessionManager()
    
    var body: some View {
        
        ZStack(alignment: .center) {
            
            let cappedProgress = min(sessionManager.elapsedSeconds / 1, 10) // 최대 10까지만
            
            VStack {
                ZStack {
                    //네온링 뷰
                    GRNeonRingView(progressLevel: cappedProgress).drawingGroup()
                    //                            .background { Color.green}
                    
                    
                    //파티클 뷰
                    GRParticleView(progressLevel: cappedProgress).drawingGroup()
                    
                    
                    
                    
                    //textField
                    
                    TextField("", text: $activityName)
                        .foregroundColor(.primary)
                        .font(.title)
                        .bold()
                        .padding(10)
                        .frame(width: 250, height: 50)
                        .multilineTextAlignment(.center)
                        .background(Color.clear)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5) // 자동 폰트 줄임
                        .onChange(of: activityName) { _, newValue in
                            if newValue.count > 10 {
                                activityName = String(newValue.prefix(10))
                            }
                        }
                        .overlay(
                            // Placeholder 텍스트 커스텀
                            Group {
                                if activityName.isEmpty {
                                    Text("집중하실 활동명을 입력하세요")
                                        .font(.title3)
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.center)
                                        .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                        .frame(width: 230) // placeholder도 링 안에 맞게
                                }
                            }
                        )}
                
                if sessionManager.isRunning {
                    Button("끝내기") {
                        sessionManager.stopSession()
                        showNextButton = true
                    }
                    .font(.title3)
                    .foregroundColor(.red)
                }
                
                if showNextButton {
                    Button("활동 종료") {
                        finalElapsedTime = TimeInterval(sessionManager.elapsedSeconds)
                        navigationManager.nextView(to: .summary(activityName: activityName, duration: finalElapsedTime))
                        
                    }
                    .font(.title3)
                }
//                Text(sessionManager.elapsedTimeString)
//                    .font(.title)
            }
        }
        .frame(height: 600)
        .ignoresSafeArea()
        
        .navigationBarBackButtonHidden(true)
        
        .onChange(of: scenePhase, initial: false) { newPhase, arg in
            if newPhase != .active {
                // 앱이 background로 가거나 잠기거나 종료되는 경우
                if sessionManager.isRunning {
                    sessionManager.endAndReset()
                }
            }
        }
        .onChange(of: activityName, initial: false) { _, _ in
            checkSessionReady()
        }
    }
    private func checkSessionReady() {
        let ready = !activityName.isEmpty
        
        if ready && !sessionManager.isRunning {
            sessionManager.startSession()
        }
    }
}

#Preview {
    GRConcentrationView()
        .preferredColorScheme(.dark)
        .modelContainer(for: GRModel.self, inMemory: true)
}
