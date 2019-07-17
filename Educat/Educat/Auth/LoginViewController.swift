import UIKit
import Lottie

class LoginViewController: UIViewController {
    
    // Кнопки входа
    @IBOutlet weak var googleSingInButton: UIButton!
    @IBOutlet weak var vkSignInButton: UIButton!
    @IBOutlet weak var emailSignInButton: UIButton!
    
    // Кнопка регистрации
    @IBOutlet weak var signUpButton: UIButton!
    
    // Кнопка политики конфеденциальности
    
    @IBOutlet weak var backgroundView: UIView!
    
    // Контроллеры представлений
    var vc: SignUpViewController!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setButtons()
        vc = SignUpViewController()
        view.layer.insertSublayer(
            CAGradientLayer.gradient(.yellowCorall, forView: view),
            at: 0)
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
    private func setButtons() -> Void {
        setUp(button: googleSingInButton)
        setUp(button: vkSignInButton)
        setUp(button: emailSignInButton)
    }
    
    private func setUp(button: UIButton) -> Void {
        button.layer.cornerRadius = CGFloat(10.0)
//        let grad = CAGradientLayer.gradient(.yellowCorall, forView: button)
//        button.layer.insertSublayer(grad, at: 0)
        button.backgroundColor = .white
        button.setTitleColor(.educatDarkYellow, for: .normal)
        button.clipsToBounds = true
    }

}
