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

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Настройка горизональной стопки
    private func configureHorizontalStackView() -> Void {
        tabBarButtonsStackView = UIStackView()
        // Тут проводится дополнительная настройка стопки
        self.addSubview(tabBarButtonsStackView)
    }
    
    // Настройки селектора
    private func configureSelector() -> Void {
        tabBarSelector = UIView()
        tabBarSelector.layer.cornerRadius = CGFloat(selectorCornerRadius)
        tabBarSelector.clipsToBounds = true
        //
        self.addSubview(tabBarSelector)
    }
    
    // Настройка ограничений бара
    private func configureConstraints() -> Void {
        
    }
    
}
