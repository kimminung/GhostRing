//
//  GRLaunchScreen.swift
//  GhostRing
//
//  Created by coulson on 4/17/25.
//

import SwiftUI

struct GRLaunchScreenView: View {
    @State private var isActive = false
    
    var body: some View {
        Group {
            if isActive {
                GRStartView()
            } else {
                ZStack {
                    Image("GhostMainImage")
                    /*
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                     */
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.black)
                        .ignoresSafeArea()
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    GRLaunchScreenView()
}
