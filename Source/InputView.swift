//
//  InputView.swift
//  InputView Project
//
//  Created by Ivan Fabri on 07/04/2025.
//

import SwiftUI

struct InputView: View {

    struct Settings {
        struct Dimension {
            enum Spacing: CGFloat {
                case xs = 8
                case x = 12
                case m = 16
                case l = 20
            }

            struct Radius {
                var input: CGFloat = 12
            }

            var radius = Radius()
            var spacing: Spacing = .xs
        }

        var isPasswordType = false
        var textColor: Color.Content.OnNeutral = .low
        var textFontType: CustomFontModifier.Settings.TextType = .labelS
        var placeholderText = "Placeholder"
        var placeholderColor: Color.Content.OnNeutral = .low
        var placeholderFontType: CustomFontModifier.Settings.TextType = .bodyM
        var headerText = ""
        var headerColor: Color.Content.OnNeutral = .xxHigh
        var headerFontType: CustomFontModifier.Settings.TextType = .labelM
        var backgroundColor: Color.Surface = .xLow
        var borderWithColor: Color.Surface = .xHigh
        var dimension = Dimension()
    }

    @State private var inputText = ""
    @State private var isError = false
    let settings: Settings

    var body: some View {
        VStack(alignment: .leading, spacing: settings.dimension.spacing.rawValue) {
            if !settings.headerText.isEmpty {
                headerView
            }
            fieldView
        }
    }

    private var headerView: some View {
        Text(settings.headerText)
            .customFont(settings: .init(textType: settings.headerFontType))
            .foregroundStyle(isError ? Color.Content.OnNeutral.danger.color : settings.headerColor.color)
    }

    private var fieldView: some View {
        ZStack(alignment: .leading) {
            placeholderView
            inputField
        }
        .frame(height: 48)
        .background(settings.backgroundColor.color)
        .cornerRadius(settings.dimension.radius.input)
        .overlay(
            RoundedRectangle(cornerRadius: settings.dimension.radius.input)
                .stroke(isError ? Color.Surface.danger.color : settings.borderWithColor.color, lineWidth: 1)
        )
        .onChange(of: inputText) { _, newValue in
            if settings.isPasswordType {
                isError = !validatePasswordRegex(newValue)
            }
        }
    }

    private var placeholderView: some View {
        Text(settings.placeholderText)
            .customFont(settings: .init(textType: settings.placeholderFontType))
            .foregroundStyle(settings.placeholderColor.color)
            .padding(.horizontal, 16)
            .opacity(inputText.isEmpty ? 1 : 0)
    }

    private var inputField: some View {
        Group {
            if settings.isPasswordType {
                SecureField("", text: $inputText)
            } else {
                TextField("", text: $inputText)
            }
        }
        .customFont(settings: .init(textType: settings.textFontType))
        .foregroundStyle(settings.textColor.color)
        .padding(.horizontal, 16)
    }

    private func validatePasswordRegex(_ password: String) -> Bool {
        let regex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[?=#/%]).{8,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: password)
    }
}

#Preview {
    InputView(settings: .init(isPasswordType: true))
}
