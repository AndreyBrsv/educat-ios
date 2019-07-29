
import UIKit

public class CircleImageView: UIView {
    
    var imageView: UIImageView = UIImageView()
    
    // Белый ободок вокруг фотографии
    private var whiteRoundedView = UIView()
    
    // Для установки можно передать CAGradientLayer c необходимыми цветами
    // без установки frame. Frame проставляется непосредственно тут.
    var borderGradient: CAGradientLayer {
        get {
            return bgGradient ?? CAGradientLayer()
        }
        set {
            bgGradient = newValue
            newValue.frame = CGRect(x: 0, y: 0, width: width, height: width)
            self.layer.insertSublayer(newValue, at: 0)
        }
    }
    
    private var bgGradient: CAGradientLayer?
    
    // Радиус view, расположенного за изображением
    open var radius: Double {
        get {
            return defaultRadius
        }
        set {
            defaultRadius = newValue
            self.layer.cornerRadius = CGFloat(newValue)
            self.imageView.layer.cornerRadius = CGFloat(imageRadius)
        }
    }
    
    // Ширина view, расположенного за изображением
    open var width: Double {
        get {
            return radius * 2.0
        }
    }
    
    // Радиус изображения
    open var imageRadius: Double {
        get {
            return imageScaleRadius * radius
        }
    }
    
    // Ширина изображения
    open var imageWidth: Double {
        get {
            return imageRadius * 2.0
        }
    }
    
    // Радиус белого ободка вокруг изображения
    private var whiteRoundedViewRadius: Double {
        get {
            return whiteRoundedViewScaleRadius * radius
        }
    }
    
    // Ширина белого ободка вокруг изображения
    private var whiteRoundedViewWidth: Double {
        get {
            return whiteRoundedViewRadius * 2.0
        }
    }
    
    private var defaultRadius: Double = 20.0
    
    private var imageScaleRadius: Double = 0.9

    private var whiteRoundedViewScaleRadius = 0.95
    
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("Required init just create simple CircleImageView() instance " +
                "without required constraints. Use convenience init.")
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        print("Overrided init just create simple UIView() instance. For the greatest result use conviniece init.")
    }
    
    public convenience init(image: UIImage, radius: Double?) {
        self.init(frame: .zero)
        self.imageView.image = image
        if let r = radius {
            self.defaultRadius = r
        }
        setupView()
    }
    
    private func setupView() {
        
        translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        whiteRoundedView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(whiteRoundedView)
        whiteRoundedView.backgroundColor = .white
        self.addSubview(imageView)

        let constraints = [
            self.heightAnchor.constraint(equalToConstant: CGFloat(width)),
            self.widthAnchor.constraint(equalToConstant: CGFloat(width)),
            self.whiteRoundedView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.whiteRoundedView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.whiteRoundedView.heightAnchor.constraint(equalToConstant: CGFloat(whiteRoundedViewWidth)),
            self.whiteRoundedView.widthAnchor.constraint(equalToConstant: CGFloat(whiteRoundedViewWidth)),
            self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.imageView.heightAnchor.constraint(equalToConstant: CGFloat(imageWidth)),
            self.imageView.widthAnchor.constraint(equalToConstant: CGFloat(imageWidth)),
        ]
        NSLayoutConstraint.activate(constraints)
        
        imageView.clipsToBounds = true
        self.clipsToBounds = true
        self.layer.cornerRadius = CGFloat(radius)
        self.imageView.layer.cornerRadius = CGFloat(imageRadius)
        self.whiteRoundedView.layer.cornerRadius = CGFloat(whiteRoundedViewRadius)
        
    }
}
