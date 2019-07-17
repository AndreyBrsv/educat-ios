import UIKit

class SWTabBar: UIView, UITabBarDelegate, SWTabBarItemDelegate {
    
    /// Радиус скругления углов бара
    public var tabBarCornerRadius: Double = 20.0
    /// Дополнительный отступ для стека кнопок
    public var itemsStackViewAdditionalMargin: Double = 10.0
    /// Полный отступ для стека кнопок
    public var itemsStackViewMargin: Double {
        get {
            return tabBarCornerRadius + itemsStackViewAdditionalMargin
        }
    }
    
    /// Радиус скругления селектора
    public var selectorCornerRadius: Double = 5.0
    
    /// Множители для определения размера бара относительно safeArea
    public var tabBarWidthScaleFactor: Double = 0.9
    public var tabBarHeightScaleFactor: Double = 0.1

    /// Коллекция кнопок
    private(set) var items: [SWTabBarItem] = []
    
    /// Делегат бара
    public var delegate: SWTabBarDelegate?
    
    
    private var itemsStackView = UIStackView()
    private var selector = UIView()
    
    
    /// Инициализатор
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.layer.cornerRadius = CGFloat(tabBarCornerRadius)
        
        configureHorizontalStackView()
        configureSelector()
        
        // По умолчанию делаем его скрытым. Кастомный бар
        // показывается тогда, когда при инициализации приложения
        // определяем модель iPhone
        self.isHidden = true
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
        itemsStackView.distribution = .equalSpacing
        itemsStackView.spacing = CGFloat(10.0)
        
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
        //self.selector.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.selector.heightAnchor.constraint(equalToConstant: 12).isActive = true
        self.selector.widthAnchor.constraint(equalToConstant: 35).isActive = true
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
                self.items.append($0)
                self.itemsStackView.addArrangedSubview($0)
                $0.delegate = self
            }
        }
    }
    
    /// Реализация метода делегата
    
}
