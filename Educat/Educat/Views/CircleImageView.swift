
import UIKit

public class CircleImageView: UIView {
    
    var imageView: UIImageView = UIImageView()
    
    // Белый ободок вокруг фотографии
    open var whiteRoundedView = UIView()
    
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
    open var radius: CGFloat {
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
    open var width: CGFloat {
        get {
            return radius * 2.0
        }
    }
    
    // Радиус изображения
    open var imageRadius: CGFloat {
        get {
            return imageScaleRadius * radius
        }
    }
    
    // Ширина изображения
    open var imageWidth: CGFloat {
        get {
            return imageRadius * 2.0
        }
    }
    
    // Радиус белого ободка вокруг изображения
    private var whiteRoundedViewRadius: CGFloat {
        get {
            return whiteRoundedViewScaleRadius * radius
        }
    }
    
    // Ширина белого ободка вокруг изображения
    private var whiteRoundedViewWidth: CGFloat {
        get {
            return whiteRoundedViewRadius * 2.0
        }
    }
    
    private var defaultRadius: CGFloat = 20.0
    
    private var imageScaleRadius: CGFloat = 0.9

    private var whiteRoundedViewScaleRadius: CGFloat = 0.95
    
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    public convenience init(image: UIImage, radius: CGFloat?) {
        self.init(frame: .zero)
        self.imageView.image = image
        if let r = radius {
            self.defaultRadius = r
        }
    }
    
    public override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
        translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        whiteRoundedView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(whiteRoundedView)
        self.addSubview(imageView)

        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: width),
            self.widthAnchor.constraint(equalToConstant: width),
            self.whiteRoundedView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.whiteRoundedView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.whiteRoundedView.heightAnchor.constraint(equalToConstant: whiteRoundedViewWidth),
            self.whiteRoundedView.widthAnchor.constraint(equalToConstant: whiteRoundedViewWidth),
            self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.imageView.heightAnchor.constraint(equalToConstant: imageWidth),
            self.imageView.widthAnchor.constraint(equalToConstant: imageWidth),
        ])
        
        imageView.clipsToBounds = true
        self.clipsToBounds = true
        self.layer.cornerRadius = CGFloat(radius)
        self.imageView.layer.cornerRadius = CGFloat(imageRadius)
        self.whiteRoundedView.layer.cornerRadius = CGFloat(whiteRoundedViewRadius)
    }
}
