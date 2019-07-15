
import UIKit

class SignUpViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    var firstName: UITextField!
    var secondName: UITextField!
    var email: UITextField!
    var password: UITextField!
    var signUpButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeScrollView()
        initializeTextFields()
        initializeSignUpButton()
        self.view.backgroundColor = .red
    }
    
    // Настройка представления для прокрутки
    private func initializeScrollView() -> Void {
        scrollView = UIScrollView()
        scrollView.delegate = self
    }
    
    // Настройка полей
    private func initializeTextFields() -> Void {
        firstName = UITextField()
        secondName = UITextField()
        email = UITextField()
        password = UITextField()
    }
    
    // Настройка кнопки
    private func initializeSignUpButton() -> Void {
        signUpButton = UIButton()
    }
}
