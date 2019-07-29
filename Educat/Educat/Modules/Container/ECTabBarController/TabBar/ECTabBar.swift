import UIKit

public class ECTabBar: UIView, UITabBarDelegate, ECTabBarItemDelegate {
    
    open var tabBarCornerRadius: Double = 20.0 // Радиус скругления углов бара
    
    open var itemsStackViewAdditionalMargin: Double = 20.0 // Дополнительный отступ для стека кнопок
    
    open var itemsStackViewMargin: Double { // Полный оступ для стека кнопок
        get {
            return tabBarCornerRadius + itemsStackViewAdditionalMargin
        }
    }
    
    open var selectorCornerRadius: Double = 5.0 // Радиус скругления селектора
    
    open var tabBarWidthScaleFactor: Double = 0.9 // Доля ширины бара от ширины safeArea
    
    open var tabBarHeightScaleFactor: Double = 0.1 // Доля высоты бара от высоты safeArea

    var items: [ECTabBarItem] { // Кнопки бара
        get {
            return itemsStackView.arrangedSubviews as! [ECTabBarItem]
        }
    }
    
    open var selectorColor: UIColor? { // Цвет селектора
        get {
            return self.selector.backgroundColor
        }
        set {
            self.selector.backgroundColor = newValue
        }
    }
    
    open var selectorLayer: CALayer { // Layer
        get {
            return self.selector.layer
        }
    }
    
    open var delegate: ECTabBarDelegate? // Делегат бара
    
    private var itemsStackView = UIStackView() // Горизонтальный StackView, хранящий кнопки бара
    
    private var selector = UIView() // Селектор (верхняя ползающая полоска)
    
    open weak var tabBarController: UITabBarController!

    var v: String

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init() {
        self.init(frame: .zero)

        self.backgroundColor = .white
        self.layer.cornerRadius = CGFloat(tabBarCornerRadius)

        configureItemsStackView()
        configureSelector()

        self.isHidden = true // Делаем скрытым по умолчанию
        self.clipsToBounds = true
    }
    
    private func configureItemsStackView() -> Void { // Настройка itemsStackView
        
        self.addSubview(itemsStackView)
        
        // Тут проводится дополнительная настройка стопки
        
        itemsStackView.axis = .horizontal
        itemsStackView.alignment = .center
        itemsStackView.distribution = .equalCentering

        itemsStackView.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            self.itemsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat(itemsStackViewMargin)),
            self.itemsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: CGFloat(-itemsStackViewMargin)),
            self.itemsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.itemsStackView.heightAnchor.constraint(equalTo: self.heightAnchor),
        ]

        NSLayoutConstraint.activate(constraints)
    }
    
    private func configureSelector() -> Void { // Настройки селектора
        
        self.addSubview(selector)
        
        self.selector.layer.cornerRadius = CGFloat(selectorCornerRadius)
        self.selector.backgroundColor = .educatLightYellow
        
    }
    
    private func configureSelectorConstraints() -> Void { // Настройки ограничений слектора
        
        self.selector.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = [
            self.selector.centerYAnchor.constraint(equalTo: self.topAnchor),
            self.selector.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15),
            self.selector.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),
        ]
            
        if self.items.count != 0 {
            constraints.append(self.selector.centerXAnchor.constraint(equalTo: self.items[0].centerXAnchor))
        }
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    public func configureTabBarConstraints() -> Void { // Настройки ограничений бара
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let tabBarControllerView = self.superview!
        
        let constraints = [
            self.bottomAnchor.constraint(equalTo: tabBarControllerView.safeAreaLayoutGuide.bottomAnchor),
            self.heightAnchor.constraint(equalTo: tabBarControllerView.safeAreaLayoutGuide.heightAnchor, multiplier: CGFloat(tabBarHeightScaleFactor)),
            self.widthAnchor.constraint(equalTo: tabBarControllerView.safeAreaLayoutGuide.widthAnchor, multiplier: CGFloat(tabBarWidthScaleFactor)),
            self.centerXAnchor.constraint(equalTo: tabBarControllerView.centerXAnchor),
            ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    public func wasTapped(item: UIButton) -> Void { // Метод, вызываем
        self.items.forEach {
            if $0.isEqual(item) {
                self.tabBarController.selectedIndex = self.items.firstIndex(of: item as! ECTabBarItem)!
            }
        }
        
        animateSelectorFor(sender: item)
    }
    
    func animateSelectorFor(sender: UIButton) -> Void { // Анимация селектора при нажатии на кнопку
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            usingSpringWithDamping: 0.4,
            initialSpringVelocity: 0,
            options: .curveEaseIn,
            animations: {self.selector.center.x = CGFloat(self.itemsStackViewMargin) + sender.center.x} ,
            completion: nil
        )
    }
    
    open func setItems(_ items: [ECTabBarItem]?) -> Void { // Добавляет кнопки в массив arrangedViews itemStackView
        if let i = items {
            var index = 0
            i.forEach {
                self.itemsStackView.addArrangedSubview($0)
                $0.delegate = self
                $0.setImage(
                    delegate?.getIconForItem(withIndex: index),
                    for: .normal
                )
                index += 1
            }
            configureSelectorConstraints()
        }
    }
    
}
