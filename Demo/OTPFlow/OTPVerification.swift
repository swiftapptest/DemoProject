//
//  OTPVerification.swift
//  Screen 2 of OTP Verification flow (email + phone entry)
//  Matches Figma: OTP Verification UI Template (node 2:7)
//

import SwiftUI

struct OTPVerification: View {

    @State private var email: String = "dscode@gmail.com"
    @State private var phoneNumber: String = "+44 999999999"

    var onContinue: (() -> Void)? = nil

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 0) {

                Spacer().frame(height: 60)

                // Illustration placeholder
                ZStack {
                    Circle()
                        .stroke(Color(hex: "FF8D4D"), lineWidth: 1.5)
                        .frame(width: 90, height: 90)
                    Image(systemName: "checkmark.shield")
                        .font(.system(size: 32))
                        .foregroundColor(Color(hex: "FF8D4D"))
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 40)

                // Title
                Text("OTP Verification")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(Color(hex: "323232"))
                    .padding(.bottom, 12)

                Text("Enter email and phone number to send one time Password")
                    .font(.custom("Poppins-Medium", size: 18))
                    .foregroundColor(Color(hex: "B6B6B6"))
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 32)

                // Email field
                VStack(alignment: .leading, spacing: 6) {
                    Text("Email")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(Color(hex: "CECECE"))
                        .padding(.horizontal, 8)
                        .background(Color.white)
                        .offset(x: 12, y: 10)
                        .zIndex(1)

                    HStack {
                        Text(email)
                            .font(.custom("Poppins-SemiBold", size: 18))
                            .foregroundColor(Color(hex: "757575"))
                        Spacer()
                        Image(systemName: "pencil")
                            .foregroundColor(Color(hex: "757575"))
                    }
                    .padding(.horizontal, 20)
                    .frame(height: 72)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(hex: "DDDDDD"), lineWidth: 1.2)
                    )
                }
                .padding(.bottom, 24)

                // Phone number field
                VStack(alignment: .leading, spacing: 6) {
                    Text("Phone Number")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(Color(hex: "FF8D4D"))
                        .padding(.horizontal, 8)
                        .background(Color.white)
                        .offset(x: 12, y: 10)
                        .zIndex(1)

                    HStack {
                        Text(phoneNumber)
                            .font(.custom("Poppins-SemiBold", size: 18))
                            .foregroundColor(Color(hex: "757575"))
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .frame(height: 72)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(hex: "FF8D4D"), lineWidth: 1.4)
                    )
                }
                .padding(.bottom, 36)

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

                Spacer()
            }
            .padding(.horizontal, 38)
        }
    }
}

struct OTPVerification_Previews: PreviewProvider {
    static var previews: some View {
        OTPVerification()
    }
}
