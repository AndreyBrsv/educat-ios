
import UIKit

public class ECTabBarItem: UIButton {
    
    open var delegate: ECTabBarItemDelegate?
    
    private var defaultSize = 35.0
    
    private var notificationIndicator: UIView?
    
    private var notificationIndicatorWhiteBordedr: UIView?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSWTabBarItem()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupSWTabBarItem()
    }
    
    private func setupSWTabBarItem() {
        
        self.backgroundColor = .educatLightGray
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            self.heightAnchor.constraint(equalToConstant: 35),
            self.widthAnchor.constraint(equalToConstant: 35),
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        self.addTarget(self, action: #selector(wasTapped), for: .touchUpInside)
        
    }
    
    @objc func wasTapped() -> Void {
        delegate?.wasTapped(item: self)
    }
}
