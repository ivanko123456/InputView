//
//  PasswordInput.swift
//  InputView Project
//
//  Created by Ivan Fabri on 07/04/2025.
//

import SwiftUI

struct PasswordInput: View {
    var body: some View {
        InputView(settings: .init(
            isPasswordType: true,
            textColor: .xxHigh,
            textFontType: .labelS,
            placeholderText: "Enter your password",
            placeholderColor: .low,
            placeholderFontType: .bodyM,
            headerText: "Password",
            headerColor: .xxHigh,
            headerFontType: .labelM,
            backgroundColor: .xLow,
            borderWithColor: .xHigh,
            dimension: .init(
                radius: .init(input: 12),
                spacing: .xs
            )
        ))
    }
}

#Preview {
    PasswordInput()
}
