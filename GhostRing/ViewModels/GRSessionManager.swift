//
//  Untitled.swift
//  GhostRing
//
//  Created by coulson on 4/18/25.
//

import Combine
import Foundation
import SwiftData

class GRSessionManager: ObservableObject {
    @Published var elapsedSeconds: Int = 0
    @Published var isRunning: Bool = false
    
    private var cancellable: AnyCancellable?
    private var startDate: Date?
    
    //
    private var timer: Timer?
    private var startTime: Date?
    
    var modelContext: ModelContext?
    
    
    init() {
        restoreSessionIfNeeded()
    }
    
    func startSession() {
        
        startDate = Date()
        elapsedSeconds = 0
        isRunning = true
        cancellable = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.tick()
            }
        
        //
        startTime = Date()
        saveSessionState()
        startTimer()
    }
    
    func tick() {
        elapsedSeconds += 1
        //            if elapsedSeconds % 3600 == 0 {
        if elapsedSeconds % 1 == 0 {
            rewardUser()
        }
    }
    
    func stopSession() {
        cancellable?.cancel()
        isRunning = false
        
        //
        timer?.invalidate()
        saveSessionState(clear: true)
    }
    
    func saveSession(activityName: String) {
        guard let start = startDate else { return }
        
        let end = Date()
        let duration = end.timeIntervalSince(start)
        
        let record = GRModel(activityName: activityName, date: end, duration: duration)
        
        if let context = modelContext {
            context.insert(record)
            print("✅ 저장됨: \(activityName), \(duration)초")
        } else {
            print("⚠️ modelContext가 설정되지 않음")
        }
    }
    
    
    func rewardUser() {
        
        print("🎉 +1시간 경과! 링 밝기 + 파티클 확장!")
        
    }
    
    func endAndReset() {
        stopSession()
        elapsedSeconds = 0
        startDate = nil
    }
    
    var elapsedTimeString: String {
        let hrs = elapsedSeconds / 3600
        let mins = (elapsedSeconds % 3600) / 60
        let secs = elapsedSeconds % 60
        return String(format: "%02d:%02d:%02d", hrs, mins, secs)
    }
    
    //
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            guard let start = self.startTime else { return }
            self.elapsedSeconds = Int(Date().timeIntervalSince(start))
        }
    }
    
    private func saveSessionState(clear: Bool = false) {
        let defaults = UserDefaults.standard
        if clear {
            defaults.removeObject(forKey: "sessionStartTime")
            defaults.set(false, forKey: "sessionIsRunning")
        } else {
            defaults.set(startTime, forKey: "sessionStartTime")
            defaults.set(true, forKey: "sessionIsRunning")
        }
    }
    
    private func restoreSessionIfNeeded() {
        let defaults = UserDefaults.standard
        if defaults.bool(forKey: "sessionIsRunning"),
           let savedStart = defaults.object(forKey: "sessionStartTime") as? Date {
            startTime = savedStart
            isRunning = true
            elapsedSeconds = Int(Date().timeIntervalSince(savedStart))
            startTimer()
        }
    }
}

