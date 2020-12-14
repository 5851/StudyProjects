//
//  StartView.swift
//  HomeWork2
//
//  Created by MAC on 20.09.2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import SwiftUI

struct AnimationView: View {

    // MARK: - Property
    let universalSize = UIScreen.main.bounds
    @State var isAnimated = false

    // MARK: - Body
    var body: some View {
        ZStack {
            VStack {
                NavPopButton(destination: .previous) {
                    HStack(spacing: 15) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 22))
                            .foregroundColor(.black)
                        Text("Назад")
                        Spacer()
                    }
                } // HStack
                .padding()
                Spacer()
            } // VStack

            VStack {
                Spacer()
                Text("Просто тестовое вью \nc анимацией")
                    .multilineTextAlignment(.center)
                NavPopButton(destination: .root) {
                    HStack(spacing: 15) {
                        Spacer()
                        Image(systemName: "chevron.left")
                            .font(.system(size: 22))
                            .foregroundColor(.red)
                        Text("На стартовую View")
                            .foregroundColor(.red)
                        Spacer()
                    }
                } // HStack

                Spacer()
            }

            // MARK: - Waves
            getSinWave(interval: universalSize.width, amplited: 110, baseline: 65 + universalSize.height / 1.5)
                .foregroundColor(Color.red.opacity(0.3))
                .opacity(0.4)
                .offset(x: isAnimated ? -1 * universalSize.width : 0)
                .animation(
                    Animation.linear(duration: 4)
                        .repeatForever(autoreverses: false)
                )

            getSinWave(interval: universalSize.width, amplited: 200, baseline: 70 * universalSize.height / 1.5)
                .foregroundColor(Color.green.opacity(0.3))
                .opacity(0.4)
                .offset(x: isAnimated ? -1 * universalSize.width : 0)
                .animation(
                    Animation.linear(duration: 11)
                        .repeatForever(autoreverses: false)
                )

            getSinWave(interval: universalSize.width * 3, amplited: 200, baseline: 95 + universalSize.height / 1.5)
                .foregroundColor(Color.black.opacity(0.2))
                .offset(x: isAnimated ? -1 * universalSize.width * 3 : 0)
                .animation(
                    Animation.linear(duration: 4)
                        .repeatForever(autoreverses: false)
                )

            getSinWave(interval: universalSize.width * 1.2, amplited: 50, baseline: 75 + universalSize.height / 1.5)
                .foregroundColor(Color.init(red: 0.6, green: 0.9, blue: 1))
                .opacity(0.4)
                .offset(x: isAnimated ? -1 * (universalSize.width * 1.2) : 0)
                .animation(
                    Animation.linear(duration: 4)
                        .repeatForever(autoreverses: false)
                )

            Spacer(minLength: 0)
        } // ZStack
        .onAppear {
            self.isAnimated = true
        }
        .background(Color.black.opacity(0.1).edgesIgnoringSafeArea(.all))
    }

    // MARK - Private function
    func getSinWave(interval: CGFloat, amplited: CGFloat = 100, baseline: CGFloat = UIScreen.main.bounds.height / 2) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: -70, y: baseline))

            path.addCurve(
                to: CGPoint(x: 1 * interval - 70, y: baseline),
                control1: CGPoint(x: interval * (0.25), y: amplited + baseline),
                control2: CGPoint(x: interval * (0.45), y: -amplited + baseline))

            path.addCurve(
                to: CGPoint(x: 2 * interval - 70, y: baseline),
                control1: CGPoint(x: interval * (1.25), y: amplited + baseline),
                control2: CGPoint(x: interval * (1.45), y: -amplited + baseline))

            path.addLine(to: CGPoint(x: 2 * (interval + 70), y: universalSize.height))
            path.addLine(to: CGPoint(x: -70, y: universalSize.height))

        }
    }
}
