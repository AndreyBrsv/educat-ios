
import UIKit

class CircleUIButton: UIButton {
    
    var radius: Double {
        get {
            return defaultRadius
        }
        set {
            defaultRadius = newValue
        }
    }
    
    var width: Double {
        get {
            return radius * 2.0
        }
    }
    
    private var defaultRadius = 50.0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(withImage image: UIImage, andRadius radius: Double?) {
        self.init(frame: .zero)
        setupButton(image: image, radius: radius)
    }
    
    func setupButton(image: UIImage, radius: Double?) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let r = radius {
            defaultRadius = r
        }
        
        let constraints = [
            self.widthAnchor.constraint(equalToConstant: CGFloat(width)),
            self.heightAnchor.constraint(equalToConstant: CGFloat(width))
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        self.clipsToBounds = true
        self.layer.cornerRadius = CGFloat(self.radius)
        setBackgroundImage(image, for: .normal)
        
    }
    
}
