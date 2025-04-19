//
//  Untitled.swift
//  GhostRing
//
//  Created by coulson on 4/16/25.
//

import SwiftUI

struct GRConcentrationView: View {
    
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
        ZStack {
            
            let cappedProgress = min(sessionManager.elapsedSeconds / 3, 10) // 최대 10까지만

            //네온링 뷰
            GRNeonRingView(progressLevel: cappedProgress).drawingGroup()
            
            
            //파티클 뷰
            GRParticleView(progressLevel: cappedProgress).drawingGroup()
            
            //textField
            
            TextField("", text: $activityName)
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
                )
            /*
            TextField("집중하실 활동명을 입력하세요", text: $activityName)
                .font(.headline)
                .padding(10)
                .background(Color.clear)
                .multilineTextAlignment(.center)
                .frame(width: 250)
             */
        }
        .ignoresSafeArea()
        
        
        VStack {
            Text(sessionManager.elapsedTimeString)
                .font(.title)
            
            if sessionManager.isRunning {
                Button("집중 종료") {
                    sessionManager.stopSession()
                    showNextButton = true
                }
                .foregroundColor(.red)
            }
            
            if showNextButton {
                Button("다음") {
                    finalElapsedTime = TimeInterval(sessionManager.elapsedSeconds)
                    navigateToSummary = true
                }
            }
            
            /*
            if showNextButton {
                Button("다음") {
                    finalElapsedTime = TimeInterval(sessionManager.elapsedSeconds)
                    let newRecord = GRModel(
                        activityName: activityName,
                        date: Date(), // 종료 시각 기준 날짜 저장
                        duration: finalElapsedTime
                    )
                    modelContext.insert(newRecord) // SwiftData에 저장
                    navigateToSummary = true
                }
            }*/
                /*
                    Button("다음") {
                        finalElapsedTime = TimeInterval(sessionManager.elapsedSeconds)
                        navigateToSummary = true
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                }*/

            NavigationLink(
                destination: GRSummaryView(activityName: activityName, duration: finalElapsedTime),
                isActive: $navigateToSummary
            ) {
                EmptyView()
            }

        }
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
