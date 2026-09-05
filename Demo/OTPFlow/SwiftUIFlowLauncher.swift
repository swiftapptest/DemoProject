//
//  SwiftUIFlowLauncher.swift
//  Exposes a factory method so Objective-C view controllers can present
//  the SwiftUI OTP flow without needing to know about SwiftUI/UIHostingController directly.
//

import SwiftUI
import UIKit

@objc(SwiftUIFlowLauncher)
class SwiftUIFlowLauncher: NSObject {

    @objc(makeOTPFlowViewController)
    static func makeOTPFlowViewController() -> UIViewController {
        let hostingController = UIHostingController(rootView: OTPFlowCoordinator())
        hostingController.modalPresentationStyle = .fullScreen
        return hostingController
    }
}
