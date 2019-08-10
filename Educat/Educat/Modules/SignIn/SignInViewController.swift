
import UIKit

public class SignInViewController: UIViewController {
    
    // Кнопки входа
    @IBOutlet weak var googleSingInButton: UIButton!
    @IBOutlet weak var vkSignInButton: UIButton!
    @IBOutlet weak var emailSignInButton: UIButton!
    
    // Кнопка регистрации
    @IBOutlet weak var signUpButton: UIButton!
    
    
    // MARK: Методы жизненного цикла
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Инициализация всех view
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Приведение всех view в исходное положение
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Анимирование всех view
    }
    
    
}
