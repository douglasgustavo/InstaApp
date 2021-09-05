//
//  HideKeyboardExtension.swift
//  ChatApp
//
//  Created by Douglas Santos on 04/09/21.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
