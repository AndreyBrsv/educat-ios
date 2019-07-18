import UIKit

class SWTabBar: UIView, UITabBarDelegate, SWTabBarItemDelegate {
    
    open var tabBarCornerRadius: Double = 25.0 // Радиус скругления углов бара
    
    open var itemsStackViewAdditionalMargin: Double = 10.0 // Дополнительный отступ для стека кнопок
    
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
    
    open var delegate: SWTabBarDelegate? // Делегат бара
    
    private var itemsStackView = UIStackView() // Горизонтальный StackView, хранящий кнопки бара
    
    private var selector = UIView() // Селектор (верхняя ползающая полоска)
    
    
    /// Инициализатор
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.layer.cornerRadius = CGFloat(tabBarCornerRadius)
        
        configureHorizontalStackView()
        configureSelector()
        
        self.isHidden = true // Делаем скрытым пол умолчанию
        self.clipsToBounds = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    /// Настройка горизональной стопки
    private func configureHorizontalStackView() -> Void {
        
        self.addSubview(itemsStackView)
        
        // Тут проводится дополнительная настройка стопки
        
        itemsStackView.axis = .horizontal
        itemsStackView.alignment = .center
        itemsStackView.distribution = .equalCentering
        
        configureTabBarStackViewConstraints()
    }
    // Настройка ограничений горизонтальной стопки
    private func configureTabBarStackViewConstraints() -> Void {
        
        itemsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        itemsStackView.leadingAnchor.constraint(
            equalTo: self.leadingAnchor,
            constant: CGFloat(itemsStackViewMargin)).isActive = true
        
        itemsStackView.trailingAnchor.constraint(
            equalTo: self.trailingAnchor,
            constant: CGFloat(-itemsStackViewMargin)).isActive = true
        
        itemsStackView.bottomAnchor.constraint(
            equalTo: self.bottomAnchor).isActive = true
        
        itemsStackView.heightAnchor
            .constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    
    /// Настройки селектора
    private func configureSelector() -> Void {
        
        self.addSubview(selector)
        
        self.selector.layer.cornerRadius = CGFloat(selectorCornerRadius)
        self.selector.backgroundColor = .educatLightYellow
        configureSelectorConstraints()
    }
    // Настройки ограничений слектора
    private func configureSelectorConstraints() -> Void {
        
        self.selector.translatesAutoresizingMaskIntoConstraints = false
        
        self.selector.centerYAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.selector.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15).isActive = true
        self.selector.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    
    
    
    /// Настройка ограничений бара
    public func configureTabBarConstraints() -> Void {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let tabBarControllerView = self.superview!
        
        self.bottomAnchor
            .constraint(
                equalTo: tabBarControllerView.safeAreaLayoutGuide.bottomAnchor
            ).isActive = true
        
        self.heightAnchor.constraint(
            equalTo: tabBarControllerView.safeAreaLayoutGuide.heightAnchor,
            multiplier: CGFloat(tabBarHeightScaleFactor)).isActive = true
        
        self.widthAnchor.constraint(
            equalTo: tabBarControllerView.safeAreaLayoutGuide.widthAnchor,
            multiplier: CGFloat(tabBarWidthScaleFactor)).isActive = true
        
        self.centerXAnchor.constraint(equalTo: tabBarControllerView.centerXAnchor).isActive = true
    }
    
    func wasTapped(item: UIButton) -> Void {
        animateSelectorFor(sender: item)
    }
    
    /// Метод для анимации селектора
    /// Перемещает селектор при нажатии на кнопку
    func animateSelectorFor(sender: UIButton) -> Void {
        UIView.animate(withDuration: 0.2) {
            self.selector.center.x = CGFloat(self.itemsStackViewMargin) + sender.center.x
        }
    }
    
    /// Добавляет items в массив
    open func setItems(_ items: [SWTabBarItem]?) -> Void {
        if let i = items {
            i.forEach {
                self.itemsStackView.addArrangedSubview($0)
                $0.delegate = self
                print($0)
            }
        }
    }
    
    /// Реализация метода делегата
    
}
