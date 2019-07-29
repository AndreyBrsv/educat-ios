
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = .white

        let ecTabBarController = ECTabBarController()
        let ecNav = Nav()
        ecTabBarController.addViewControllers([ecNav], animated: true)
            
    }
    
    
    @objc func tapped(sender: UIButton) {
        print(sender.superview)
        print(sender)
    }


}

