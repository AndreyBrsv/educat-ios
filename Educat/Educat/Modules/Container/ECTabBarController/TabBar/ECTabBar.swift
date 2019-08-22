import UIKit

public struct ECTabBarLayoutConstants {
    static var tabBarWidthScaleFactor = 0.9 // Множитель ширины панели вкладок
    static var tabBarHeightScaleFactor = 0.1 // Множитель высоты панели вкладок
    static var tabBarCornerRadius = 20.0 // Радиус скругления угловбара
    static var selectorCornerRadius = 5.0 // Радиус скугления углов селектора
    static var itemsStackViewAdditionalMargin = 20.0 // отступ от центров скругляющийх углы бара окружностей
}

public class ECTabBar: UIView, UITabBarDelegate, ECTabBarItemDelegate {
    
    override public class var requiresConstraintBasedLayout: Bool {
        get {
            return true
        }
    }
    
    open var itemsStackViewMargin: Double { // Полный оступ для стека кнопок
        get {
            return ECTabBarLayoutConstants.tabBarCornerRadius + ECTabBarLayoutConstants.itemsStackViewAdditionalMargin
        }
    }

    // MARK: - items (Кнопки бара)
    open var items: [ECTabBarItem] {
        get {
            return itemsStackView.arrangedSubviews as! [ECTabBarItem]
        }
    }
    
    // MARK: - delegate (Делегат бара)
    open var delegate: ECTabBarDelegate?
    
    // MARK: - notificationView (Представление, появляющееся из-за бара с некоторым сообщением)
    open lazy var notificationView: UIView = {
        let notificationView = UIView()
        notificationView.layer.cornerRadius = CGFloat(ECTabBarLayoutConstants.tabBarCornerRadius)
        notificationView.addSubview(notificationViewLabel)
        notificationView.translatesAutoresizingMaskIntoConstraints = false
        return notificationView
    }()
    
    open lazy var notificationViewLabel: UILabel = {
        let notificationViewLabel = UILabel()
        notificationViewLabel.textAlignment = .center
        notificationViewLabel.translatesAutoresizingMaskIntoConstraints = false
        return notificationViewLabel
    }()
    
    // MARK: - container (Контейнер, содержащий в себе фронтальные элементы бара)
    private lazy var container: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.layer.cornerRadius = CGFloat(ECTabBarLayoutConstants.tabBarCornerRadius)
        container.clipsToBounds = true
        container.addSubview(selector)
        container.addSubview(itemsStackView)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    // MARK: - itemsStackView (Горизонтальный StackView, хранящий кнопки бара)
    private lazy var itemsStackView: UIStackView = {
        let itemsStackView = UIStackView()
        itemsStackView.axis = .horizontal
        itemsStackView.alignment = .center
        itemsStackView.distribution = .equalCentering
        itemsStackView.translatesAutoresizingMaskIntoConstraints = false
        return itemsStackView
    }()
    
    // MARK: - selector (Селектор (верхняя ползающая полоска))
    open lazy var selector: UIView = {
        let selector = UIView()
        selector.layer.cornerRadius = CGFloat(ECTabBarLayoutConstants.selectorCornerRadius)
        selector.backgroundColor = .educatLightYellow
        selector.clipsToBounds = true
        selector.translatesAutoresizingMaskIntoConstraints = false
        return selector
    }()
    
    open weak var tabBarController: UITabBarController?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }

    convenience init() {
        self.init(frame: .zero)
    }
    
    func setupView() {
        self.backgroundColor = .white
        self.layer.cornerRadius = CGFloat(ECTabBarLayoutConstants.tabBarCornerRadius)
        self.dropShadow()
        self.addSubview(notificationView)
        self.addSubview(container)
        self.isHidden = true // Делаем скрытым по умолчанию
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            // notificationView
            notificationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            notificationView.trailingAnchor.constraint(equalTo: trailingAnchor),
            notificationView.topAnchor.constraint(equalTo: topAnchor),
            notificationView.bottomAnchor.constraint(equalTo: bottomAnchor),
            // notificationViewLabel
            notificationViewLabel.widthAnchor.constraint(equalTo: notificationView.widthAnchor),
            notificationViewLabel.centerXAnchor.constraint(equalTo: notificationView.centerXAnchor),
            notificationViewLabel.topAnchor.constraint(equalTo: notificationView.topAnchor),
            // container
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.topAnchor.constraint(equalTo: topAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            // itemsStackView
            itemsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(itemsStackViewMargin)),
            itemsStackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: CGFloat(-itemsStackViewMargin)),
            itemsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            itemsStackView.heightAnchor.constraint(equalTo: heightAnchor),
            // selector
            selector.centerYAnchor.constraint(equalTo: topAnchor),
            selector.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15),
            selector.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
        ])
    }
    
    // MARK : Adding items
    open func setItems(_ items: [ECTabBarItem]?) -> Void { // Добавляет кнопки в массив arrangedViews itemStackView
        guard let i = items else { return }
            i.forEach {
                self.itemsStackView.addArrangedSubview($0)
                $0.delegate = self
            }
        selector.centerXAnchor.constraint(equalTo: self.items[0].centerXAnchor).isActive = true
    }
}

// MARK: ECTabBarDelegate
extension ECTabBar {
    
    public func wasTapped(item: ECTabBarItem) -> Void {
        self.items.forEach {
            if $0.isEqual(item) {
                guard let tbc = self.tabBarController else { return }
                tbc.selectedIndex = self.items.firstIndex(of: item)!
                animateSelectorFor(sender: item)
            }
        }
    }
    
    func animateSelectorFor(sender: UIButton) -> Void { // Анимация селектора при нажатии на кнопку
        UIViewPropertyAnimator(duration: 0.1, curve: .easeInOut) {
            self.selector.center.x = CGFloat(self.itemsStackViewMargin) + sender.center.x
        }.startAnimation()
    }
    
    public func animateSelectorToItem(withIndex index: Int) {
        UIViewPropertyAnimator(duration: 0.1, curve: .easeInOut) {
            self.selector.center.x = CGFloat(self.itemsStackViewMargin) + self.items[index].center.x
        }.startAnimation()
    }
}

// MARK: Notification View
struct NotificationViewConstants {
    static let defaultNotificationViewAnimationDuration = 1.0
    static let defaultNotificationViewAnimationDelay = 5.0
    static let defaultNotificationViewAnimationDampingRatio = 0.6
    static let defaultNotificationViewwLayerOpacity: Float = 0.6
}

extension ECTabBar {
    
    public func showNotification(withMessage message: String?, textColor: UIColor?, backgroundColor: UIColor?) {
        showNotification(
            withMessage: message,
            textColor: textColor,
            backgroundColor: backgroundColor,
            opacity: NotificationViewConstants.defaultNotificationViewwLayerOpacity,
            duration: NotificationViewConstants.defaultNotificationViewAnimationDuration,
            delay: NotificationViewConstants.defaultNotificationViewAnimationDelay,
            dampingRatio: NotificationViewConstants.defaultNotificationViewAnimationDampingRatio)
    }
    
    public func showNotification(withMessage message: String?, textColor: UIColor?, backgroundColor: UIColor?, opacity: Float, duration: TimeInterval, delay: TimeInterval, dampingRatio: Double) -> Void {
        
        notificationView.layer.opacity = opacity
        notificationView.backgroundColor = backgroundColor
        notificationViewLabel.text = message
        notificationViewLabel.textColor = textColor ?? .black
        
        let displacement = notificationViewLabel.font.pointSize * CGFloat(notificationViewLabel.numberOfLines) + 10.0
        
        UIViewPropertyAnimator(duration: duration, dampingRatio: CGFloat(dampingRatio)) {
            self.notificationView.center.y -= displacement
        }.startAnimation()
        
        UIViewPropertyAnimator(duration: duration / 3.0, curve: .easeInOut) {
            self.notificationView.center.y += displacement
            self.notificationView.backgroundColor = .clear
        }.startAnimation(afterDelay: delay)
    }
}
