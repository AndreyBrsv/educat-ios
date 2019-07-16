
import UIKit

class SubscribeView: UIView {
    
    var delegate: SubscriberViewDelegate?
    
    var viewCornerRadius: Double {
        return 20.0
    }
    
    private var publicationsTitle: UILabel = UILabel()
    var publications: UILabel = UILabel()
    
    private var publicationsSubscribersDelimeter: UIView = UIView()
    
    private var subscribersTitle: UILabel = UILabel()
    var subscribers: UILabel = UILabel()
    
    var subscribeButton: UIButton = UIButton()
    var subscribed = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
    
    
    
}
