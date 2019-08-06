
import UIKit

/// Карточный контроллер представления, определяющий карточку, которая появляется из нижней части экрана
class CardViewController: UIViewController {
    
    // MARK: Viper
    
    
    weak var container: UIViewController? //
    
    // MARK: Управление состоянием карточки(Card State Controll)
    enum CardState { // Состояние карточки
        case expanded
        case collapsed
    }
    
    enum CardExpandedStateConstraints {
        case full
        case half
        case quater
    }
    
    var currentCardState: CardState = .collapsed // Текущее состояние контроллера
    
    open var cardCornerRadius: CGFloat { // Радиус скругления
        get {
            return self.view.layer.cornerRadius
        }
        set {
            self.view.clipsToBounds = true
            self.view.layer.cornerRadius = newValue
        }
    }
    
    // MARK: Держатель(Holder)
    // Маленькая полоса, расположенная над верхней границей self.view
    private let holder = UIView()
    
    private let holderTopOffset = 10.0 // Значение отступа holder от верхней границы self.view
    private let holderWidthMultiplier = 0.1 // Множитель для установки ширины holder относительно ширины self.view
    private let holderHeight = 5.0 // Высота holder
    
    var hideHolder: Bool { // Флаг сокрытия холдера
        get {
            return holder.isHidden
        }
        set {
            holder.isHidden = newValue
        }
    }
    
    // MARK: Содержимое
    private let content = CardContentView()
    
    // MARK: Распознаватели жестов(Gesture Recognizers)
    /// По идее мы должны подписывать любой контент, который будет
    /// передаваться в карточку на этот распознававтель жестов
    private let panGestureRecognizer = UIPanGestureRecognizer()
    
    // MARK: Делегат перехода
    private let cardViewControllerTransitioningDelegate = CardViewControllerTransitioningDelegate()

    // MARK: Методы жизненного цикла(Lifecycle Methods)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Viper
        
        
        // Реализация кастомного перехода
        self.modalPresentationStyle = .custom
        self.transitioningDelegate = transitioningDelegate
        
        guard let frame = self.container?.view.frame else {
            fatalError("CardViewController's container doesn't exist!")
        }
        
        self.view.backgroundColor = .red
        self.view.frame = frame
        
        holderSetup()
        configurePanGestureRecognizer()
    }
    
    // MARK: Конфигурационные методы(Configuration Methods)
    private func holderSetup() -> Void { // Установка параметров холдера
        self.view.addSubview(holder)
        holder.layer.cornerRadius = CGFloat(holderHeight / 2.0)
        holder.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [ holder.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: CGFloat(holderWidthMultiplier)),
              holder.bottomAnchor.constraint(equalTo: self.view.topAnchor, constant: CGFloat(holderTopOffset)),
              holder.heightAnchor.constraint(equalToConstant: CGFloat(holderHeight)), ]
        )
    }
    
//    private func contentSetup() -> Void { // Установка view, отражающего содержимое карточки
//        self.view.addSubview(content)
//        content.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate(
//            [ content.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//              content.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//              content.topAnchor.constraint(equalTo: self.view.topAnchor),
//              content.bottomAnchor.constraint(equalTo: self.view.bottomAnchor), ]
//        )
//    }
    
    private func configurePanGestureRecognizer() -> Void { // Конфигурирует распознаватель жеста "Перетаскивание"
        panGestureRecognizer.addTarget(self, action: #selector(panGestureRecognized(_:)))
        self.view.addGestureRecognizer(panGestureRecognizer)
        self.holder.addGestureRecognizer(panGestureRecognizer)
    }
    
    
    // MARK: Action methods
    @objc
    func panGestureRecognized(_ gesture: UIPanGestureRecognizer) -> Void {
    }
    
    // MARK: Методы управления анимацией(Animation controll methods)
    
    


}
