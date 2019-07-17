
import UIKit

class SWTabBarItem: UIButton {
    
    public var delegate: SWTabBarItemDelegate?
    private let notificationIndicator = UIView()
    
    init() {
        
        super.init(frame: CGRect.zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 35).isActive = true
        self.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        self.frame.origin = CGPoint(x: frame.width / 2.0, y: frame.height / 2.0)
        
        // Default color when button created
        self.backgroundColor = .educatLightGray
        
        self.addTarget(self, action: #selector(wasTapped(item:)), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func wasTapped(item: UIButton) -> Void {
        delegate?.wasTapped(item: item)
    }
}
