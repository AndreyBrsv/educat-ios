
import UIKit

class SWTabBarItem: UIButton {
    
    open var delegate: SWTabBarItemDelegate? // Делегат кнопки
    
    open var showNotificationIndicator: Bool { // Признак отображения индикатора уведомлений
        get {
            return notificationIndicator.isHidden
        }
        set {
            notificationIndicator.isHidden = newValue
        }
    }
    
    private let notificationIndicator = UIView() // Индикатор уведомления
    
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
