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

/*
import SwiftUI

// iPhone용 커스텀 팝오버

struct GRPopOver: View {
    @State private var isShowingPopover = true
    var message: String
    
    var body: some View {
        
        ZStack {
                    // 전체 화면 배경
                    if isShowingPopover {
                        Color.black.opacity(0.25)
                            .ignoresSafeArea()
                            .onTapGesture {
                                withAnimation {
                                    isShowingPopover = false
                                }
                            }
                VStack(spacing: 0) {
                    Text(message)
                        .font(.caption)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10).fill(Color.clear)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.purple.opacity(0.8))
                        )
                        .shadow(radius: 3)
                        .onTapGesture {
                            withAnimation {
                                isShowingPopover = false
                            }
                        }
                    
                    Triangle()
                        .fill(Color(.cyan))
                        .frame(width: 20, height: 10)
                        .rotationEffect(.degrees(180))

                }
                .zIndex(1)
                .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
        .animation(.easeInOut, value: isShowingPopover)
    }
}

// 말풍선 꼬리 삼각형
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
*/

/*
 import SwiftUI
 
 // iPhone용 커스텀 팝오버
 
 struct GRPopOver: View {
 @State private var isShowingPopover = true  // 초기부터 보이게
 
 var body: some View {
 VStack {
 Spacer()
 
 ZStack(alignment: .top) {
 // 원래 버튼
 Button("Hello, World!") {
 withAnimation {
 isShowingPopover.toggle()
 }
 }
 .padding()
 .background(Color.blue.opacity(0.2))
 .cornerRadius(8)
 
 // 팝오버 내용
 if isShowingPopover {
 VStack(spacing: 0) {
 Text("Popover Content")
 .font(.caption)
 .padding()
 .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemBackground)))
 .overlay(
 RoundedRectangle(cornerRadius: 10)
 .stroke(Color.gray.opacity(0.2))
 )
 .shadow(radius: 3)
 .onTapGesture {
 withAnimation {
 isShowingPopover = false
 }
 }
 
 Triangle()
 .fill(Color(.red))
 .frame(width: 20, height: 10)
 .rotationEffect(.degrees(180))
 }
 .offset(y: -70)
 .transition(.move(edge: .top).combined(with: .opacity))
 }
 }
 
 Spacer()
 }
 .padding()
 }
 }
 
 
 // 말풍선 꼬리 삼각형
 struct Triangle: Shape {
 func path(in rect: CGRect) -> Path {
 var path = Path()
 path.move(to: CGPoint(x: rect.midX, y: rect.minY))   // Top point
 path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)) // Bottom right
 path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY)) // Bottom left
 path.closeSubpath()
 return path
 }
 }*/



//ipad, mac용 팝오버
/*
 struct GRPopOver: View {
 
 @State private var isShowingPopover = false
 
 var body: some View {
 Button("Hello, World!") {
 self.isShowingPopover = true
 }.popover(
 isPresented: $isShowingPopover, arrowEdge: .bottom
 ) {
 Text("Popover Content")
 .padding()
 }
 }
 }
 */

#Preview {
    GRPopOver(isShowingPopover: .constant(true), message: "미리보기 메시지")
        .modelContainer(for: GRModel.self, inMemory: true)
}

