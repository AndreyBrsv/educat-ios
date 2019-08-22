
import UIKit

// Направление градиена
extension CAGradientLayer {
    
    public enum CAGradientDirection {
        case principalDiagonal
        case secondaryDiagonal
        case leftRight
        case rightLeft
        case upDown
        case downUp
    }
    
    open class func set(direction: CAGradientDirection?, forGradient gradient: CAGradientLayer) -> Void {
        switch direction {
        case .principalDiagonal:
            gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        case .secondaryDiagonal:
            gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        case .leftRight:
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        case .rightLeft:
            gradient.startPoint = CGPoint(x: 1.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 0.0, y: 0.5)
        case .downUp:
            gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        default:
            return
        }
    }
    
    open func set(direction: CAGradientDirection) {
        CAGradientLayer.set(direction: direction, forGradient: self)
    }
}

// Расширение для генерации необходимых градиентов оформления
extension CAGradientLayer {

    // Вспомогательный enum - сюда забиваем цвета для
    // создания темы
    public enum CAGradient {
        case yellowCorall
        case lightBlueDarkBlue
        case lightBlueVioletBlue
    }
    
    open class func gradient(_ gradient: CAGradient, forView view: UIView, direction: CAGradientDirection? = nil) -> Void {
        let grad = CAGradientLayer()
        
        grad.frame = view.bounds
        var cgColorsArray: [CGColor] = []
        
        switch gradient {
        case .yellowCorall:
            cgColorsArray.append(UIColor.educatLightYellow.cgColor)
            cgColorsArray.append(UIColor.educatCorall.cgColor)
        case .lightBlueDarkBlue:
            cgColorsArray.append(UIColor.educatLightBlue.cgColor)
            cgColorsArray.append(UIColor.educatDarkBlue.cgColor)
        case .lightBlueVioletBlue:
            cgColorsArray.append(UIColor.educatLightBlue.cgColor)
            cgColorsArray.append(UIColor.educatBlueViolet.cgColor)
        }
        grad.colors = cgColorsArray
        
        view.layer.insertSublayer(grad, at: 0)
        
        set(direction: direction, forGradient: grad)
        
    }
}
