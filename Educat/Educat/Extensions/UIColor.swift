
import UIKit

/// Расширение цветов для стандартного класса UIColor
extension UIColor {
    
    /// Инициализатор UIColor для HEX формата
    public convenience init?(hex: String) {
        
        if hex.hasPrefix("#") {
            
            let start = hex.index(hex.startIndex, offsetBy: 1)
            var hexColor = String(hex[start...])
            
            if hexColor.count == 6 {
                hexColor.append("FF")
            }
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    self.init(
                        red: CGFloat((hexNumber & 0xff000000) >> 24) / 255.0,
                        green: CGFloat((hexNumber & 0x00ff0000) >> 16) / 255.0,
                        blue: CGFloat((hexNumber & 0x0000ff00) >> 8) / 255.0,
                        alpha: CGFloat(hexNumber & 0x000000ff) / 255.0
                    )
                    
                    return
                }
            }
        }
        
        print("Hex format incorrect!")
        return nil
    }
    
    // Фирменнй красный
    open class var educatRed: UIColor {
        get {
            return UIColor(hex: "#E02020")!
        }
    }
    
    // Фирменный светло-серый
    open class var educatLightGray: UIColor {
        get {
            return UIColor(hex: "#F5F5F5")!
        }
    }
    
    // Фирменный серый
    open class var educatGray: UIColor {
        get {
            return UIColor(hex: "#E3E3E3")!
        }
    }
    
    // Фирменный темно-серый
    open class var educatDarkGray: UIColor {
        get {
            return UIColor(hex: "#ADADAD")!
        }
    }

    // Фирменный светло-серо-голубой
    open class var educatLightGrayBlue: UIColor {
        get {
            return UIColor(hex: "#E8EEF6")!
        }
    }
    
    // Фирменный тёмно-синий
    open class var educatDarkBlue: UIColor {
        get {
            return UIColor(hex: "#484D9D")!
        }
    }
    
    // Фирменный светло-синий
    open class var educatLightBlue: UIColor {
        get {
            return UIColor(hex: "#567BC8")!
        }
    }
    
    // Фирменный сине-фиолетовый
    open class var educatBlueViolet: UIColor {
        get {
            return UIColor(hex: "#443D8E")!
        }
    }
    
    // Фирменный желтый
    open class var educatDarkYellow: UIColor {
        get {
            return UIColor(hex: "#F7B500")!
        }
    }
    
    // Фирменный оранжевый
    open class var educatLightYellow: UIColor {
        get {
            return UIColor(hex: "#F9C942")!
        }
    }
    
    // Фирменный коралловый
    open class var educatCorall: UIColor {
        get {
            return UIColor(hex: "#FF977F")!
        }
    }
    
    // Цвет обычного текста
    open class var educatPlainTextColor: UIColor {
        get {
            return UIColor(hex: "#424D5D")!
        }
    }
}
