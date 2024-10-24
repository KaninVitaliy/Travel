import Foundation
import UIKit

enum notoType: String {
    case regular = "NotoSans-Regular"
    case thin = "NotoSans-Regular_Thin"
    case light = "NotoSans-Regular_Light"
    case bold = "NotoSans-Regular_Bold"
    case black = "NotoSans-Regular_Black"
}

extension UIFont{
    static func notoSans(fontType: notoType = .regular, size: CGFloat = 16) -> UIFont{
        .init(name: fontType.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
}
