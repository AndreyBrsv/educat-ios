import UIKit

class EducatTabBar: UIView {
    
    var tabBarCornerRadius: Double {
        return 20.0
    }
    var selectorCornerRadius: Double {
        return 5.0
    }
    
    private var tabBarButtonsStackView: UIStackView!
    private var tabBarSelector: UIView!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = CGFloat(tabBarCornerRadius)
        configureConstraints()
        configureHorizontalStackView()
        
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
        tabBarButtonsStackView = UIStackView()
        self.addSubview(tabBarButtonsStackView)
        // Тут проводится дополнительная настройка стопки
        configureTabBarStackViewConstraints()
    }
    // Настройка ограничений горизонтальной стопки
    private func configureTabBarStackViewConstraints() -> Void {
        tabBarButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
    
    /// Настройки селектора
    private func configureSelector() -> Void {
        tabBarSelector = UIView()
        // Нужно задать размеры селектора
        tabBarSelector.layer.cornerRadius = CGFloat(selectorCornerRadius)
        configureTabBarStackViewConstraints()
        self.addSubview(tabBarSelector)
    }
    // Настройки ограничений слектора
    private func configureSelectorConstraints() -> Void {
        tabBarSelector.translatesAutoresizingMaskIntoConstraints = false
        tabBarSelector.centerYAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
    
    
    
    
    /// Настройка ограничений бара
    private func configureConstraints() -> Void {
        
    }
    
}
