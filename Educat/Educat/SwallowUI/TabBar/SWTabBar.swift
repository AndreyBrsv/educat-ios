import UIKit

class SWTabBar: UIView, UITabBarDelegate, SWTabBarItemDelegate {
    
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

    var items: [SWTabBarItem] { // Кнопки бара
        get {
            return itemsStackView.arrangedSubviews as! [SWTabBarItem]
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
    
    open var delegate: SWTabBarDelegate? // Делегат бара
    
    private var itemsStackView = UIStackView() // Горизонтальный StackView, хранящий кнопки бара
    
    private var selector = UIView() // Селектор (верхняя ползающая полоска)
    
    open weak var tabBarController: UITabBarController!
    
    
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.layer.cornerRadius = CGFloat(tabBarCornerRadius)
        
        configureItemsStackView()
        configureSelector()
        
        self.isHidden = true // Делаем скрытым по умолчанию
        self.clipsToBounds = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureItemsStackView() -> Void { // Настройка itemsStackView
        
        self.addSubview(itemsStackView)
        
        // Тут проводится дополнительная настройка стопки
        
        itemsStackView.axis = .horizontal
        itemsStackView.alignment = .center
        itemsStackView.distribution = .equalCentering
        
        configureTabBarStackViewConstraints()
    }
    
    private func configureTabBarStackViewConstraints() -> Void { // Настройка ограничений itemsStackView
        
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
    
    func wasTapped(item: UIButton) -> Void { // Метод, вызываем
        self.items.forEach {
            if $0.isEqual(item) {
                self.tabBarController.selectedIndex = self.items.firstIndex(of: item as! SWTabBarItem)!
            }
        }
        
        animateSelectorFor(sender: item)
    }
    
    func animateSelectorFor(sender: UIButton) -> Void { // Анимация селектора при нажатии на кнопку
        UIView.animate(withDuration: 0.2) {
            self.selector.center.x = CGFloat(self.itemsStackViewMargin) + sender.center.x
        }
    }
    
    open func setItems(_ items: [SWTabBarItem]?) -> Void { // Добавляет кнопки в массив arrangedViews itemStackView
        if let i = items {
            i.forEach {
                self.itemsStackView.addArrangedSubview($0)
                $0.delegate = self
            }
            configureSelectorConstraints()
        }
    }
    
}
