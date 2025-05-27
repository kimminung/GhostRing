//
//  GRNavigationManager.swift
//  GhostRing
//
//  Created by coulson on 4/23/25.
//

import SwiftUI

// Hashable은 NavigationPath 안에 넣을 수 있게 해주는 필수 조건
enum ViewType: Hashable {
    case start
    case concentration
    case summary(activityName: String, duration: TimeInterval)
    case activity
    //
}

// MARK: - Navigation

class GRNavigationManager: ObservableObject {
    @Published var path = NavigationPath()
    
    // 다음 뷰
    func nextView(to destination: ViewType) {
        path.append(destination)
    }
    
    // 루트로 이동
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    // 뒤로 가기
    func pop() {
        path.removeLast()
    }
}
