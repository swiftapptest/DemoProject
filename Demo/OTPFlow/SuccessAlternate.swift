//
//  SuccessAlternate.swift
//  Screen 5 of OTP Verification flow (alternate success state — outlined checkmark)
//  Matches Figma: OTP Verification UI Template (node 2:113)
//

import SwiftUI

struct SuccessAlternate: View {

    var onContinue: (() -> Void)? = nil

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack(spacing: 0) {

                Spacer()

                // Outlined checkmark circle
                ZStack {
                    Circle()
                        .fill(Color(hex: "FF8D4D").opacity(0.06))
                        .frame(width: 106, height: 106)
                    Circle()
                        .stroke(Color(hex: "FF8D4D"), lineWidth: 1.6)
                        .frame(width: 106, height: 106)
                    Image(systemName: "checkmark")
                        .font(.system(size: 30, weight: .semibold))
                        .foregroundColor(Color(hex: "FF8D4D"))
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
                Button(action: { onContinue?() }) {
                    Text("Continue")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 72)
                        .background(
                            LinearGradient(colors: [Color(hex: "FF8D4D"), Color(hex: "F87C47")],
                                           startPoint: .top, endPoint: .bottom)
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

struct SuccessAlternate_Previews: PreviewProvider {
    static var previews: some View {
        SuccessAlternate()
    }
}
