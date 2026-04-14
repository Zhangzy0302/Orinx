import SwiftUI

enum OrinxaYrueaTheme {
    enum OrinxColor {
        static let orinxMainPink: Color = Color(red: 243/255, green: 96/255, blue: 86/255)
        static let orinxMainBlue: Color = Color(red: 15/255, green: 124/255, blue: 147/255)
    }
    
    enum OrinxFont {
        enum GhueaHuraWeight {
            case regular
            case bold
        }

      // MARK: - MiSans
        static func texgyreadventor(_ size: CGFloat, weight: GhueaHuraWeight = .regular) -> Font {
            let fontName: String

            switch weight {
            case .regular:
                fontName = "texgyreadventor-regular"
            case .bold:
                fontName = "texgyreadventor-bold"
            }
            return .custom(fontName, size: size)
      }
    }
}
