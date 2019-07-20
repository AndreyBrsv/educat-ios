
import UIKit

class CirclePhoto: UIView {
    
    private var photo: UIImageView!
    
    private var borderView = UIView()
    
    convenience init(photo: UIImageView!, circleColor: CAGradientLayer) {
        self.init(frame: photo.frame)
        self.photo = photo
        self.borderView.layer.insertSublayer(circleColor, at: 0)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        photo.layer.cornerRadius = photo.frame.width / 2.0
        photo.layer.masksToBounds = true
        
        let constraints = [
            photo.centerXAnchor.constraint(equalTo: borderView.centerXAnchor),
            photo.centerYAnchor.constraint(equalTo: borderView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
