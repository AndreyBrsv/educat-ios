
import UIKit

public class CircleImageView: UIView {
    
    override public class var requiresConstraintBasedLayout: Bool {
        get {
            return true
        }
    }
    
    open lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Белый ободок вокруг фотографии
    open lazy var whiteRoundedView: UIView = {
        let whiteRoundedView = UIView()
        whiteRoundedView.translatesAutoresizingMaskIntoConstraints = false
        return whiteRoundedView
    }()
    
    open var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.whiteRoundedView.layer.cornerRadius = whiteRoundedViewScaleRadius * newValue
            self.imageView.layer.cornerRadius = imageScaleRadius * whiteRoundedViewScaleRadius * newValue
        }
    }
    
    private var imageScaleRadius: CGFloat = 0.95

    private var whiteRoundedViewScaleRadius: CGFloat = 0.95
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    convenience init() {
        self.init(frame: .zero)
        setupLayout()
    }
    
    func setupView() {
        self.clipsToBounds = true
        self.addSubview(whiteRoundedView)
        self.addSubview(imageView)
    }
    
    private func setupLayout() -> Void {
        NSLayoutConstraint.activate([
            // whiteRoundedView
            self.whiteRoundedView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.whiteRoundedView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.whiteRoundedView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: whiteRoundedViewScaleRadius),
            self.whiteRoundedView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: whiteRoundedViewScaleRadius),
            // imageView
            self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.imageView.heightAnchor.constraint(equalTo: whiteRoundedView.heightAnchor, multiplier: imageScaleRadius),
            self.imageView.widthAnchor.constraint(equalTo: whiteRoundedView.widthAnchor, multiplier: imageScaleRadius),
        ])
    }
}
