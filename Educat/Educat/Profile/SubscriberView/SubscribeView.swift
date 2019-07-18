
import UIKit

class SubscribeView: UIView {
    
    open var delegate: SubscriberViewDelegate? // Делегат
    
    open var viewCornerRadius = 20.0 // Радиус скругления
    
    private var publicationsTitle: UILabel = UILabel() //
    
    open var publications: UILabel = UILabel() // Количество публикаций
    
    private var publicationsSubscribersDelimeter: UIView = UIView()
    
    private var subscribersTitle: UILabel = UILabel()
    
    var subscribers: UILabel = UILabel() // Количество подписчиков
    
    var subscribeButton: UIButton = UIButton() // Кнопка подписаться
    
    private var subscribeValue = false // Значение признака подписан или нет
    
    open var subscribed: Bool { // Признак подписан или нет
        get {
            return self.subscribeValue
        }
        set {
            subscribeButtonStateIf(state: newValue)
            self.subscribeValue = newValue
        }
    }
    
    init(publications: String, subscribers: String, subscribed: Bool) {
        
        super.init(frame: CGRect.zero)
        
        self.publications.text = publications
        self.subscribers.text = subscribers
        self.subscribed = subscribed
        
        configureSubscribeButton()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    /// Методы, отвечающие взаимодействию интерфейса
    @objc func tapOnSubscribeButton(sender: UIButton) -> Void {
        if !subscribed {
            // Изменить индикатор кнопки
            delegate?.subscribe()
        } else {
            // Изменить индикатор кнопки
            delegate?.unsubscribe()
        }
    }
    
    
    
    /// Конфигурационные методы
    private func configureSelf() {
        self.clipsToBounds = true
        self.layer.cornerRadius = CGFloat(viewCornerRadius)
        
    }
    // Метод, конфигурирующий кнопку
    private func configureSubscribeButton() -> Void {
        subscribeButton.addTarget(
            self,
            action: #selector(tapOnSubscribeButton(sender:)),
            for: .touchUpOutside
        )
        self.addSubview(subscribeButton)
        configureButtonConstraints()
    }
    private func configureButtonConstraints() -> Void {
        
        subscribeButton.translatesAutoresizingMaskIntoConstraints = false
        
        subscribeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        subscribeButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        subscribeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    
    private func subscribeButtonStateIf(state: Bool) -> Void {
        
    }
}
