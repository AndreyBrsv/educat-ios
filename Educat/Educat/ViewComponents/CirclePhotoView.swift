
import UIKit

public class CirclePhotoView: UIView {
    
    var image: UIImage?
    
    var borderGradient: CAGradientLayer?
    
    open var radius: Double {
        get {
            return defaultRadius
        }
        set {
            defaultRadius = newValue
        }
    }
    
    open var width: Double {
        get {
            return radius * 2.0
        }
    }
    
    open var photoRadius: Double {
        get {
            return photoScaleRadius * radius
        }
    }
    
    open var photoWidth: Double {
        get {
            return photoRadius * 2.0
        }
    }
    
    private var defaultRadius: Double = 100.0
    
    private var photoScaleRadius: Double = 0.9
    
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public convenience init(image: UIImage, radius: Double) {
        self.init(frame: .zero)
        self.image = image
        self.radius = radius
        updateConstraints()
    }
    
    private func setupView() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
