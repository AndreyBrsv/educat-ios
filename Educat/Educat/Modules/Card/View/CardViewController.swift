
import UIKit

/// Карточный контроллер представления, определяющий карточку, которая появляется из нижней части экрана
public class CardViewController: UIViewController {
    
    // MARK:- Viper
    
    // MARK:- Управление состоянием карточки(Card State Controll)
    enum CardState { // Состояние карточки
        case expanded
        case collapsed
    }
    
    enum CardExpandedStateConstraints {
        case full
        case half
        case quater
    }
    
    var state: CardState = .collapsed // Текущее состояние контроллера
    
    // MARK:- Радиус скругления
    open var cornerRadius: CGFloat { // Радиус скругления
        get {
            return self.view.layer.cornerRadius
        }
        set {
            self.view.layer.cornerRadius = newValue
        }
    }
    
    // MARK:- Держатель(Holder). Маленькая полоса, расположенная над верхней границей self.view
    public let holder = UIView()
    let holderHeight = 2.0
    let holderWidth = 30.0
    
    // MARK: Распознаватели жестов
    private let panGestureRecognizer = UIPanGestureRecognizer()

    // MARK:- Методы жизненного цикла
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK:- Viper -> viewDidLoad()
        
        // MARK:- panGestureRecognizer -> viewDidLoad()
        panGestureRecognizer.addTarget(self, action: #selector(dismissCardViewController(_:)))
        panGestureRecognizer.isEnabled = true
        
        // MARK:- self -> viewDidLoad()
        self.transitioningDelegate = self
        self.view.addGestureRecognizer(panGestureRecognizer)
        
        // MARK:- holder -> viewDidLoad()
        view.addSubview(holder)
        holder.frame = CGRect(
            x: view.center.x - CGFloat(holderWidth / 2.0),
            y: CGFloat(holderHeight - 10.0),
            width: CGFloat(holderWidth),
            height: CGFloat(holderHeight))
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // MARK:- self -> viewWillAppear()
        self.view.backgroundColor = .gray
        self.cornerRadius = 20.0
        
        // MARK:- holder -> viewWillAppear()
        holder.backgroundColor = .gray
        holder.layer.cornerRadius = CGFloat(holderHeight / 2.0)
    }
}

// MARK:- Реализация протокола UIViewControllerTransitioningDelegate
extension CardViewController: UIViewControllerTransitioningDelegate {
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return CardViewControllerAnimatedTransitioning()
    }
}

// MARK:- Управление анимациями открытия и закрытия карточки
extension CardViewController {
    
    public struct CardLayoutConstants {
        // Портретный режим
        static let topSafeAreaAnchorConstraintConstant: CGFloat = 20.0
        // Пейзажный режим
    }
    
    // Какой должна быть анимация?
    // Если карточка включает в себя контент для прокрутки, то на время прокрутки
    // panGestureRecognizer должен находится в состоянии enabled = false
    // В этом случае карточку можно свернуть, если делегат scrollView, включенный в "состав" карточки
    // уведомлен о том, что scrollView достиг верхней точки.
    // Основываясь на этом есть несколько сценариев для dismiss-инга карточки
    // 1) ScrollView достигает верхней точки, палец не на экране,скорость scrollView на момент достижения
    //    верхней точки >= некоторой пороговой скорости
    //    - В этом случае происходит анимация dismissAnimation
    // 2) ScrollView достигает верхней точки, палец не отпускается и пролжает вестись вниз
    //    - В этом случае panGestureRecognizer переводится в состояние enabled = on
    //    dismiss-инг продолжается согласно с логикой метода dismissCardViewController
    
    
    @objc public func dismissCardViewController(_ gesture: UIPanGestureRecognizer) -> Void {
        
        switch gesture.state {
        case .began:
            print("Began")
        case .changed:
            print("Changed")
        case .ended:
            print("Ended")
            dismiss(animated: true, completion: nil)
        default:
            print("Unsupported gesture state")
        }
    }
}
