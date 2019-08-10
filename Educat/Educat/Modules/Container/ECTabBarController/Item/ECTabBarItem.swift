
import UIKit

public class ECTabBarItem: UIButton {
    
    open weak var delegate: ECTabBarItemDelegate?
    
    private var defaultSize = 35.0
    
    private var notificationIndicator: UIView?
    
    private var notificationIndicatorWhiteBorder: UIView?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSWTabBarItem()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupSWTabBarItem()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    private func setupSWTabBarItem() {
        
        self.backgroundColor = .educatLightGray
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: CGFloat(defaultSize)),
            self.widthAnchor.constraint(equalToConstant: CGFloat(defaultSize)),
        ])
        
        self.addTarget(self, action: #selector(delegate?.wasTapped(item:)), for: .touchUpInside)
        
    }
}
