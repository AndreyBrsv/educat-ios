
import UIKit

/// Вертикальный StackView с центрировавнием, имеющий два UILabel,
/// расположенных, очевидно, друг под другом.
public class PubSubStackView: UIStackView {
    
    var label = UILabel()
    
    var count = UILabel()
    
    public required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience public init(label: String, count: String) {
        self.init(frame: .zero)
        setupPubSubStackView(label: label, count: count)
    }
    
    private func setupPubSubStackView(label: String, count: String) -> Void {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        self.label.text = label
        self.label.font = UIFont(name: "AvenirNext-Regular", size: CGFloat(15))
        self.label.textColor = .educatDarkGray
        
        self.count.text = count
        self.count.font = UIFont(name: "AvenirNext-DemiBold", size: CGFloat(15))
        self.count.textColor = .educatDarkBlue
        
        self.addArrangedSubview(self.label)
        self.addArrangedSubview(self.count)
        
        self.axis = .vertical
        self.alignment = .center
        self.distribution = .equalCentering
        
    }
    
}
