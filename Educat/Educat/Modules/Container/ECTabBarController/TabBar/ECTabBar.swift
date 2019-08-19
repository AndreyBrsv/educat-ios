import UIKit

public struct ECTabBarLayoutConstants {
    static var tabBarWidthScaleFactor = 0.9 // Множитель ширины панели вкладок
    static var tabBarHeightScaleFactor = 0.1 // Множитель высоты панели вкладок
    static var tabBarCornerRadius = 20.0 // Радиус скругления угловбара
    static var selectorCornerRadius = 5.0 // Радиус скугления углов селектора
    static var itemsStackViewAdditionalMargin = 20.0 // отступ от центров скругляющийх углы бара окружностей
}

public class ECTabBar: UIView, UITabBarDelegate, ECTabBarItemDelegate {
    
    open var itemsStackViewMargin: Double { // Полный оступ для стека кнопок
        get {
            return ECTabBarLayoutConstants.tabBarCornerRadius + ECTabBarLayoutConstants.itemsStackViewAdditionalMargin
        }
    }

    open var items: [ECTabBarItem] { // Кнопки бара
        get {
            return itemsStackView.arrangedSubviews as! [ECTabBarItem]
        }
    }
    
    open var delegate: ECTabBarDelegate? // Делегат бара
    
    // MARK: Notification View
    open var notificationView = UIView() // Представление, появляющееся из-за бара с некоторым сообщением
    
    open var notificationViewLabel = UILabel() // То самое сообщение
    
    // MARK: Container View
    private var container = UIView()
    
    private var itemsStackView = UIStackView() // Горизонтальный StackView, хранящий кнопки бара
    
    open var selector = UIView() // Селектор (верхняя ползающая полоска)
    
    open weak var tabBarController: UITabBarController?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init() {
        self.init(frame: .zero)

        self.backgroundColor = .white
        self.layer.cornerRadius = CGFloat(ECTabBarLayoutConstants.tabBarCornerRadius)
        self.dropShadow()
        
        // Добвляем представление для уведомлений
        self.addSubview(notificationView)
        notificationView.layer.cornerRadius = CGFloat(ECTabBarLayoutConstants.tabBarCornerRadius)
        
        notificationView.addSubview(notificationViewLabel)
        notificationViewLabel.textAlignment = .center

        // Добвляем контейнер
        self.addSubview(container)
        container.addSubview(selector)
        container.addSubview(itemsStackView)
        container.backgroundColor = .white
        container.layer.cornerRadius = CGFloat(ECTabBarLayoutConstants.tabBarCornerRadius)
        
        itemsStackView.axis = .horizontal
        itemsStackView.alignment = .center
        itemsStackView.distribution = .equalCentering
        
        self.selector.layer.cornerRadius = CGFloat(ECTabBarLayoutConstants.selectorCornerRadius)
        self.selector.backgroundColor = .educatLightYellow

        self.isHidden = true // Делаем скрытым по умолчанию
        container.clipsToBounds = true
    }
    
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        itemsStackView.translatesAutoresizingMaskIntoConstraints = false
        selector.translatesAutoresizingMaskIntoConstraints = false
        container.translatesAutoresizingMaskIntoConstraints = false
        notificationView.translatesAutoresizingMaskIntoConstraints = false
        notificationViewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            notificationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            notificationView.trailingAnchor.constraint(equalTo: trailingAnchor),
            notificationView.topAnchor.constraint(equalTo: topAnchor),
            notificationView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            notificationViewLabel.widthAnchor.constraint(equalTo: notificationView.widthAnchor),
            notificationViewLabel.centerXAnchor.constraint(equalTo: notificationView.centerXAnchor),
            notificationViewLabel.topAnchor.constraint(equalTo: notificationView.topAnchor),
            
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.topAnchor.constraint(equalTo: topAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            itemsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(itemsStackViewMargin)),
            itemsStackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: CGFloat(-itemsStackViewMargin)),
            itemsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            itemsStackView.heightAnchor.constraint(equalTo: heightAnchor),
            
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
extension ECTabBar: ECTabBarDelegate {
    
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
