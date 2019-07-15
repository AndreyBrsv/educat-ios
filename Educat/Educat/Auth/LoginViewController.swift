import UIKit
import Lottie

class LoginViewController: UIViewController {
    
    // Кнопки входа
    @IBOutlet weak var googleRegistrationButton: UIButton!
    @IBOutlet weak var vkRegistrationButtons: UIButton!
    @IBOutlet weak var emailRegistrationButtons: UIButton!
    
    // Кнопка регистрации
    @IBOutlet weak var loginButton: UIButton!
    
    // Кнопка политики конфеденциальности
    
    @IBOutlet weak var backgroundView: UIView!
    
    // Контроллеры представлений
    var vc: SignUpViewController!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setButtons()
        vc = SignUpViewController()
    }
    
    // Действия кнопок
    @IBAction func continueWithGoogle(_ sender: UIButton) {
    }
    
    @IBAction func continueWithVk(_ sender: UIButton) {
    }
    
    @IBAction func continueWithEmail(_ sender: UIButton) {
    }
    
    @IBAction func registration(_ sender: UIButton) {
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func showConfidentialPolitics(_ sender: UIButton) {
    }
    
    
    
    
    
    
    // Установки для кнопок
    func setButtons() -> Void {
        let cornerRadius = 10.0
        googleRegistrationButton.layer.cornerRadius = CGFloat(cornerRadius)
        vkRegistrationButtons.layer.cornerRadius = CGFloat(cornerRadius)
        emailRegistrationButtons.layer.cornerRadius = CGFloat(cornerRadius)
    }

}
