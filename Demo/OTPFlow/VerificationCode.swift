//
//  VerificationCode.swift
//  Screen 3 of OTP Verification flow (4-digit code entry)
//  Matches Figma: OTP Verification UI Template (node 2:75)
//

import SwiftUI

struct VerificationCode: View {

    @State private var digits: [String] = ["9", "5", "2", ""]
    private let activeIndex = 2

    var onBack: (() -> Void)? = nil
    var onConfirm: (() -> Void)? = nil

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 0) {

                Spacer().frame(height: 52)

                // Back button
                Button(action: { onBack?() }) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(Color(hex: "CECECE"))
                }
                .padding(.bottom, 55)

                // Title
                Text("Verification Code")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(Color(hex: "323232"))
                    .padding(.bottom, 12)

                Text("We have sent the verification code to your email address")
                    .font(.custom("Poppins-Medium", size: 18))
                    .foregroundColor(Color(hex: "B6B6B6"))
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 44)

                // Code boxes
                HStack(spacing: 15) {
                    ForEach(0..<4, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(
                                index == activeIndex ? Color(hex: "FF8D4D") : Color(hex: "DDDDDD"),
                                lineWidth: index == activeIndex ? 1.8 : 1.4
                            )
                            .frame(width: 71, height: 71)
                            .overlay(
                                Text(digits[index])
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(Color(hex: "757575"))
                            )
                    }
                }
                .padding(.bottom, 55)

                // Confirm button
                Button(action: { onConfirm?() }) {
                    Text("Confirm")
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

                Spacer()
            }
            .padding(.horizontal, 38)
        }
    }
}

struct VerificationCode_Previews: PreviewProvider {
    static var previews: some View {
        VerificationCode()
    }
}
