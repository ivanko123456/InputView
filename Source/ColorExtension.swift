//
//  ColorExtension.swift
//  InputView Project
//
//  Created by Ivan Fabri on 07/04/2025.
//

import SwiftUI

extension Color {
    enum Surface {
        case xHigh, xLow, brand, danger, dangerVariant, warning, warningVariant

        var color: Color {
            switch self {
            case .xHigh: return .surfaceXHigh
            case .xLow: return .surfaceXLow
            case .brand: return .surfaceBrand
            case .danger: return .surfaceDanger
            case .dangerVariant: return .surfaceDangerVariant
            case .warning: return .surfaceWarning
            case .warningVariant: return .surfaceWarningVariant
            }
        }
    }

    enum Content {
        enum OnNeutral {
            case xxHigh, medium, low, danger, warning

            var color: Color {
                switch self {
                case .xxHigh: return Color.contentOnNeutralXxHigh
                case .medium: return Color.contentOnNeutralMedium
                case .low: return Color.contentOnNeutralLow
                case .danger: return Color.contentOnNeutralDanger
                case .warning: return Color.contentOnNeutralWarning
                }
            }
        }
    }

    enum State {
        enum Default {
            case hover, focus

            var color: Color {
                switch self {
                case .hover: return Color.stateDefaultHover
                case .focus: return Color.stateDefaultFocus
                }
            }
        }
    }
}
