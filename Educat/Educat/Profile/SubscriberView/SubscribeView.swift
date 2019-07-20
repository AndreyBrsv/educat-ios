
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
        
       // configureSubscribeButton()
    
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
    func configureSelf() {
        self.clipsToBounds = true
        //self.layer.cornerRadius = CGFloat(viewCornerRadius)
        
        self.backgroundColor = .educatLightGray
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 73).isActive = true;
        self.widthAnchor.constraint(equalTo: superview!.widthAnchor, multiplier: 0.9).isActive = true
        self.centerXAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        
        
        publicationsTitle.text = "Публикации"
        self.addSubview(publicationsTitle)
        publicationsTitle.translatesAutoresizingMaskIntoConstraints = false
        publicationsTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        //publicationsTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive = true
        
//        self.addSubview(publications)
//        publications.translatesAutoresizingMaskIntoConstraints = false
//        publications.centerXAnchor.constraint(equalTo: publicationsTitle.centerXAnchor).isActive = true
//        publications.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 10).isActive = true
//
        self.addSubview(publicationsSubscribersDelimeter)
        publicationsSubscribersDelimeter.backgroundColor = .educatCorall
        publicationsSubscribersDelimeter.translatesAutoresizingMaskIntoConstraints = false
        publicationsSubscribersDelimeter.leadingAnchor.constraint(equalTo: publicationsTitle.trailingAnchor, constant: 10).isActive = true
//        publicationsSubscribersDelimeter.centerYAnchor.constraint(equalTo: superview!.centerYAnchor).isActive = true
        publicationsSubscribersDelimeter.heightAnchor.constraint(equalToConstant: CGFloat(50)).isActive = true
        publicationsSubscribersDelimeter.widthAnchor.constraint(equalToConstant: 3).isActive = true
//       // publicationsSubscribersDelimeter.layer.cornerRadius = publicationsSubscribersDelimeter.frame.width / 2.0
//
//
//
        subscribersTitle.text = "Подписчики"
        self.addSubview(subscribersTitle)
        subscribersTitle.translatesAutoresizingMaskIntoConstraints = false
        subscribersTitle.leadingAnchor.constraint(equalTo: publicationsSubscribersDelimeter.trailingAnchor, constant: 10).isActive = true
//        subscribersTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive = true
//
//        self.addSubview(subscribers)
//        subscribers.translatesAutoresizingMaskIntoConstraints = false
//        subscribers.centerXAnchor.constraint(equalTo: subscribersTitle.centerXAnchor).isActive = true
//        subscribers.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 10).isActive = true
//
        subscribeButton.setTitle("Подписаться", for: .normal)
        subscribeButton.backgroundColor = .educatLightYellow
        self.addSubview(subscribeButton)
        subscribeButton.translatesAutoresizingMaskIntoConstraints = false
        subscribeButton.leadingAnchor.constraint(equalTo: subscribersTitle.trailingAnchor, constant: 10).isActive = true
        subscribeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        subscribeButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        subscribeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
     
    }
    
    
    
    // Метод, конфигурирующий кнопку
    private func configureSubscribeButton() -> Void {
        subscribeButton.addTarget(
            self,
            action: #selector(tapOnSubscribeButton(sender:)),
            for: .touchUpOutside
        )
    }
    
    
    private func subscribeButtonStateIf(state: Bool) -> Void {
        
    }
}
