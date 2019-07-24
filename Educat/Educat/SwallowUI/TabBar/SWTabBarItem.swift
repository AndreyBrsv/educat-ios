
import UIKit

public class SWTabBarItem: UIButton {
    
    open var delegate: SWTabBarItemDelegate? 
    
    open var showNotificationIndicator: Bool {
        get {
            return notificationIndicator.isHidden
        }
        set {
            notificationIndicator.isHidden = newValue
        }
    }
    
    private let notificationIndicator = UIView()
    
    init() {
        
        super.init(frame: CGRect.zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 35).isActive = true
        self.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        self.addTarget(self, action: #selector(wasTapped(item:)), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func wasTapped(item: UIButton) -> Void {
        delegate?.wasTapped(item: item)
    }
}
