
import UIKit

public class ECTabBarItem: UIButton {
    
    open weak var delegate: ECTabBarItemDelegate?
    
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
        self.addTarget(self, action: #selector(wasTapped), for: .touchUpInside)
    }
    
    @objc private func wasTapped() -> Void {
        delegate?.wasTapped(item: self)
    }
}
