//
//  GRNeonRingView.swift
//  GhostRing
//
//  Created by coulson on 4/17/25.
//
/*
import SwiftUI

struct GRNeonRingView: View {
    var progressLevel: Int

    var body: some View {
        let baseWidth: CGFloat = 240
        let baseHeight: CGFloat = 200
        let width = baseWidth + CGFloat(progressLevel * 10)
        let height = baseHeight + CGFloat(progressLevel * 10)

        ZStack {
            Ellipse()
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: [.cyan, .blue, .purple, .cyan]),
                        center: .center
                    ),
                    lineWidth: CGFloat(6 + progressLevel * 2)
                )
                .frame(width: width, height: height)
                .shadow(color: .cyan.opacity(0.7), radius: 10 + CGFloat(progressLevel * 5))
                .blur(radius: CGFloat(progressLevel * 1))
                .animation(.easeInOut(duration: 1.0), value: progressLevel)
        }
        .frame(width: width, height: height)
    }
}

#Preview {
    GRNeonRingView(progressLevel: 1)
}
*/
import SwiftUI

struct GRNeonRingView: View {
    var progressLevel: Int
    
    var body: some View {
        GeometryReader { geometry in
            let padding: CGFloat = 20
            let availableWidth = geometry.size.width - (padding * 2)
//            let availableHeight = geometry.size.height - (padding * 2)
            
            // 화면 너비에 맞춘 타원 크기 계산
            let width = availableWidth
            let height = width * 0.8
            
            ZStack {
                Ellipse()
                    .stroke(
                        AngularGradient(
                            gradient: Gradient(colors: [.cyan, .blue, .purple, .cyan]),
                            center: .center
                        ),
                        lineWidth: CGFloat(6 + min(progressLevel, 10) * 2)
                    )
                    .frame(width: width, height: height)
                    .shadow(color: .cyan.opacity(0.9), radius: 10 + CGFloat(min(progressLevel, 10) * 5))
                    .blur(radius: CGFloat(min(progressLevel, 10) * 1))
                    .animation(.easeInOut(duration: 1.0), value: progressLevel)
            }
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            .ignoresSafeArea()
//            .drawingGroup()
        }
    }
}

