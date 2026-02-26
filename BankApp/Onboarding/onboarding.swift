//
//  onboarding.swift
//  BankApp
//
//  Created by Mustafa Emir Ata on 26.02.2026.
//

import SwiftUI

struct OnboardingStep {
    let image: String
    let title: String
    let description: String
}

struct onboarding: View {
    
    let steps = [
        OnboardingStep(image: "biriktir", title: "Akıllı Birikim", description: "Harcarken biriktirmenin en kolay yolunu keşfedin."),
        OnboardingStep(image: "card", title: "Dijital Kartlar", description: "Anında oluşturulabilen kartlarla güvenli alışveriş yapın."),
        OnboardingStep(image: "mobilbanka", title: "Hızlı İşlem", description: "Tüm bankacılık işlemleriniz tek tıkla cebinizde."),
        OnboardingStep(image: "sozlesme", title: "Güvenli Sözleşme", description: "Dijital onay mekanizmasıyla işlemleriniz güvende.")
    ]
    
    @State private var index = 0
    @State private var goLogin = false
    
    let bgGradient = LinearGradient(
        gradient: Gradient(colors: [Color(red: 0.05, green: 0.1, blue: 0.2), Color(red: 0.02, green: 0.05, blue: 0.1)]),
        startPoint: .top,
        endPoint: .bottom
    )

    var body: some View {
        if goLogin {
            LoginView()
        } else {
            ZStack {
                bgGradient.ignoresSafeArea()
                
                VStack(spacing: 30) {
                    
                    HStack {
                        Spacer()
                        Button("Atla") {
                            withAnimation { goLogin = true }
                        }
                        .foregroundColor(.white.opacity(0.6))
                        .padding()
                    }

                    Spacer()

                    Image(steps[index].image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 280)
                        .padding()
                        .transition(.scale.combined(with: .opacity))
                        .id(index)

                    VStack(spacing: 15) {
                        Text(steps[index].title)
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        
                        Text(steps[index].description)
                            .font(.system(size: 17))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white.opacity(0.8))
                            .padding(.horizontal, 40)
                    }
                    .animation(.easeInOut, value: index)

                    HStack(spacing: 8) {
                        ForEach(0..<steps.count, id: \.self) { i in
                            Circle()
                                .fill(i == index ? Color.blue : Color.gray.opacity(0.5))
                                .frame(width: i == index ? 20 : 8, height: 8)
                                .animation(.spring(), value: index)
                        }
                    }
                    .padding(.top, 20)

                    Spacer()

                    Button(action: {
                        withAnimation {
                            if index < steps.count - 1 {
                                index += 1
                            } else {
                                goLogin = true
                            }
                        }
                    }) {
                        Text(index == steps.count - 1 ? "Başla" : "Devam")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .background(Color.blue)
                            .cornerRadius(15)
                            .padding(.horizontal, 30)
                    }
                    .padding(.bottom, 40)
                }
            }
        }
    }
}

#Preview {
    onboarding()
}
