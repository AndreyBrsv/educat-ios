import UIKit

class SWTabBar: UIView, UITabBarDelegate {
    
    /// Радиус скругления углов бара
    public var tabBarCornerRadius: Double = 20.0
    
    /// Радиус скругления селектора
    public var selectorCornerRadius: Double = 5.0
    
    /// Множители для определения размера бара относительно safeArea
    public var tabBarWidthScaleFactor: Double = 0.9
    public var tabBarHeightScaleFactor: Double = 0.1

    /// Коллекция кнопок
    private(set) var items: [SWTabBarItem] = []
    
    /// Делегат бара
    public var delegate: SWTabBarDelegate?
    
    
    private var tabBarButtonsStackView: UIStackView!
    private var tabBarSelector: UIView!
    
    
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
    func configureHorizontalStackView() -> Void {
        
        tabBarButtonsStackView = UIStackView()
        self.addSubview(tabBarButtonsStackView)
        
        // Тут проводится дополнительная настройка стопки
        
        tabBarButtonsStackView.axis = .horizontal
        tabBarButtonsStackView.alignment = .center
        tabBarButtonsStackView.distribution = .equalSpacing
        tabBarButtonsStackView.spacing = CGFloat(10.0)
        
        configureTabBarStackViewConstraints()
    }
    // Настройка ограничений горизонтальной стопки
    private func configureTabBarStackViewConstraints() -> Void {
        
        tabBarButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        tabBarButtonsStackView.leadingAnchor.constraint(
            equalTo: self.leadingAnchor,
            constant: CGFloat(tabBarCornerRadius)).isActive = true
        
        tabBarButtonsStackView.trailingAnchor.constraint(
            equalTo: self.trailingAnchor,
            constant: CGFloat(-tabBarCornerRadius)).isActive = true
        
        tabBarButtonsStackView.bottomAnchor.constraint(
            equalTo: self.bottomAnchor).isActive = true
        
        tabBarButtonsStackView.heightAnchor
            .constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    
    /// Настройки селектора
    func configureSelector() -> Void {
        tabBarSelector = UIView()
        tabBarSelector.backgroundColor = .educatLightYellow
        
        // Нужно задать размеры селектора
        tabBarSelector.layer.cornerRadius = CGFloat(selectorCornerRadius)
        self.addSubview(tabBarSelector)
        
        configureSelectorConstraints()
    }
    // Настройки ограничений слектора
    private func configureSelectorConstraints() -> Void {
        
        tabBarSelector.translatesAutoresizingMaskIntoConstraints = false
        
        tabBarSelector.centerYAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tabBarSelector.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        tabBarSelector.heightAnchor.constraint(equalToConstant: 12).isActive = true
        tabBarSelector.widthAnchor.constraint(equalToConstant: 35).isActive = true
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
    
    
    /// Метод для анимации селектора
    /// Перемещает селектор при нажатии на кнопку
    @objc func animateSelectorFor(sender: UIButton) -> Void {
        self.tabBarSelector.centerXAnchor.constraint(equalTo: sender.centerXAnchor).isActive = true
        UIView.animate(withDuration: 0.5) {
            self.layoutIfNeeded()
        }
    }
    
    /// Добавляет items в массив
    public func setItems(_ items: [SWTabBarItem]?) -> Void {
        if let i = items {
            i.forEach {self.items.append($0)}
        }
    }
    
    /// Реализация метода делегата
    
}
