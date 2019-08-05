
import UIKit

// Card view controller define a card which appears from bottom of screen
class CardViewController: UIViewController {
    
    enum CardState {
        case expanded
        case collapsed
    }
    
    var currentCardState: CardState = .collapsed
    
    open var cardCornerRadius: CGFloat {
        get {
            return self.view.layer.cornerRadius
        }
        set {
            self.view.clipsToBounds = true
            self.view.layer.cornerRadius = newValue
        }
    }
    
    // A little stripe located over the top of self.view
    private let holder = UIView()
    
    private let content = CardContentView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        contentSetup()
    }
    
    private func contentSetup() -> Void { // For now just set up simple constraints
        self.view.addSubview(content)
        content.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [ content.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
              content.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
              content.topAnchor.constraint(equalTo: self.view.topAnchor),
              content.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)]
        )
    }
    
    


}
