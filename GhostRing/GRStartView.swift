//
//  ContentView.swift
//  GhostRing
//
//  Created by coulson on 4/13/25.
//

import SwiftUI

struct GRStartView: View {
    @State private var showPopover = true
    
    var body: some View {
        NavigationStack {
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
                        //                        // 팝오버 위치 표시자 (실제 팝오버는 ZStack에서 처리)
                        //                        Rectangle()
                        //                            .fill(Color.clear)
                        //                            .frame(height: 50)
                        //
                        NavigationLink {
                            GRConcentrationView()
                        } label: {
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
                //                .padding()
                
                // 팝오버 오버레이
                GRPopOver(isShowingPopover: $showPopover, message: "집중을 시작합니다.")
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        showPopover = false
                    }
                }
            }
            
        }
    }
}

#Preview {
    GRStartView()
}
