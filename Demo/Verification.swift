//
//  Verification.swift
//  Success / Authenticated screen (Screen 3 of OTP verification flow)
//  Matches Figma: OTP Verification UI Template (node 2:94)
//

import SwiftUI

struct Verification: View {

    var onContinue: (() -> Void)? = nil

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()

            VStack(spacing: 0) {

                Spacer()

                // Checkmark illustration
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [Color(hex: "FF8D4D"), Color(hex: "F87C47")],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(width: 106, height: 106)

                    Image(systemName: "checkmark")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)

                // Title
                Text("Success!")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(Color(hex: "323232"))
                    .padding(.bottom, 16)

                // Subtitle
                Text("Congratulations! You have been successfully authenticated")
                    .font(.custom("Poppins-Medium", size: 18))
                    .foregroundColor(Color(hex: "B6B6B6"))
                    .multilineTextAlignment(.center)
                    .frame(width: 300)

                Spacer()

                // Continue button
                Button(action: {
                    onContinue?()
                }) {
                    Text("Continue")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 72)
                        .background(
                            LinearGradient(
                                colors: [Color(hex: "FF8D4D"), Color(hex: "F87C47")],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .cornerRadius(50)
                        .shadow(color: Color(hex: "FF8D4D").opacity(0.2), radius: 14, x: 0, y: 9)
                }
                .padding(.horizontal, 38)
                .padding(.bottom, 40)
            }
        }
    }
}

// Convenience initializer for hex colors, matching Figma color values.
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}

struct Verification_Previews: PreviewProvider {
    static var previews: some View {
        Verification()
    }
}
