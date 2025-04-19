//
//  GRParticleView.swift
//  GhostRing
//
//  Created by coulson on 4/17/25.
//
/*
import SwiftUI

struct Particle: Identifiable {
    let id = UUID()
    var angle: Double
    var radius: CGFloat
    var speed: Double
    var color: Color
}

struct GRParticleView: View {
    var progressLevel: Int

    @State private var particles: [Particle] = []
    @State private var time = 0.0
    let timer = Timer.publish(every: 1/60, on: .main, in: .common).autoconnect()

    var body: some View {
        let baseWidth: CGFloat = 240
        let baseHeight: CGFloat = 200
        let width = baseWidth + CGFloat(progressLevel * 10)
        let height = baseHeight + CGFloat(progressLevel * 10)

        Canvas { context, size in
            for particle in particles {
                var path = Path()
                let angle = particle.angle + time * particle.speed

                let x = size.width / 2 + cos(angle) * particle.radius * (width / baseWidth)
                let y = size.height / 2 + sin(angle) * particle.radius * (height / baseHeight)

                path.addEllipse(in: CGRect(x: x, y: y, width: 4, height: 4))
                context.fill(path, with: .color(particle.color))
            }
        }
        .frame(width: width, height: height)
        .onAppear {
            particles = (0..<100).map { _ in
                Particle(
                    angle: Double.random(in: 0...2 * .pi),
                    radius: CGFloat.random(in: 80...120),
                    speed: Double.random(in: 0.5...1.5),
                    color: Color(hue: Double.random(in: 0.5...0.8), saturation: 1, brightness: 1)
                )
            }
        }
        .onReceive(timer) { _ in
            time += 0.01
        }
    }
}
*/
import SwiftUI

struct Particle: Identifiable {
    let id = UUID()
    var angle: Double
    var radius: CGFloat
    var speed: Double
    var color: Color
}

struct GRParticleView: View {
    var progressLevel: Int
    
    @State private var particles: [Particle] = []
    @State private var time = 0.0
    let timer = Timer.publish(every: 1/60, on: .main, in: .common).autoconnect()
    
    // 파티클 생성 함수를 분리
    private func createParticles() -> [Particle] {
        return (0..<100).map { _ in
            Particle(
                angle: Double.random(in: 0...2 * .pi),
                radius: CGFloat.random(in: 85...105),
                speed: Double.random(in: 0.5...1.5),
                color: Color(hue: Double.random(in: 0.5...0.8), saturation: 1, brightness: 1)
            )
        }
    }
    
    
    private func drawParticle(_ particle: Particle, in context: GraphicsContext, size: CGSize, width: CGFloat, height: CGFloat) {
        var path = Path()
        let angle = particle.angle + time * particle.speed
        
        
        let radiusX = particle.radius * width / 2 / 100
        let radiusY = particle.radius * height / 2 / 100
        
        let x = size.width / 2 + cos(angle) * radiusX
        let y = size.height / 2 + sin(angle) * radiusY
        
        path.addEllipse(in: CGRect(x: x - 2, y: y - 2, width: 4, height: 4))
        context.fill(path, with: .color(particle.color))
    }
    
    var body: some View {
        GeometryReader { geometry in
            let padding: CGFloat = 20
            let availableWidth = geometry.size.width - (padding * 2)
//            let availableHeight = geometry.size.height - (padding * 2)
            
            // 네온링과 동일한 크기로 설정
            let width = availableWidth
            let height = width * 0.8
            
            Canvas { context, size in
                for particle in particles {
                    drawParticle(particle, in: context, size: size, width: width, height: height)
                }
            }
            .ignoresSafeArea()
            .frame(width: geometry.size.width, height: geometry.size.height)
            .onAppear {
                particles = createParticles()
            }
            .onReceive(timer) { _ in
                time += 0.01
            }
        }
//        .drawingGroup()
    }
}

