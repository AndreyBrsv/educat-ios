
import UIKit

@objc public protocol ECTabBarItemDelegate: class {
    
    @objc func wasTapped(item: UIButton) -> Void
    
}
