//
//  CustomFontModifier.swift
//  InputView Project
//
//  Created by Ivan Fabri on 07/04/2025.
//

import SwiftUI

struct CustomFontModifier: ViewModifier {

    struct Settings {
        enum TextType {
            case labelS, labelM, bodyM
        }

        var textType: TextType = .labelS
    }

    let settings: Settings
    private let fontName = "Inter"

    func body(content: Content) -> some View {
        content
            .font(.custom(fontName, size: fontSize))
            .fontWeight(fontWeight)
            .lineSpacing(lineSpacing)
            .kerning(kerning)
    }

    private var fontSize: CGFloat {
        switch settings.textType {
        case .labelS:
            return 14
        case .labelM, .bodyM:
            return 16
        }
    }

    private var fontWeight: Font.Weight {
        switch settings.textType {
        case .labelS, .labelM:
            return .semibold
        case .bodyM:
            return .regular
        }
    }

    private var lineSpacing: CGFloat {
        switch settings.textType {
        case .labelS:
            return 17
        case .labelM, .bodyM:
            return 22
        }
    }

    private var kerning: CGFloat {
        switch settings.textType {
        case .labelS, .labelM:
            return 0.16
        case .bodyM:
            return 0.01
        }
    }
}

extension View {
    func customFont(settings: CustomFontModifier.Settings) -> some View {
        self.modifier(CustomFontModifier(settings: settings))
    }
}
