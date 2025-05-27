//
//  Untitled.swift
//  GhostRing
//
//  Created by coulson on 4/16/25.
//


import SwiftUI

struct GRPopOver: View {
    @Binding var isShowingPopover: Bool
    var message: String
    
    var body: some View {
        ZStack {
            // 전체 화면 배경
            if isShowingPopover {
                Color.black.opacity(0.25)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Text(message)
                        .foregroundColor(.black)
                        .font(.caption)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10).fill(Color.white)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.purple.opacity(0.8))
                        )
                        .shadow(radius: 3)
                    
                    Triangle()
                        .fill(Color.cyan)
                        .frame(width: 20, height: 10)
                        .rotationEffect(.degrees(180))
                }
                .zIndex(1) // 팝오버를 배경 위에 표시
                .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingPopover = false
            }
        }
        .animation(.easeInOut, value: isShowingPopover)
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))   // Top point
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)) // Bottom right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY)) // Bottom left
        path.closeSubpath()
        return path
    }
}

#Preview {
    GRPopOver(isShowingPopover: .constant(true), message: "미리보기 메시지")
        .preferredColorScheme(.dark)
        .modelContainer(for: GRModel.self, inMemory: true)
}

