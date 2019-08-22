import UIKit

struct AppFontName {
    static let regular = "AvenirNext-Regular"
    static let bold = "AvenirNext-Bold"
    static let semibold = "AvenirNext-DemiBold"
    static let heavy = "AvenirNext-Heavy"
    static let medium = "AvenirNext-Medium"
    static let italic = "AvenirNext-Italic"
    static let ultraLight = "AvenirNext-UltraLight"
}

/// Расширение, переопределяющее системный шрифт для всего приложнения
extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {

    @objc class func appSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.regular, size: size)!
    }

    @objc class func appBoldSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.bold, size: size)!
    }

    @objc class func appItalicSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.italic, size: size)!
    }
    
    @objc class func appSystemFont(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let fontName: String
        switch weight {
        case .heavy:
            fontName = AppFontName.heavy
        case .medium:
            fontName = AppFontName.medium
        case .ultraLight:
            fontName = AppFontName.ultraLight
        case .semibold:
            fontName = AppFontName.semibold
        default:
            fontName = AppFontName.regular
        }
        
        return UIFont(name: fontName, size: size)!
    }

    @objc convenience init(myCoder aDecoder: NSCoder) {
        guard
            let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
            let fontAttribute = fontDescriptor.fontAttributes[.nsctFontUIUsage] as? String else {
                self.init(myCoder: aDecoder)
                return
        }
        var fontName = ""
        switch fontAttribute {
        case "CTFontRegularUsage":
            fontName = AppFontName.regular
        case "CTFontEmphasizedUsage", "CTFontBoldUsage":
            fontName = AppFontName.bold
        case "CTFontObliqueUsage":
            fontName = AppFontName.italic
        default:
            fontName = AppFontName.regular
        }
        self.init(name: fontName, size: fontDescriptor.pointSize)!
    }

    class func overrideInitialize() { // Используем reflection obj-c для подмены релизаций UIFont методов
        guard self == UIFont.self else { return }

        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))),
            let appSystemFontMethod = class_getClassMethod(self, #selector(appSystemFont(ofSize:))) {
            method_exchangeImplementations(systemFontMethod, appSystemFontMethod)
        }

        if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))),
            let appBoldSystemFontMethod = class_getClassMethod(self, #selector(appBoldSystemFont(ofSize:))) {
            method_exchangeImplementations(boldSystemFontMethod, appBoldSystemFontMethod)
        }

        if let italicSystemFontMethod = class_getClassMethod(self, #selector(italicSystemFont(ofSize:))),
            let appItalicSystemFontMethod = class_getClassMethod(self, #selector(appItalicSystemFont(ofSize:))) {
            method_exchangeImplementations(italicSystemFontMethod, appItalicSystemFontMethod)
        }
        
        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:weight:))),
            let appSystemFontMethod = class_getClassMethod(self, #selector(appSystemFont(ofSize:weight:))) {
            method_exchangeImplementations(systemFontMethod, appSystemFontMethod)
        }

        if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))), // Trick to get over the lack of UIFont.init(coder:))
            let appInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
            method_exchangeImplementations(initCoderMethod, appInitCoderMethod)
        }
    }
}
