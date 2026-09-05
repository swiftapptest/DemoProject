//
//  OTPFlowCoordinator.swift
//  Wires up navigation between all OTP flow screens:
//  Login -> OTPVerification -> VerificationCode -> Verification (Success)
//  with SuccessAlternate reachable as a secondary success state.
//

import SwiftUI

enum OTPFlowStep: Hashable {
    case otpVerification
    case verificationCode
    case success
    case successAlternate
}

struct OTPFlowCoordinator: View {

    @State private var path: [OTPFlowStep] = []

    var body: some View {
        NavigationStack(path: $path) {
            Login(
                onLogin: {
                    path.append(.otpVerification)
                },
                onForgotPassword: {
                    // Forgot-password flow not designed yet; no-op for now.
                }
            )
            .navigationDestination(for: OTPFlowStep.self) { step in
                switch step {
                case .otpVerification:
                    OTPVerification(
                        onContinue: {
                            path.append(.verificationCode)
                        }
                    )
                    .navigationBarBackButtonHidden(true)

                case .verificationCode:
                    VerificationCode(
                        onBack: {
                            path.removeLast()
                        },
                        onConfirm: {
                            path.append(.success)
                        }
                    )
                    .navigationBarBackButtonHidden(true)

                case .success:
                    Verification(
                        onContinue: {
                            path.append(.successAlternate)
                        }
                    )
                    .navigationBarBackButtonHidden(true)

                case .successAlternate:
                    SuccessAlternate(
                        onContinue: {
                            // End of flow — reset back to Login.
                            path.removeAll()
                        }
                    )
                    .navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}

struct OTPFlowCoordinator_Previews: PreviewProvider {
    static var previews: some View {
        OTPFlowCoordinator()
    }
}
