import UIKit
import Lottie

class LoginViewController: UIViewController {
    
    // Registration buttons
    @IBOutlet weak var googleRegistrationButton: UIButton!
    @IBOutlet weak var vkRegistrationButtons: UIButton!
    @IBOutlet weak var emailRegistrationButtons: UIButton!
    
    // LogIn buttons
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var backgroundView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setButtons()
    }
    
    // Установки для кнопок
    func setButtons() -> Void {
        let cornerRadius = 10.0
        googleRegistrationButton.layer.cornerRadius = CGFloat(cornerRadius)
        vkRegistrationButtons.layer.cornerRadius = CGFloat(cornerRadius)
        emailRegistrationButtons.layer.cornerRadius = CGFloat(cornerRadius)
    }

}
