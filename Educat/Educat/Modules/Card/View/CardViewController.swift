
import UIKit

// Card view controller define a card which appears from bottom of screen
class CardViewController: UIViewController {
    
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
    
    private let scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        
    }


}
